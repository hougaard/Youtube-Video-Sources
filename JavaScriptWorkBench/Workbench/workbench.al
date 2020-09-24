controladdin Workbench
{
    MaximumHeight = 1;
    MaximumWidth = 1;
    MinimumHeight = 1;
    MinimumWidth = 1;
    HorizontalShrink = true;
    VerticalShrink = true;
    RequestedHeight = 1;
    RequestedWidth = 1;
    Scripts = 'Workbench/workbench.js';
    StartupScript = 'Workbench/startup.js';
    event ControlReady();
    procedure Execute(Code: Text);
    event Error(ErrorTxt: Text);

}