// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        CustomerToFind: Text;
    begin
        //Message('App published: Hello world');
        CustomerToFind := '10000...30000';
        Rec.setrange(Name, CustomerToFind);
        repeat
        until Rec.Next(-1) = 1;
        message('%1', Format(Rec, 40, 0));
    end;



}