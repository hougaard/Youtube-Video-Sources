page 50123 "Pretty Customer Card"
{

    Caption = 'Pretty Customer Card';
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(GenGroup)
            {
                Caption = 'General';

                group(Namegroup)
                {
                    Caption = 'Name';
                    field("No."; Rec."No.")
                    {
                        ToolTip = 'Specifies the value of the No. field';
                        ApplicationArea = All;
                        Importance = Promoted;
                    }
                    repeater(Rep)
                    {
                        field(Name; Rec.Name)
                        {
                            ToolTip = 'Specifies the value of the Name field';
                            ApplicationArea = All;
                            Importance = Promoted;
                        }
                    }
                    field("Name 2"; Rec."Name 2")
                    {
                        ToolTip = 'Specifies the value of the Name 2 field';
                        ApplicationArea = All;
                        Importance = Additional;
                    }
                    field("Mobile Phone No."; Rec."Mobile Phone No.")
                    {
                        ToolTip = 'Specifies the value of the Mobile Phone No. field';
                        ApplicationArea = All;
                    }
                    field("Salesperson Code"; Rec."Salesperson Code")
                    {
                        ToolTip = 'Specifies the value of the Salesperson Code field';
                        ApplicationArea = All;
                    }
                    field("Responsibility Center"; Rec."Responsibility Center")
                    {
                        ToolTip = 'Specifies the value of the Responsibility Center field';
                        ApplicationArea = All;
                    }
                }

                group(AddressGroup)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ToolTip = 'Specifies the value of the Address field';
                        ApplicationArea = All;
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ToolTip = 'Specifies the value of the Address 2 field';
                        ApplicationArea = All;
                    }
                    field(City; Rec.City)
                    {
                        ToolTip = 'Specifies the value of the City field';
                        ApplicationArea = All;
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ToolTip = 'Specifies the value of the Post Code field';
                        ApplicationArea = All;
                    }
                    field(County; Rec.County)
                    {
                        ToolTip = 'Specifies the value of the County field';
                        ApplicationArea = All;
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ToolTip = 'Specifies the value of the Country/Region Code field';
                        ApplicationArea = All;
                    }
                }

            }

            group(PostingGroup)
            {
                Caption = 'Posting Setup';
                field("Customer Disc. Group"; Rec."Customer Disc. Group")
                {
                    ToolTip = 'Specifies the value of the Customer Disc. Group field';
                    ApplicationArea = All;
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ToolTip = 'Specifies the value of the Customer Posting Group field';
                    ApplicationArea = All;
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ToolTip = 'Specifies the value of the Customer Price Group field';
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field';
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field';
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ToolTip = 'Specifies the value of the Payment Method Code field';
                    ApplicationArea = All;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ToolTip = 'Specifies the value of the Payment Terms Code field';
                    ApplicationArea = All;
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    ToolTip = 'Specifies the value of the Tax Area Code field';
                    ApplicationArea = All;
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                    ToolTip = 'Specifies the value of the Tax Liable field';
                    ApplicationArea = All;
                }
            }

            field(GLN; Rec.GLN)
            {
                ToolTip = 'Specifies the value of the GLN field';
                ApplicationArea = All;
                Visible = false;
            }




        }
    }
}
