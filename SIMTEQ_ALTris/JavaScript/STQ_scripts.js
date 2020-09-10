function Render(html)
{
    HTMLContainer.insertAdjacentHTML('beforeend',html);
}

function SetBGColor(elementId,color)
{
    document.getElementById(elementId).style.backgroundColor = color;
}

function SetElementValue(elementId,elementValue)
{
    document.getElementById(elementId).innerText = elementValue;
}

function StartTimer(miliSeconds) {
    timerObject = window.setInterval(executeTimer, miliSeconds);
}

function StopTimer() {
    window.clearInterval(timerObject);
}

function SetElementDisabled(elementId,newDisabled) {
    document.getElementById(elementId).disabled = newDisabled;
}

a=new AudioContext()
function Beep(volume, frequency, miliSeconds) {
  v=a.createOscillator()
  u=a.createGain()
  v.connect(u)
  v.frequency.value=frequency
  v.type="square"
  u.connect(a.destination)
  u.gain.value=volume*0.01
  v.start(a.currentTime)
  v.stop(a.currentTime+miliSeconds*0.001)
}

function newGame() {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('NewGame', null);
}

function executeTimer() {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('TimerElapsed', null);
}

function onKeyDown(event) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnKeyDown',[event.code]);
}
