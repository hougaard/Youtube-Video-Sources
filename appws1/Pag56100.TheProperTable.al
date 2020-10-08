page 56100 "The Proper Table"
{

    ApplicationArea = All;
    Caption = 'The Proper Table';
    PageType = List;
    SourceTable = "A proper Table";
    UsageCategory = Lists;
    CardPageId = "The Proper Table Card";

    layout
    {
        area(content)
        {
            repeater(General)
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

}
