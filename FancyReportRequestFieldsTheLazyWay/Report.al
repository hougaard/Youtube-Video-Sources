report 50100 "Test"
{
    ProcessingOnly = true;
    dataset
    {
        dataitem(Customer; Customer)
        {

            column(Address_Customer; Address)
            {
            }
            column(Address2_Customer; "Address 2")
            {
            }
            column(Amount_Customer; Amount)
            {
            }
            column(Balance_Customer; Balance)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                field(x; I.Description)
                {
                    ApplicationArea = all;
                }
                field(I; I."Sales Unit of Measure")
                {
                    ApplicationArea = all;
                    Lookup = true;
                }
            }
        }
        trigger OnOpenPage()
        begin
            I.FindFirst();
        end;
    }
    var
        I: Record Item;
}