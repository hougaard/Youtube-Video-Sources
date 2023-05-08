var addin = document.getElementById('controlAddIn');
addin.innerHTML = '<div id="myProgress"><div id="myBar">0%</div></div>';

var CurrentProgress = 0;

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('IAmReady',[]);
