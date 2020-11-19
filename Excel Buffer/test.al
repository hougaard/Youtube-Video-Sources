page 50100 "Excel Test"
{
    PageType = NavigatePage;
    SourceTable = "Excel Test";
    layout
    {
        area(Content)
        {
            repeater(rep)
            {

                field(Primary; Rec.Primary)
                {
                    ApplicationArea = All;
                }
                field("Text Data"; Rec."Text Data")
                {
                    ApplicationArea = All;
                }
                field("Date Data"; Rec."Date Data")
                {
                    ApplicationArea = All;
                }
                field("Decimal Data"; Rec."Decimal Data")
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
            action(test)
            {
                Caption = 'Import';
                Image = TestDatabase;
                InFooterBar = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    x: Codeunit "Excel Tools";
                    Buffer: Record "Excel Buffer" temporary;
                    Data: Record "Excel Test";
                    InS: InStream;
                    Filename: Text;
                    Row: Integer;
                    LastRow: Integer;
                begin
                    Data.DeleteAll();
                    if UploadIntoStream('Gimmi the Excel', '', '', Filename, InS) then begin
                        Buffer.OpenBookStream(InS, 'Sheet1');
                        Buffer.ReadSheet();
                        Buffer.setrange("Column No.", 4);
                        Buffer.FindLast();
                        LastRow := Buffer."Row No.";
                        Buffer.Reset();

                        for row := 9 to LastRow do begin
                            Data.Init();
                            Data.Primary := x.GetText(Buffer, 'D', row);
                            Data."Text Data" := x.GetText(Buffer, 'E', row);
                            Data."Date Data" := x.GetDate(Buffer, 'F', row);
                            Data."Decimal Data" := x.GetDecimal(Buffer, 'G', row);
                            Data.Insert();
                        end;
                    end;
                end;
            }
        }
    }
}