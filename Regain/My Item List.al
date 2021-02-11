pageextension 50002 "My Item List" extends "Item List"
{
    layout
    {
        addafter("No.")
        {
            field("No. 2 Ctl"; Rec."No. 2")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Search Description Ctl"; Rec."Search Description")
            {
                ApplicationArea = All;
            }
        }
    }
}
