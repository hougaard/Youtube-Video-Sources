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
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    AboutTitle = 'Item Quantity';
                    AboutText = 'If you''re scanning the same item twice, it will update the existing line with a larger quantity instead of adding a new line.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(VIP)
            {
                Caption = 'VIP';
                ApplicationArea = all;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                AboutTitle = 'VIP Customer';
                AboutText = 'Specify if this is a VIP customer!';
                trigger OnAction()
                begin
                    message('VIP Customer');
                end;
            }
        }
    }
}