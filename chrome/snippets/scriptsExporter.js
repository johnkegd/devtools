void function(){
"use strict"
/*
* Manage and Import / Export snippets from chrome (2016)
* hacked together by: http://github.com/soundyogi
* inspired by: https://github.com/bgrins/devtools-snippets/blob/master/import-export/chrome/devtools_import_export.js
* ALPHA / SILLY SIDE PROJECT 
*/


let_us("execute some init tests", () => {
  if(location.origin !== "chrome-devtools://devtools") throw Error("not in devtools of devtools / please inspect devtools again (ctrl+shift+i)")
  ok(location.origin === "chrome-devtools://devtools", 'we are in devtools of devtools, good to go')
})


const state = {
  scriptSnippets: [],
}
window.state = state


const style = `
<style>
body{
  margin: 0;
  padding: 0;
}
grid {
  display: flex;
  align-items: center;
  justify-content: center;
  -webkit-flex-flow: column;
}
column {
  display: flex;
  -webkit-flex-flow: column;
  width: 30vw;
}
row {
  display: flex;
  -webkit-flex-flow: row;
  width: 90vw;
  margin-bottom: 2vh;
}
item {
  background: tomato;
  min-height: 13vh;
  color: white;
  font-weight: bold;
  font-size: 1.5em;
  text-align: center;
  padding: 20px;
}
#drop_files {
    opacity: 0;
    width: 100%;
    height: 20vh;
}
dropzone {
  cursor: pointer;
  border: 1px black dotted;
  font-weight: bold;
  font-size: 1em;
  text-align: center;
}
</style>
`

const markup = `
<grid>
  <row>
      <column>
      <item> load chrome snippets:
        <button id="init">(re)init</button>
      </item>
      </column>
      <column>
      <item>
        <label>on name conflicts:
          <select id='rename'>
            <option value='true'>Rename Import Files</option>
            <option value="false">Overwrite Snippets</option>
          </select>
        </label>
      </item>
      </column>
      <column>
      <item>
        <button id="export_snippets">export</button>
        <select id='format'>
          <option value="json">Single .json</option>
          <option value="js">Multiple .js</option>
        </select>
      </item>
      </column>
      <column>
      <item>
        <button id="save_snippets">Save to Chrome</button>
      </item>
      </column>
      <column>
      <item>
        <button id="reset_snippets">DELETE all on Chrome</button>
      </item>
      </column>
  </row>
  <row>
  <column>
    <dropzone>
      <div>Click/Drop .js or .json</div>
      <input id="drop_files" type='file' multiple='true'/>
    </dropzone>
    <label>append files or replace everything?
      <select id='append'>
        <option value='true'>Append</option>
        <option value="false">Replace</option>
      </select>
    </label>
  </column>
  <column>===== snippets preview =====<ul id="state.scriptSnippets"></ul></column>
  <column>import files from external sources:
  <button id="external_bgrins">load some scripts from bgrins/devtools-snippets repo</button>
  <button id="external_bahmutov">load some scripts from bahmutov/code-snippets repo</button>
  </column>
  </row>
</grid>
`


/* Main logic 
*/
const app_window = create_window("menubar=false, height=700, width=1000", "chrome snippets import/export - ALPHA USE AT OWN RISK")
const document = app_window.document

let_us("bootstrap the whole thing", () => {
  init()
})

function init(){
  setupGUI()

  state.scriptSnippets = []
  state.lastIdentifier = 0
  state.gui_switches = {
    rename: true,
    format: "json",
    review: false,
    append: true
  }

  InspectorFrontendHost.getPreferences( prefs => {
    const lastScriptSnippets = prefs.scriptSnippets
    state.scriptSnippets = deserialize(lastScriptSnippets)
    state.lastIdentifier = prefs.scriptSnippets_lastIdentifier

    update()
  })
}


function setupGUI(){
  app_window.document.body.innerHTML = style+markup
//   getID("format").on("change", "handle_gui_switches")
//   getID("rename").on("change", "handle_gui_switches")
//   getID("append").on("change", "handle_gui_switches")

//   getID("drop_files").on("change", "import_files")

//   getID("export_snippets").on("click", "export_snippets")
//   getID("init").on("click", init)
//   getID("save_snippets").on("click", "save_snippets")
  getID("reset_snippets").on("click", "reset_snippets")

//   getID("external_bgrins").on("click", "external_bgrins")
//   getID("external_bahmutov").on("click", "external_bahmutov")
}


function handle_gui_switches(ev){
    const target = ev.target
    const opt = state.gui_switches

    if(target.id === 'format') {
      opt.format = target.value
      return update()
    }
    if(target.id === 'rename') {
      opt.rename = !target.value
      return update()
    }
    if(target.id === 'review') {
      opt.review = !opt.review
      return update()
    }
    if(target.id === 'append') {
      opt.append = !target.value
      return update()
    }
}


function update(){
    render_list()
    console.log(state.gui_switches)
    console.log("hola");
}

function render_list(){
    const ul = app_window.document.getElementById("state.scriptSnippets")
    ul.innerHTML = ''
    
    state.scriptSnippets.forEach((snippet)=>{
      const li = document.createElement('li')
      //const a = document.createElement('a')
      //a.href = snippet.name
      li.innerHTML = snippet.name
      //li.appendChild(a)
      ul.appendChild(li)
    })
}


/* Helpers
*/


function import_files(event){
  if(!state.gui_switches.append) state.scriptSnippets = []

  const files = event.target.files
  const stack = Object.keys(files)
    .forEach((key)=>{
      const file = files[key]
      const reader = new FileReader()
      reader.fileName = file.name
      reader.onerror = (()=> {throw Error})
      reader.onabort = (()=> {throw Error})
      reader.onload = file_loaded
      reader.readAsText(file)
    })
}


function file_loaded(event){
  const content_string = event.target.result
  const fileName = event.target.fileName
  const fileNameNoExt = /(.+?)(\.[^.]*$|$)/.exec(fileName)[1]
  const ext = /\.[0-9a-z]+$/.exec(fileName)[0]

  if(ext === ".json") return import_json(content_string)
  return add_snippet(fileNameNoExt, content_string)
}

function import_json(content_string){
  var json_data = deserialize(content_string)
  json_data.snippets.forEach(snippet => {
    add_snippet(snippet.name, snippet.content)
  })
}

function set_pref(name, data_string){
  InspectorFrontendHost.setPreference(name, data_string)
}


function save_snippets(){
  set_pref( "scriptSnippets", serialize(state.scriptSnippets) )
  set_pref( "scriptSnippets_lastIdentifier", state.lastIdentifier)
  prompt('restart chrome now!')
}


function reset_snippets(){
//   var choice = window.confirm("DELETE ALL SNIPPETS IN DEVTOOLS?")
//   if(choice) clear_chrome_snippets()
//   init()
console.log("white ? ");
}

function clear_chrome_snippets(){
  set_pref("scriptSnippets", "[]")
  set_pref("scriptSnippets_lastIdentifier", "0")
}

function add_snippet(name, snippet_content_string){
  if(is_duplicate(name, state.scriptSnippets)) {
    if(!state.gui_switches.rename) return state.scriptSnippets[name] = snippet_content_string
    return add_snippet(name+"copy", snippet_content_string)
  }

  const currentIdentifier = serialize(parseInt(state.lastIdentifier)+1)
  const new_snip = {
    content: snippet_content_string,
    id: currentIdentifier,
    name: name 
  }

  state.scriptSnippets.push( new_snip )
  state.lastIdentifier = currentIdentifier
  update()        
}

function external_bgrins(){

    const brings_snippets = [
    'allcolors',
    'cachebuster',
    'cssreload',
    'cssprettifier',
    'hashlink'
  ]

  brings_snippets.forEach((snippet)=>{
    request('https://raw.githubusercontent.com/bgrins/devtools-snippets/master/snippets/'+snippet+'/'+snippet+'.js', function(request){
      const snippet_content_string = request.target.response
      add_snippet(snippet, snippet_content_string)
    })
  })
}

function external_bahmutov(){

    const bahmutov_snippets = [
    'timing',
    'profile-method-call',
    'time-method-call'
  ]

  bahmutov_snippets.forEach((snippet)=>{
    request('https://raw.githubusercontent.com/bahmutov/code-snippets/master/'+snippet+'.js', function(request){
      const snippet_content_string = request.target.response
      add_snippet(snippet, snippet_content_string)
    })
  })
}

function export_snippets(){
    if(state.gui_switches.format === "json") return download_json()
    return download_js()
}

function download_js(){
    state.scriptSnippets.forEach((snippet)=>{
        download(snippet.name+'.js', snippet.content)
    })
}

function download_json(){
  console.log("json")
    const fileName = serialize(Date())
    const json_data = serialize({'snippets': state.scriptSnippets}, ['snippets', 'name', 'content'], 2)
    download(fileName+".json", json_data)
}



/* util & shorthand
*/
function request(url, success) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url);
    xhr.onload = success;
    xhr.send();
  return xhr;
}


