//
var editor;

function Init()
{
    editor = ace.edit("controlAddIn");
    editor.setTheme("ace/theme/dracula");
    //editor.session.setMode("ace/mode/pascal");
}

function RequestSave()
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("SaveRequested",[editor.getValue()]);
}

function SetLanguage(language)
{
    editor.session.setMode("ace/mode/" + language);
}

function setValue(Value)
{
    editor.setValue(Value);
}
function LoadDocument(DocText)
{
    editor.setValue(DocText);
}