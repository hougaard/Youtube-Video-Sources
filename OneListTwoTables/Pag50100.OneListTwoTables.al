page 50100 OneListTwoTables
{
    ApplicationArea = All;
    Caption = 'OneListTwoTables';
    PageType = List;
    SourceTable = "Sales Header";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field(CustomerBalanceLCY; Customer."Balance (LCY)")
                {
                    BlankZero = true;
                }
                field(CustomerPaymentTermsCode; Customer."Payment Terms Code")
                {
                    trigger OnValidate()
                    begin
                        Customer.Validate("Payment Terms Code");
                        Customer.Modify();
                    end;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        RefreshLine();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        RefreshLine();
    end;

    procedure RefreshLine()
    begin
        Customer.SetAutoCalcFields("Balance (LCY)");
        if not Customer.Get(Rec."Sell-to Customer No.") then
            clear(Customer);
    end;

    var
        Customer: Record Customer;
}
