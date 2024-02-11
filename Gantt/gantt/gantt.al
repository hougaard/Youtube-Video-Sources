controladdin gantt
{
    Scripts = 'gantt/dhtmlxgantt.js', 'gantt/gantt.js';
    StartupScript = 'gantt/startup.js';
    StyleSheets = 'gantt/dhtmlxgantt.css';
    VerticalStretch = true;
    HorizontalStretch = true;

    event ControlReady();

    procedure Load(Data: JsonObject);
}