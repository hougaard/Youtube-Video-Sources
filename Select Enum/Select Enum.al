page 50131 "Select an Enum"
{
    PageType = List;
    Caption = 'Select...';
    UsageCategory = None;
    SourceTable = Integer;
    layout
    {
        area(Content)
        {
            repeater(rep)
            {
                field(value; EnumValue(Rec.Number))
                {
                    Caption = 'Value';
                    ApplicationArea = all;
                }
            }
        }
    }
    local procedure EnumValue(Number: Integer): Text
    begin
        exit(F.GetEnumValueNameFromOrdinalValue(F.GetEnumValueOrdinal(Number)));
    end;

    procedure GetSelectedEnum(): Integer
    begin
        exit(F.GetEnumValueOrdinal(Rec.Number));
    end;

    procedure SetupPage(TableNo: Integer; FieldNo: Integer)
    var
        SelectLbl: Label 'Select ';
    begin
        Ref.OPEN(TableNo);
        F := Ref.Field(FieldNo);
        Setrange(Number, 1, F.EnumValueCount());
        CurrPage.Caption(SelectLbl + F.Caption());
    end;

    var
        Ref: RecordRef;
        F: FieldRef;
}