function getID(id){
    const element =  app_window.document.getElementById(id)
    element.on = function on(event_name, fn){
      this.addEventListener(event_name, fn)
      return this
    }
    return element
}


function serialize(object, ...rest){
  if(!object) throw Error("serialize needs an object")
  return JSON.stringify(object, ...rest)
}


function deserialize(string){
  if(typeof string !== "string") throw Error("deserialize needs a string")
  if(string === "") throw Error("no snippets present")
  return JSON.parse(string)
}

function download(name, data){
   const Blob = new window.Blob([data],{
        'type': 'text/utf-8'
    })
    const a = document.createElement('a')
    
    a.href = URL.createObjectURL(Blob)
    a.download = name
    a.click()
}


function is_duplicate(name, snippets_arr){
  const result = snippets_arr.filter(function(snippet){
    return snippet.name === name
  })

  if(result.length === 0) return false
  return true
}


function create_window(options, title){
  const w = window.open("", "", options)
  w.document.title = title
  return w
}


/* 
* UNIT TESTS
*/
let_us("write some tests", ()=>{
  // TODO
  // TDD tests are deleted now / remove harness
})


/* Nanoharness 
*/
function let_us(msg,f){
  console.log("we_will: "+msg)
  try { f() }
  catch (exception) {
     console.warn(exception.stack.replace(/:(\d+):(\d+)/g, "$& (Line $1, Column $2)"))
  }
}

function ok(expr, msg){
  log(expr, msg)
}

function log(expr, msg){
  expr ? console.log("!pass "+msg) : console.log("?fail "+msg)
}

function html_log(){
  const queue = []
  return function log(expr, msg) {
    queue.push( expr ? `!pass ${msg}` : `?fail ${msg}` )
  }
}


}("goodbye and thanks")