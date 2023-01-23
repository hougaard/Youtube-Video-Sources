var controlAddIn = document.getElementById('controlAddIn');
//controlAddIn.innerHTML = '<div style="height: 100%; width: 100%; background-color: coral;"></div>';

var heightindicator = window.parent.document.querySelector('div[class~="control-addin-form"]');
if (heightindicator != null) {
    window.frameElement.style.height = heightindicator.offsetHeight.toString() + "px";
   window.addEventListener('resize', function (event) {
        window.frameElement.style.height = heightindicator.offsetHeight.toString() + "px";
    }, true);
}

parameter = {};
parameter['Name'] = 'Erik';
parameter['Info'] = { "Erik" : 'Name'};

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ImAmReady',[parameter]);