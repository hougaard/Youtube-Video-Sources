// Color Picker

HTMLContainer = document.getElementById("controlAddIn");
// jscolor.presets.default = {
// 	shadow:false
// };

update = function(picker)
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ColorPicked",[picker.toRGBAString()]);
}

HTMLContainer.insertAdjacentHTML('beforeend','<input data-jscolor="{onChange:\'update(this)\', alpha:1.0}">');
jscolor.install();

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ControlReady",[]);