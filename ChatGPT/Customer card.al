page 50100 "Customers"
{
    PageType = Card;
    SourceTable = Customers;

    layout
    {
        area(Content)
        {
            group("Customer Information")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }
                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
