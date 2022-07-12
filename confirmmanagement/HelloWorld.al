// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        c: Record Customer;
        confirmmgt: Codeunit "Confirm Management";
    begin
        c.findfirst();
        if confirm('Should we continue?', true) then
            message('true')
        else
            message('false');
    end;
}