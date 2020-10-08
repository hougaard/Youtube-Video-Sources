function Render(html)
{
    HTMLContainer.insertAdjacentHTML('beforeend',html);
}

function AddImage(b64txt)
{
    var image = new Image();
    image.src = 'data:image/png;base64,' + b64txt;
    HTMLContainer.appendChild(image);
}

function SomethingBinary(b64txt)
{
    var raw = window.atob(b64txt);
    var len = raw.length;
    var a = new Uint8Array(new ArrayBuffer(len));
    for(var i = 0; i < len; i++)
    {
        a[i] = raw.charCodeAt(i);
    }

}