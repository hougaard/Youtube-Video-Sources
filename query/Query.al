query 50100 "Query Test"
{
    elements
    {
        dataitem(SH; "Sales Header")
        {

            column(DocumentType; "Document Type")
            {
            }
            column(No; "No.")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(SelltoCustomerName; "Sell-to Customer Name")
            {
            }
            dataitem(SL; "Sales Line")
            {
                DataItemLink = "Document Type" = SH."Document Type",
                               "Document No." = SH."No.";
                SqlJoinType = LeftOuterJoin;
                column("Type"; "Type")
                {
                }
                column(TypeNo; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(UnitPrice; "Unit Price")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Amount; Amount)
                {
                }
            }
        }
    }
}