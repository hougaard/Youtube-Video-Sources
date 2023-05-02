// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Str: Text;
        c: Char;
    begin
        foreach c in Str do
            Message('App published: Hello world');
        if Rec.FindSet(true,true)
    end;
}