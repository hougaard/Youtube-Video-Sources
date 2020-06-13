//
function GetInfo()
{
    var txt;
    var searchdiv = window.parent.document.getElementsByClassName('ms-nav-pagesearch');
    var searchfield = searchdiv[0].getElementsByClassName('stringcontrol-edit');
    debugger;
    searchfield.addEventListener('change',function(e)
    {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ReturnInfo",[e]);
    });
}