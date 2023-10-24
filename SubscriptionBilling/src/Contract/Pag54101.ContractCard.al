page 54101 "Contract Card"
{
    ApplicationArea = All;
    Caption = 'Contract Card';
    PageType = Document;
    SourceTable = Contract;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Contract No."; Rec."Contract No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
            part(Lines; "Contract Lines Part")
            {
                SubPageLink = "Contract No." = field("Contract No."), "Customer No." = field("Customer No.");
            }
        }
    }
}
