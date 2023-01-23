controladdin testaddin
{
    StartupScript = 'startup.js';
    Scripts = 'script.js', 'https://cdnjs.cloudflare.com/ajax/libs/mermaid/9.3.0/mermaid.min.js';
    HorizontalStretch = true;
    VerticalStretch = true;
    //RequestedHeight = 600;

    event ImAmReady(Parameters: JsonObject);
    procedure HeresSomeData(Data: JsonObject);

    procedure Draw(code: Text);
}