page 72101 "Subscription Overview Focus"
{

    PageType = List;
    SourceTable = "Subscription Overview Focus";
    Caption = 'Subscription Overview';
    ApplicationArea = All;
    UsageCategory = History;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Invoice No."; "Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = All;
                }
                field("User Count"; "User Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
