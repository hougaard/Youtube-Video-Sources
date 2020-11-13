page 50100 "Show me the data"
{

    ApplicationArea = All;
    Caption = 'Show me the data';
    PageType = List;
    SourceTable = "CDS Contact";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(FirstName; Rec.FirstName)
                {
                    ApplicationArea = All;
                }
                field(LastName; Rec.LastName)
                {
                    ApplicationArea = All;
                }
                field(FullName; Rec.FullName)
                {
                    ApplicationArea = All;
                }
                field(new_youtube; Rec.new_youtube)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnInit()
    begin
        Codeunit.Run(Codeunit::"CRM Integration Management");
    end;
}
