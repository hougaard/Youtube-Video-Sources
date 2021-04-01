page 54302 "Dude Setup"
{

    Caption = 'Dude Setup';
    PageType = Card;
    SourceTable = "Dude Setup";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No. Series for Dude"; Rec."No. Series for Dude")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        no: Code[20];
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
        No := 'AAA123123';
        no := IncStr(No);
    end;
}
