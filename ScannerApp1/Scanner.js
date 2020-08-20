//

var Buffer;
var DropUntil74;
var LastDigit = new Date().getTime();

Buffer = '';

window.parent.addEventListener('keydown', event => {
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
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Scanned',[Buffer]);
            Buffer = '';
        }
        event.preventDefault();
        event.stopPropagation();
    }
    else {
        if (event.keyCode == 13 && NewDigit - LastDigit < 100) {
            event.preventDefault();
            event.stopPropagation();
            DropUntil74 = true;
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
});