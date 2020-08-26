page 57101 "POS Lines"
{
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "Sales Line";
    Editable = true;
    InsertAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field("No."; "No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}