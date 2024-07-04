page 50100 "Box Entries"
{
    ApplicationArea = All;
    Caption = 'Box Entries';
    PageType = List;
    SourceTable = "Box Entry";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Type"; Rec."Type")
                {
                }
                field(CustomerNo; Rec.CustomerNo)
                {
                }
                field("Date"; Rec."Date")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
            }
        }
    }
}
