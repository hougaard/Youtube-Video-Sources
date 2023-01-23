controladdin testaddin
{
    StartupScript = 'startup.js';
    Scripts = 'script.js', 'raphael.js', 'flowchart-latest.js';
    HorizontalStretch = true;
    VerticalStretch = true;
    //RequestedHeight = 600;

    event ImAmReady(Parameters: JsonObject);
    procedure HeresSomeData(Data: JsonObject);

    procedure Draw(code: Text);
}