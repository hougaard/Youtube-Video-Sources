page 59300 BigDataTable
{
    ApplicationArea = All;
    Caption = 'BigDataTable';
    PageType = List;
    SourceTable = BigData;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(LineNo; Rec.LineNo)
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
    actions
    {
        area(Processing)
        {
            action(Create)
            {
                Caption = 'Create Data';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    d: Record BigData;
                    i: Integer;
                    i2: Integer;
                begin
                    if Rec.FindLast() then
                        i := Rec.LineNo;
                    repeat
                        i += 1;
                        i2 += 1;
                        d.Init();
                        d.LineNo := i;
                        d.Description := 'Hafnarfjörður Blåbærgrød Garðabær Höfuðborgarsvæðið Ísafjarðarbær';
                        d.Insert();
                    until i2 = 100000;

                end;
            }
        }
    }
}
