controladdin HTML
{
    StartupScript = 'startup.js';
    Scripts = 'scripts.js';
    HorizontalStretch = true;
    VerticalStretch = true;
    RequestedHeight = 1;
    event ControlReady();
    procedure Render(HTML: Text);
    procedure AddTeams();
}