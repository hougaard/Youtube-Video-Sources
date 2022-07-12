// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        x: Integer;
        y: Text;
    begin
        x := 45;
        y := format(X);
        Message('App published from VSCodium: Hello world');
    end;
}