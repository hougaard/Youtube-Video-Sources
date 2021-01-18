controladdin SourceEditor
{
    Scripts = 'SourceEditor/ace.js',
              'SourceEditor/ext-searchbox.js',
              'SourceEditor/mode-pascal.js',
              'SourceEditor/mode-json.js',
              'SourceEditor/theme-dracula.js',
              'SourceEditor/Script.js';
    StartupScript = 'SourceEditor/Startup.js';

    VerticalStretch = true;
    HorizontalStretch = true;
    RequestedHeight = 450;

    event ControlReady();
    procedure Init();
    procedure setValue(Value: Text);
    procedure LoadDocument(DocText: Text);
    procedure SetLanguage(language: Text);
    procedure RequestSave();
    event SaveRequested(source: Text);
}