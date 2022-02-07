pageextension 50100 ChangesToCustomerCard extends "Customer Card"
{
    layout
    {
        moveafter("IC Partner Code";"Balance Due (LCY)")
        modify("Address 2")
        {
        Visible = false;
        }
        addafter("IC Partner Code")
        {
            field("Name 260182";Rec."Name 2")
            {
                ApplicationArea = All;
            }
            field("Territory Code81265";Rec."Territory Code")
            {
                ApplicationArea = All;
            }
        }
        modify("Shipping Advice")
        {
        Visible = false;
        }
    }
    actions
    {
        modify("Prices and Discounts Overview")
        {
            Promoted = true;
            PromotedCategory = Category5;
            PromotedOnly = true;
        }
    }
}
