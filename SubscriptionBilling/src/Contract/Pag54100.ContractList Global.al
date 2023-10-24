page 54104 "Global Contract List"
{
    ApplicationArea = All;
    Caption = 'Contract List';
    PageType = List;
    SourceTable = Contract;
    UsageCategory = Administration;
    Editable = false;
    CardPageId = "Contract Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer No."; Rec."Customer No.")
                {

                }
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
