query 50100 "Sales of some sort"
{
    QueryCategory = 'Customer List';
    QueryType = Normal;
    elements
    {
        dataitem(SH; "Sales Header")
        {

            column(No; "No.")
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(BilltoName; "Bill-to Name")
            {
            }
            column(BilltoCity; "Bill-to City")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(CustomerPostingGroup; "Customer Posting Group")
            {
            }
            dataitem(SL; "Sales Line")
            {
                DataItemLink = "Document Type" = SH."Document Type", "Document No." = SH."No.";
                column(Type; Type)
                {

                }
                column(ItemNo; "No.")
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