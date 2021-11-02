// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50115 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        j: JsonObject;
        v: JsonValue;
    begin
        v.SetValue(0DT);
        j.add('Date', v);
        Message('Json: %1', format(j));
    end;
}