page 56101 "The Proper Table Card"
{

    Caption = 'The Proper Table';
    PageType = Card;
    SourceTable = "A proper Table";
    UsageCategory = None;

    layout
    {
        area(content)
        {
            field("Primary Key Field"; Rec."Primary Key Field")
            {
                ApplicationArea = All;
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
            }
        }
    }

}
