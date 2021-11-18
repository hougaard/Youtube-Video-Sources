// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50132 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Cust: Record Customer;
    begin
        Cust.FindFirst();
        Cust."Tax Area Code" := 'YOUTUBE';
        Cust.Modify(false);
    end;
}