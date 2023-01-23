page 50101 "Customers List"
{
    PageType = List;
    SourceTable = Customers;
    CardPageId = 50100;

    layout
    {
        area(Content)
        {
            repeater(Rec)
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
