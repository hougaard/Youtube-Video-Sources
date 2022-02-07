reportextension 50100 "test" extends "Customer - Top 10 List"
{
    dataset
    {
        modify(Customer)
        {
            trigger OnAfterPreDataItem()
            begin

            end;

            trigger OnBeforePreDataItem()
            begin

            end;
        }
    }
    var
        ACS: Codeunit "Sales-Post";
}