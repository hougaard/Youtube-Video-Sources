page 55101 "My Customer Card"
{
    ApplicationArea = All;
    Caption = 'My Customer Card';
    PageType = Card;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTable = Customer;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Name 2"; Rec."Name 2")
                {
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Address 2"; Rec."Address 2")
                {
                }
                field(City; Rec.City)
                {
                }
                field(County; Rec.County)
                {
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                }
            }
        }
    }
}
