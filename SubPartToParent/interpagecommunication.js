///
function PingParentPage(lineno) {
    for (var i = 0; i < window.parent.frames.length; i++){
        if (window.frameElement != window.parent.frames[i].frameElement)
            if (window.parent.frames[i].frameElement.contentWindow.PingParentPage != null)
                window.parent.frames[i].frameElement.contentWindow.RealPing(lineno);
    }
}

function RealPing(lineno)
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('PingFromSubPage',[lineno]);
}