page 50109 "Fantastico List"
{
    Caption = 'Fantastico List';
    PageType = List;
    SourceTable = Fantastico;
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Primo; Rec.Primo)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Value"; Rec."Value")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
