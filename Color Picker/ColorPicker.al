controladdin ColorPicker
{
    StartupScript = 'startup.js';
    Scripts = 'jscolor.js';
    HorizontalStretch = true;
    VerticalStretch = true;
    RequestedHeight = 145;
    event ControlReady();
    event ColorPicked(ColorInfo: Text);
}