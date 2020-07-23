
var LoginWindow;

function LaunchURLinNewWindow(URL)
{
    LoginWindow = window.open(URL,'_blank',"toolbar=0,location=0,menubar=0,width=400,height=800");
}

function CloseWindow()
{
    LoginWindow.close();
}
function CloseCurrentWindow()
{
    window.close();
}

function StartTimer()
{
    window.setInterval(TimerTic,1000);
}
function TimerTic()
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("TimerTic",[]);
}