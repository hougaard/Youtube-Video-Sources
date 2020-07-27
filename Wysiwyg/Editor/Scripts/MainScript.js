
var InputArea
var Editor

function Init() {

    var div = document.getElementById("controlAddIn");
    div.innerHTML = "";
    InputArea = document.createElement("textarea");
    InputArea.id = "Comment";
    InputArea.name = "Comment";
    div.appendChild(InputArea);
    
    ClassicEditor
        .create(document.querySelector('#Comment'))
        .then(editor => {
            Editor = editor;
            editor.model.document.on( 'change:data', () => {
                Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ContentChanged",[]);    
            } );
        })
        .catch(error => {
            console.error(error);
        });
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnAfterInit",[]);
    }

function Load(data) {
    Editor.setData(data);
 }

function RequestSave() {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("SaveRequested",[Editor.getData()]);
}
function SetReadOnly(readonly)
{
    Editor.isReadOnly = readonly;
}
