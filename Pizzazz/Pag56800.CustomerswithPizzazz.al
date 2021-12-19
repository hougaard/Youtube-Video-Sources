page 56800 "Customers with Pizzazz"
{

    ApplicationArea = all;
    Caption = 'Customers with Pizzazz';
    PageType = List;
    SourceTable = Customer;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = all;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = all;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = all;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = all;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = all;
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = all;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
            }
        }
    }
    views
    {
        view(Pizzazz1)
        {
            Caption = 'Blocked Customers';
            Filters = where(Blocked = filter(All | Invoice | Ship));
            SharedLayout = false;
            layout
            {
                modify(Address)
                {
                    Visible = false;
                }
                modify(City)
                {
                    Visible = false;
                }
                moveafter("No."; "Mobile Phone No.")

            }
        }
        view(Pizzazz2)
        {
            Caption = 'Customers with price groups';
            filters = where("Customer Price Group" = filter(<> ''));
            SharedLayout = false;
            layout
            {
                modify("Customer Price Group")
                {
                    Visible = true;
                }
                moveafter("No."; "Customer Price Group")
            }
        }
    }
}
