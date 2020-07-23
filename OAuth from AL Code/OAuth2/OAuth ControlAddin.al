controladdin OAuthReDirect
{
    StartupScript = 'OAuth2/startup.js';
    Scripts = 'OAuth2/OAuth.js';
    MaximumHeight = 1;
    MaximumWidth = 1;
    MinimumHeight = 1;
    MinimumWidth = 1;
    event RedirectReceived(Code: Text; State: Text);
    event ControlReady();
    event TimerTic();
    procedure LaunchURLinNewWindow(URL: Text);
    procedure StartTimer();
    procedure CloseCurrentWindow();
    procedure CloseWindow();
}