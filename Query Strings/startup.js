//

var urlParams = new URLSearchParams(window.location.search);
if (urlParams.has('Demo'))
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("GetDemo",[urlParams.get('Demo')]);
}