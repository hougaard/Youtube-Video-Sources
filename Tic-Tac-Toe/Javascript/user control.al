controladdin HTML
{
    StartupScript = 'Javascript/startup.js';
    Scripts = 'Javascript/scripts.js';
    HorizontalStretch = false;
    VerticalStretch = false;
    RequestedHeight = 1;
    RequestedWidth = 1;
    MinimumHeight = 1;
    MinimumWidth = 1;
    MaximumHeight = 1;
    MaximumWidth = 1;
    event ControlReady();
    procedure Render(HTML: Text);
    event TimerTic();
    procedure StartTimer(ms: Integer);
    procedure StopTimer();
    procedure AttachClickTracker();
    event ControlClicked(Control: Text);
}