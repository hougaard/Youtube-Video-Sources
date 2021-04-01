page 54301 "Dude Card"
{
    
    Caption = 'Dude Card';
    PageType = Card;
    SourceTable = dude;
    
    layout
    {
        area(content)
        {
            group(General)
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
