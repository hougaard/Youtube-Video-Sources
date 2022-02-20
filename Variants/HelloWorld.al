// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50138 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        test: Codeunit "Variant Test";
    begin
        test.Test();
    end;
}