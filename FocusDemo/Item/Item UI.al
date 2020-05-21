pageextension 72100 "Item Card Focus" extends "Item Card"
{
    layout
    {
        addafter(Type)
        {
            field("Subscription Item"; "Subscription Item")
            {
                ApplicationArea = all;
                Visible = ItemSub;
            }
        }
    }
    trigger OnOpenPage()
    var
        Setup: Record "Software Inc Setup";
    begin
        if Setup.GET() then
            ItemSub := Setup."Subscription Customization";
    end;

    var
        ItemSub: Boolean;
}

pageextension 72101 "Item List Focus" extends "Item List"
{
    layout
    {
        addafter(Type)
        {
            field("Subscription Item"; "Subscription Item")
            {
                ApplicationArea = all;
                Visible = ItemSub;
            }
        }
    }
    trigger OnOpenPage()
    var
        Setup: Record "Software Inc Setup";
    begin
        if Setup.GET() then
            ItemSub := Setup."Subscription Customization";
    end;

    var
        ItemSub: Boolean;
}