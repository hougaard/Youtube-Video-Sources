//

var _field;
var _CurrentDrag;

function DragDropEnable(IDField)
{
    _field = IDField;
    let DropTable = window.parent.document.querySelector(".ms-nav-grid-data-table");
    //console.log(DropTable);

    var rows = DropTable.querySelectorAll('table tr');
    [].forEach.call(rows,function(row) {
        //console.log(row);
        if (row.hasAttribute('aria-rowindex'))
        {
            row.setAttribute('draggable','true');
            row.addEventListener('drop',handleDrop,false);
            row.addEventListener('dragstart', handleDragStart,false);
            row.addEventListener('dragover', handleDragOver,false);
        }
    })
}
function handleDrop(e)
{
    if (e.stopPropagation)
        e.stopPropagation(); 
    
    var _CurrentDrop = e.srcElement.closest("table tr").querySelector("[aria-label^='" + _field + "']").getAttribute("aria-label").split(', ')[1];
    console.log(_CurrentDrag,"dropped on", _CurrentDrop);

    
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("DropEvent",[_CurrentDrag,_CurrentDrop]);
}
function handleDragStart(e)
{
    //console.log(e);
    _CurrentDrag = e.srcElement.querySelector("[aria-label^='" + _field + "']").getAttribute("aria-label").split(', ')[1];
}
function handleDragOver(e)
{
    if (e.preventDefault)
        e.preventDefault();

    return false;
}