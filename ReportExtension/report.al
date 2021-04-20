reportextension 58100 "My Invoice" extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Header)
        {
            column(Transaction_Type; "Transaction Type")
            {

            }
        }
        add(Header)
        {
            column(Digital_Stamp_PAC; "Digital Stamp PAC")
            { }
        }
    }
}