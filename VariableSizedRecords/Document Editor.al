page 53103 "Document Editor Hgd"
{
    SourceTable = Integer;
    PageType = List;
    Caption = 'Document Edit';
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field(Key1; Fields.Get(Rec.Number))
                {
                    Caption = 'Field';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Value1; CurrentFieldValue)
                {
                    Caption = 'Value';
                    ApplicationArea = all;
                    Editable = true;
                    trigger OnValidate()
                    var
                        D: Date;
                        DT: DateTime;
                        T: Time;
                        Dec: Decimal;
                        i: Integer;
                    begin
                        case CurrentFieldType of
                            CurrentFieldType::Date:
                                begin
                                    Evaluate(D, CurrentFieldValue, 9);
                                    Object.Replace(Fields.Get(rec.Number), D);
                                end;
                            CurrentFieldType::DateTime:
                                begin
                                    Evaluate(DT, CurrentFieldValue, 9);
                                    Object.Replace(Fields.Get(rec.Number), DT);
                                end;
                            CurrentFieldType::Time:
                                begin
                                    Evaluate(T, CurrentFieldValue, 9);
                                    Object.Replace(Fields.Get(rec.Number), T);
                                end;
                            CurrentFieldType::Decimal:
                                begin
                                    Evaluate(Dec, CurrentFieldValue, 9);
                                    Object.Replace(Fields.Get(rec.Number), Dec);
                                end;
                            CurrentFieldType::Integer:
                                begin
                                    Evaluate(I, CurrentFieldValue, 9);
                                    Object.Replace(Fields.Get(rec.Number), I);
                                end;
                            else
                                Object.Replace(Fields.Get(rec.Number), CurrentFieldValue);
                        end;
                        Values := Object.Values();
                    end;
                }
                field(Type1; format(CurrentFieldType))
                {
                    Caption = 'Type';
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        SetValue();
    end;

    trigger OnAfterGetRecord()
    begin
        SetValue();
    end;

    procedure SetValue()
    var
        V: JsonValue;
    begin
        V := Values.Get(Rec.Number).AsValue();
        if V.IsNull() then
            CurrentFieldValue := ''
        else
            if not ConvertToBoolean(V, CurrentFieldValue) then
                if not ConvertToDate(V, CurrentFieldValue) then
                    if not ConvertToDateTime(V, CurrentFieldValue) then
                        if not ConvertToTime(V, CurrentFieldValue) then
                            if not ConvertToText(V, CurrentFieldValue) then
                                if not ConvertToDecimal(V, CurrentFieldValue) then
                                    if not ConvertToInteger(V, CurrentFieldValue) then begin
                                        CurrentFieldValue := V.AsText();
                                        CurrentFieldType := FieldType::Text;
                                    end;
    end;

    [TryFunction]
    procedure ConvertToBoolean(V: JsonValue; var D: Text)
    begin
        D := format(V.AsBoolean(), 0, 9);
        CurrentFieldType := FieldType::Boolean;
    end;

    [TryFunction]
    procedure ConvertToText(V: JsonValue; var D: Text)
    begin
        if format(V).Substring(1, 1) <> '"' then
            error('Not Text');
        D := format(V.AsText(), 0, 9);
        CurrentFieldType := FieldType::Text;
    end;

    [TryFunction]
    procedure ConvertToDate(V: JsonValue; var D: Text)
    begin
        D := format(V.AsDate(), 0, 9);
        CurrentFieldType := FieldType::Date;
    end;

    [TryFunction]
    procedure ConvertToDateTime(V: JsonValue; var D: Text)
    begin
        D := format(V.AsDateTime(), 0, 9);
        CurrentFieldType := FieldType::DateTime;
    end;

    [TryFunction]
    procedure ConvertToTime(V: JsonValue; var D: Text)
    begin
        D := format(V.AsTime(), 0, 9);
        CurrentFieldType := FieldType::Time;
    end;

    [TryFunction]
    procedure ConvertToDecimal(V: JsonValue; var D: Text)
    begin
        D := format(V.AsDecimal(), 0, 9);
        CurrentFieldType := FieldType::Decimal;
    end;

    [TryFunction]
    procedure ConvertToInteger(V: JsonValue; var D: Text)
    begin
        D := format(V.AsInteger(), 0, 9);
        CurrentFieldType := FieldType::Integer;
    end;


    internal procedure SetObject(_Object: JsonObject)
    begin
        Object := _Object;
        Fields := Object.Keys();
        Values := Object.Values();
        Rec.SetRange(Number, 1, Fields.Count());
    end;

    internal procedure GetObject(): JsonObject
    begin
        exit(Object);
    end;

    var
        Fields: List of [Text];
        Values: List of [JsonToken];
        Object: JsonObject;
        CurrentFieldValue: Text;
        CurrentFieldType: FieldType;
}