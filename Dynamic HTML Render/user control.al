controladdin HTML
{
    StartupScript = 'startup.js';
    Scripts = 'scripts.js';
    HorizontalStretch = true;
    VerticalStretch = true;
    RequestedHeight = 400;
    event ControlReady();
    procedure Render(HTML: Text);
}