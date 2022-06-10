report 50100 "Test Excel"
{
    Caption = 'Testing Excel';
    ExcelLayout = 'SuperExcelLayout.xlsx';
    DefaultLayout = Excel;
    dataset
    {
        dataitem(Customer; Customer)
        {

            column(No_Customer; "No.")
            {
            }
            column(Name_Customer; Name)
            {
            }
            column(Address_Customer; Address)
            {
            }
            column(City_Customer; City)
            {
            }
            column(Country_Region_Code; "Country/Region Code")
            {

            }
            column(PostCode_Customer; "Post Code")
            {
            }
            column(PhoneNo_Customer; "Phone No.")
            {
            }
            column(SalesLCY_Customer; "Sales (LCY)")
            {
            }
            column(BalanceLCY_Customer; "Balance (LCY)")
            {
            }
            column(BalanceDueLCY_Customer; "Balance Due (LCY)")
            {
            }
            column(Profit__LCY_; "Profit (LCY)")
            {

            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Field("No.");

                column(CustomerNo_CustLedgerEntry; "Customer No.")
                {
                }
                column(PostingDate_CustLedgerEntry; "Posting Date")
                {
                }
                column(DocumentType_CustLedgerEntry; "Document Type")
                {
                }
                column(DocumentNo_CustLedgerEntry; "Document No.")
                {
                }
                column(DocumentDate_CustLedgerEntry; "Document Date")
                {
                }
                column(Amount_CustLedgerEntry; Amount)
                {
                }
                column(AmountLCY_CustLedgerEntry; "Amount (LCY)")
                {
                }
                column(CurrencyCode_CustLedgerEntry; "Currency Code")
                {
                }
                column(Open_CustLedgerEntry; Open)
                {
                }
            }
        }
        dataitem(Vendor; Vendor)
        {

            column(No_Vendor; "No.")
            {
            }
            column(Name_Vendor; Name)
            {
            }
            column(Address_Vendor; Address)
            {
            }
            column(BalanceLCY_Vendor; "Balance (LCY)")
            {
            }
            column(BalanceDueLCY_Vendor; "Balance Due (LCY)")
            {
            }
        }
    }
}