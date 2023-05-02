function Render(html)
{
    HTMLContainer.insertAdjacentHTML('beforeend',html);
}

var TimerHandle;
function StartTimer(ms)
{
    if (TimerHandle != null)
        StopTimer();
    TimerHandle = window.setInterval(TimerTic,ms);
}
function TimerTic()
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("TimerTic",[]);
}
function StopTimer()
{
    window.clearInterval(TimerHandle);
    TimerHandle = null;
}
function AttachClickTracker()
{
    window.parent.addEventListener('mousedown',KeyListen);
}
function KeyListen(event)
{
    for(var i = 0; i < event.composedPath().length; i++)
    {
        var p = event.composedPath()[i];
        if (p.getAttribute('controlname'))
        {
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ControlClicked",[p.getAttribute('controlname')]);
            return;
        }
    }
}