// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Item: Record Item;
    begin
        if Not item.Get('123') then begin
            item.Init();
            Item."No." := '123';
            Filloutfields(Item);
            Item.Insert(true);
        end else begin
            Filloutfields(Item);
            Item.Modify(true);
        end;
    end;

    local procedure Filloutfields(var Item: Record Item)
    begin
        Item."Unit Price" := 233;
    end;
}