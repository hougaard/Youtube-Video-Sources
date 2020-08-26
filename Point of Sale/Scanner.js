// Scanner Inteface

var Buffer;
var DropUntil74;
var LastDigit = new Date().getTime();
Buffer = '';

var HTMLContainer = document.getElementById("controlAddIn");
HTMLContainer.insertAdjacentHTML('beforeend','<div id="scanneranchor" tabindex="-1"></div>');

window.parent.addEventListener('keydown',KeyListen);
window.addEventListener('keydown', KeyListen);
function KeyListen(event)
{
    var NewDigit = new Date().getTime();
    if (DropUntil74) {
        if (NewDigit - LastDigit > 200)
        {
            DropUntil74 = false;
            return;
        }
        if (event.keyCode == 74)
        {
            DropUntil74 = false;
            console.log('Scanned',Buffer);
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Scanned',[Buffer]);
            Buffer = '';
        }
        event.preventDefault();
        event.stopPropagation();
        NewDigit = LastDigit;
    }
    else {
        if (event.keyCode == 13 && NewDigit - LastDigit < 200) {
            event.preventDefault();
            event.stopPropagation();
            DropUntil74 = true;
            LastDigit = NewDigit;
        }
        else
            if (event.keyCode >= 48) {
                if (NewDigit - LastDigit < 100)
                {
                    Buffer = Buffer + String.fromCharCode(event.keyCode);
                    LastDigit = NewDigit;
                }
                else
                {
                    Buffer = String.fromCharCode(event.keyCode);
                    LastDigit = NewDigit;
                }
            }
    }
}

SetFocus();
