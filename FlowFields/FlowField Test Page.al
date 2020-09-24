page 50142 "FlowField Test"
{
    PageType = List;
    SourceTable = "FlowField Test Table";
    layout
    {
        area(Content)
        {
            repeater(Rep)

            {
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field("Has Invoices"; "Has Invoices")
                {
                    ApplicationArea = All;
                }
                field("Invoices Total"; "Invoices Total")
                {
                    ApplicationArea = All;
                }
                field("Invoices Count"; "Invoices Count")
                {
                    ApplicationArea = all;
                }
                field("Average Invoice"; "Average Invoice")
                {
                    ApplicationArea = All;
                }
                field("Max Invoice Amount"; "Max Invoice Amount")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}