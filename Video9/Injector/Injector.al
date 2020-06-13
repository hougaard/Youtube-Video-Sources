controladdin Injector
{
    StartupScript = 'Injector/Startup.js';
    Scripts = 'Injector/Script.js';
    RequestedHeight = 1;
    RequestedWidth = 1;

    procedure GetInfo();
    event ReturnInfo(txt: Text);
    event ControlReady();
}