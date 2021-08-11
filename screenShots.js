(function(){
    const base64string = "";
const pageImage = new Image();
pageImage.src = 'data:image/png;base64,' + base64string;
pageImage.onload = function() {
    const canvas = document.createElement('canvas');
    canvas.width = pageImage.naturalWidth;
    canvas.height = pageImage.naturalHeight;

    const ctx = canvas.getContext('2d');
    ctx.imageSmoothingEnabled = false;
    ctx.drawImage(pageImage, 0, 0);
    console.log(canvas, pageImage)
    saveScreenshot(canvas);
}
function saveScreenshot(canvas) {
    let fileName = "image"
    const link = document.createElement('a');
    link.download = fileName + '.png';
    console.log(canvas)
    canvas.toBlob(function(blob) {
        console.log(blob)
        link.href = URL.createObjectURL(blob);
        link.click();
    });
};

})()