controladdin GoogleCharts
{
    StartupScript = 'charts/startup.js';
    Scripts = 'charts/script.js', 'https://www.gstatic.com/charts/loader.js';
    HorizontalStretch = true;
    VerticalStretch = true;

    event ControlReady();
    procedure RunSomeCode(Data: JsonArray);
}