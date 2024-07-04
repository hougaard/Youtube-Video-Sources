page 50800 "Matrix Page"
{
    PageType = List;
    Caption = 'Matrix View';
    SourceTable = Integer;
    SourceTableView = where(Number = filter(> 0));
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(Content)
        {
            repeater(VerticalRep)
            {
                field(Number; Rec.Number)
                {
                    Caption = ' ';
                    Editable = false;
                }
                field(c1; V1)
                {
                    CaptionClass = '3,' + GiveMeTheColumnCaption(LeftMostColumn + 0);
                    Width = 10;
                    trigger OnValidate()
                    var
                        ColumnsDict: Dictionary of [Integer, Integer];
                    begin
                        if not OverrideValues.ContainsKey(Rec.Number) then
                            OverrideValues.Add(Rec.Number, ColumnsDict);
                        ColumnsDict := OverrideValues.Get(Rec.Number);
                        if not ColumnsDict.ContainsKey(LeftMostColumn + 0) then
                            ColumnsDict.Add(LeftMostColumn + 0, V1)
                        else
                            ColumnsDict.Set(LeftMostColumn + 0, V1);
                    end;
                }
                field(c2; V2)
                {
                    CaptionClass = '3,' + GiveMeTheColumnCaption(LeftMostColumn + 1);
                    Width = 10;
                    trigger OnValidate()
                    var
                        ColumnsDict: Dictionary of [Integer, Integer];
                    begin
                        if not OverrideValues.ContainsKey(Rec.Number) then
                            OverrideValues.Add(Rec.Number, ColumnsDict);
                        ColumnsDict := OverrideValues.Get(Rec.Number);
                        if not ColumnsDict.ContainsKey(LeftMostColumn + 1) then
                            ColumnsDict.Add(LeftMostColumn + 1, V1)
                        else
                            ColumnsDict.Set(LeftMostColumn + 1, V1);
                    end;
                }
                field(c3; V3)
                {
                    CaptionClass = '3,' + GiveMeTheColumnCaption(LeftMostColumn + 2);
                    Width = 10;
                    trigger OnValidate()
                    var
                        ColumnsDict: Dictionary of [Integer, Integer];
                    begin
                        if not OverrideValues.ContainsKey(Rec.Number) then
                            OverrideValues.Add(Rec.Number, ColumnsDict);
                        ColumnsDict := OverrideValues.Get(Rec.Number);
                        if not ColumnsDict.ContainsKey(LeftMostColumn + 2) then
                            ColumnsDict.Add(LeftMostColumn + 2, V1)
                        else
                            ColumnsDict.Set(LeftMostColumn + 2, V1);
                    end;
                }
                field(c4; V4)
                {
                    CaptionClass = '3,' + GiveMeTheColumnCaption(LeftMostColumn + 3);
                    Width = 10;
                    trigger OnValidate()
                    var
                        ColumnsDict: Dictionary of [Integer, Integer];
                    begin
                        if not OverrideValues.ContainsKey(Rec.Number) then
                            OverrideValues.Add(Rec.Number, ColumnsDict);
                        ColumnsDict := OverrideValues.Get(Rec.Number);
                        if not ColumnsDict.ContainsKey(LeftMostColumn + 3) then
                            ColumnsDict.Add(LeftMostColumn + 3, V1)
                        else
                            ColumnsDict.Set(LeftMostColumn + 3, V1);
                    end;
                }
                field(c5; V5)
                {
                    CaptionClass = '3,' + GiveMeTheColumnCaption(LeftMostColumn + 4);
                    Width = 10;
                    trigger OnValidate()
                    var
                        ColumnsDict: Dictionary of [Integer, Integer];
                    begin
                        if not OverrideValues.ContainsKey(Rec.Number) then
                            OverrideValues.Add(Rec.Number, ColumnsDict);
                        ColumnsDict := OverrideValues.Get(Rec.Number);
                        if not ColumnsDict.ContainsKey(LeftMostColumn + 4) then
                            ColumnsDict.Add(LeftMostColumn + 4, V1)
                        else
                            ColumnsDict.Set(LeftMostColumn + 4, V1);
                    end;
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
                Caption = '<--';
                Image = DecreaseIndent;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    if LeftMostColumn > 5 then
                        LeftMostColumn -= 5;
                    CurrPage.Update();
                end;
            }
            action(Right)
            {
                Caption = '-->';
                Image = Indent;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ShortcutKey = RightArrow;
                trigger OnAction()
                begin
                    LeftMostColumn += 5;
                    CurrPage.Update();
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        UpdateRow();
    end;

    trigger OnAfterGetRecord()
    begin
        UpdateRow();
    end;

    local procedure UpdateRow()
    begin
        V1 := GiveMeTheCellValue(Rec.Number, LeftMostColumn + 0);
        V2 := GiveMeTheCellValue(Rec.Number, LeftMostColumn + 1);
        V3 := GiveMeTheCellValue(Rec.Number, LeftMostColumn + 2);
        V4 := GiveMeTheCellValue(Rec.Number, LeftMostColumn + 3);
        V5 := GiveMeTheCellValue(Rec.Number, LeftMostColumn + 4);
    end;

    trigger OnOpenPage()
    begin
        Columns.SetFilter(Number, '>0');
        Columns.FindFirst();
        LeftMostColumn := Columns.Number;
    end;

    local procedure GiveMeTheCellValue(Row: Integer; Column: Integer): Integer
    var
        ColumnsDict: Dictionary of [Integer, Integer];
    begin
        if OverrideValues.ContainsKey(Row) then begin
            ColumnsDict := OverrideValues.Get(Row);
            if ColumnsDict.ContainsKey(Column) then
                exit(ColumnsDict.Get(Column));
        end;

        exit(Row * Column);
    end;

    local procedure GiveMeTheColumnCaption(Column: Integer): Text
    begin
        exit(format(Column));
    end;

    var
        Columns: Record Integer;
        LeftMostColumn: Integer;
        V1: Integer;
        V2: Integer;
        V3: Integer;
        V4: Integer;
        V5: Integer;
        OverrideValues: Dictionary of [Integer, Dictionary of [Integer, Integer]];

}