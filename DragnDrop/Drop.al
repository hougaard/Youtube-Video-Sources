controladdin DragDrop
{
    Scripts = 'DropScript.js';
    StartupScript = 'DropStartup.js';
    MaximumHeight = 1;
    MinimumHeight = 1;
    MaximumWidth = 1;
    MinimumWidth = 1;
    RequestedHeight = 1;
    RequestedWidth = 1;

    event ControlReady();

    procedure DragDropEnable(IDField: Text);
    event DropEvent(DragID: Text; DropID: Text);
}