// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        a: Integer;
    begin
        Message('Hello to all of Youtube!');
        if a = 5 then
            a := 3;
    end;
}