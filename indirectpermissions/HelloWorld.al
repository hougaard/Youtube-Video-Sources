// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Stuff: Codeunit "Manipulate GL";
    begin
        Stuff.DoX();
    end;
}

codeunit 50100 "Manipulate GL"
{
    Permissions = tabledata "G/L Entry" = M;
    procedure DoX()
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.FindFirst();
        GLEntry.Description := 'Look Mom, I''m coding AL!';
        GLEntry.Modify();
    end;
}