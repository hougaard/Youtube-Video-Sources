// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        j: JsonObject;
        t: Codeunit "Type Helper";
        t1, t2 : Text;
    begin
        t1 := 'https://www.hougaard.com/something';

        t2 := t.UrlEncode(t1);

        OnAfterEncoding(t1, t2);

    end;

    procedure ProcA(var j: JsonObject)
    begin
        j.add('Field2', 'Another value');
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterEncoding(t1: Text; t2: Text)
    begin
    end;
}