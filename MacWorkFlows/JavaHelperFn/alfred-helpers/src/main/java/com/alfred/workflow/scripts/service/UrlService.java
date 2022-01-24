package com.alfred.workflow.scripts.service;

import com.alfred.workflow.scripts.model.Url;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.io.FileOutputStream;
/**
 * @author Johnkegd
 */
public class UrlService implements OutputContainer{
    private final String WCMMODE = "?wcmmode=disabled";
    private final String AEMEDITOR = "editor.html/";
    private final String REGEX_MODEL ="\b{parameter}\b";
    private List<Url> urls = new ArrayList<Url>();

    public void fillUrlsToParse(String [] args) {
        for(String url : args) {
            if(checkAemUrls(url,AEMEDITOR)) {
                url = url.replace(AEMEDITOR,"").concat(WCMMODE);
            } else if(checkAemUrls(url,WCMMODE)){
                url = url.replace(WCMMODE,"");
                String host = url.substring(0,url.indexOf("content"));
                url = host.concat(AEMEDITOR).concat(url.substring(url.indexOf("content")));
            }
            urls.add(new Url(url));
        }
    }

    public boolean checkAemUrls(String currentUrl, String parameter) {
        return currentUrl.contains(parameter);
    }

    public List<Url> getUrls() {
        return urls;
    }


    public void createFileContainer(String fileName) throws IOException {
        FileOutputStream fos = new FileOutputStream(fileName);
        Iterator<Url> iterator = urls.iterator();
        while(iterator.hasNext()) {
            Url url = iterator.next();
            fos.write(url.getResultPath().getBytes());
        }
        fos.close();
    }
}
