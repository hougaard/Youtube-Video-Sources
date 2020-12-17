report 50100 "My Batch"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "Customer Posting Group", "Customer Price Group";
            trigger OnPreDataItem()
            var
                Fancy: Codeunit FancyCo;
            begin
                Fancy.FancyFunc(Customer);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                field(Test; Test)
                {
                    ApplicationArea = all;
                    Caption = 'Test thingie';
                }
            }
        }
    }
    var
        Test: Text;
}

codeunit 50100 FancyCo
{
    procedure FancyFunc(var Cust: Record Customer)
    begin
        // Fancy processing
    end;
}
