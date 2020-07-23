Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ControlReady",[]);

var urlParams = new URLSearchParams(window.location.search);
if (urlParams.has('code'))
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(
        'RedirectReceived',
        [urlParams.get('code'),
         urlParams.get('state'),
        ]);    
}
