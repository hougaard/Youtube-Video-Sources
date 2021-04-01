page 54300 "Dude List"
{

    ApplicationArea = All;
    Caption = 'Dude List';
    PageType = List;
    SourceTable = Dude;
    UsageCategory = Lists;
    CardPageId = "Dude Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
