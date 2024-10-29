report 50100 "Query Report"
{
    Caption = 'Query Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    DefaultLayout = Excel;
    ExcelLayout = 'queryreport.xlsx';
    dataset
    {
        dataitem(CLE; Integer)
        {
            column(A1; Q.Amount)
            { }
            column(A2; Q.Customer_Name)
            { }
            column(A3; Q.Document_Date)
            { }
            trigger OnPreDataItem()
            begin
                Q.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not Q.Read() then
                    CurrReport.Break();
            end;
        }
    }
    var
        Q: Query "Cust. Ledger Entries";
}