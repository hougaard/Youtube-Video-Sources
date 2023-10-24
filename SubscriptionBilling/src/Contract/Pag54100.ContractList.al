page 54100 "Contract List"
{
    ApplicationArea = All;
    Caption = 'Contract List';
    PageType = List;
    SourceTable = Contract;
    UsageCategory = None;
    Editable = false;
    CardPageId = "Contract Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Contract No."; Rec."Contract No.")
                {
                    ToolTip = 'Specifies the value of the Contract No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
