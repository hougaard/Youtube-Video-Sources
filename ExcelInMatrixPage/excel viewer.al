page 50410 "Excel Viewer"
{
    PageType = List;
    Caption = 'Excel Viewer';
    SourceTable = Integer;
    SourceTableView = where(Number = filter(1 ..));
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field(Number; Rec.Number)
                {
                    Caption = ' ';
                    ApplicationArea = all;
                }
                field(Col1; GetExcelCell(Rec.Number, LeftMostColumn))
                {
                    //Caption = 'A';
                    CaptionClass = '3,' + GetColumnHeading(LeftMostColumn);
                    ApplicationArea = all;
                }
                field(Col2; GetExcelCell(Rec.Number, LeftMostColumn + 1))
                {
                    CaptionClass = '3,' + GetColumnHeading(LeftMostColumn + 1);
                    ApplicationArea = all;
                }
                field(Col3; GetExcelCell(Rec.Number, LeftMostColumn + 2))
                {
                    CaptionClass = '3,' + GetColumnHeading(LeftMostColumn + 2);
                    ApplicationArea = all;
                }
                field(Col4; GetExcelCell(Rec.Number, LeftMostColumn + 3))
                {
                    CaptionClass = '3,' + GetColumnHeading(LeftMostColumn + 3);
                    ApplicationArea = all;
                }
                field(Col5; GetExcelCell(Rec.Number, LeftMostColumn + 4))
                {
                    CaptionClass = '3,' + GetColumnHeading(LeftMostColumn + 4);
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Left)
            {
                Caption = 'Scroll Left';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = PreviousRecord;
                trigger OnAction()
                begin
                    if LeftMostColumn > 1 then
                        LeftMostColumn -= 1;
                end;
            }
            action(Right)
            {
                Caption = 'Scroll Right';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = NextRecord;
                trigger OnAction()
                begin
                    LeftMostColumn += 1;
                end;
            }
            action(Load)
            {
                Caption = 'Load';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    FileName: Text;
                    InS: InStream;
                begin
                    if UploadIntoStream('Excel File', '', '', FileName, InS) then begin
                        ExcelBuffer.DeleteAll();
                        ExcelBuffer.OpenBookStream(InS, 'Sheet1');
                        ExcelBuffer.ReadSheet();
                        LeftMostColumn := 1;
                    end;
                end;
            }
        }
    }

    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        LeftMostColumn: Integer;

    local procedure GetColumnHeading(columnNumber: Integer): Text
    var
        dividend: Integer;
        columnName: Text;
        modulo: Integer;
        c: Char;
    begin
        dividend := columnNumber;

        while (dividend > 0) do begin
            modulo := (dividend - 1) mod 26;
            c := 65 + modulo;
            columnName := format(c) + columnName;
            dividend := (dividend - modulo) DIV 26;
        end;

        exit(columnName);
    end;

    local procedure GetExcelCell(row: Integer; column: Integer): Text
    begin
        if ExcelBuffer.Get(row, column) then
            exit(ExcelBuffer."Cell Value as Text");
    end;

    trigger OnOpenPage()
    begin
        LeftMostColumn := 1;
    end;
}