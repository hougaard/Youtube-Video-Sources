// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        x: Record "Test Table";
        y: Record "Test Table";
    begin
        clear(x);
        y.Texti := '';
        y.init();
        Message('%1 vs %2', format(x), format(y));
    end;
}