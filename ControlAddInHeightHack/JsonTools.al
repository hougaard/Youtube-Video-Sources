codeunit 50100 "Json Tools"
{
    procedure Json2Rec(JO: JsonObject; Rec: Variant): Variant
    var
        Ref: RecordRef;
    begin
        Ref.GetTable(Rec);
        exit(Json2Rec(JO, Ref.Number()));
    end;

    procedure Json2Rec(JO: JsonObject; TableNo: Integer): Variant
    var
        Ref: RecordRef;
        FR: FieldRef;
        FieldHash: Dictionary of [Text, Integer];
        i: Integer;
        JsonKey: Text;
        T: JsonToken;
        JsonKeyValue: JsonValue;
        RecVar: Variant;
    begin
        Ref.OPEN(TableNo);
        for i := 1 to Ref.FieldCount() do begin
            FR := Ref.FieldIndex(i);
            FieldHash.Add(GetJsonFieldName(FR), FR.Number);
        end;
        Ref.Init();
        foreach JsonKey in JO.Keys() do begin
            if JO.Get(JsonKey, T) then begin
                if T.IsValue() then begin
                    JsonKeyValue := T.AsValue();
                    FR := Ref.Field(FieldHash.Get(JsonKey));
                    AssignValueToFieldRef(FR, JsonKeyValue);
                end;
            end;
        end;
        RecVar := Ref;
        exit(RecVar);
    end;

    procedure Rec2Json(Rec: Variant): JsonObject
    var
        Ref: RecordRef;
        Out: JsonObject;
        FRef: FieldRef;
        i: Integer;
    begin
        if not Rec.IsRecord then
            error('Parameter Rec is not a record');
        Ref.GetTable(Rec);
        for i := 1 to Ref.FieldCount() do begin
            FRef := Ref.FieldIndex(i);
            case FRef.Class of
                FRef.Class::Normal:
                    Out.Add(GetJsonFieldName(FRef), FieldRef2JsonValue(FRef));
                FRef.Class::FlowField:
                    begin
                        FRef.CalcField();
                        Out.Add(GetJsonFieldName(FRef), FieldRef2JsonValue(FRef));
                    end;
            end;
        end;
        exit(Out);
    end;

    local procedure FieldRef2JsonValue(FRef: FieldRef): JsonValue
    var
        V: JsonValue;
        D: Date;
        DT: DateTime;
        T: Time;
    begin
        case FRef.Type() of
            FieldType::Date:
                begin
                    D := FRef.Value;
                    V.SetValue(D);
                end;
            FieldType::Time:
                begin
                    T := FRef.Value;
                    V.SetValue(T);
                end;
            FieldType::DateTime:
                begin
                    DT := FRef.Value;
                    V.SetValue(DT);
                end;
            else
                V.SetValue(Format(FRef.Value, 0, 9));
        end;
        exit(v);
    end;

    local procedure GetJsonFieldName(FRef: FieldRef): Text
    var
        Name: Text;
        i: Integer;
    begin
        Name := FRef.Name();
        for i := 1 to Strlen(Name) do begin
            if Name[i] < '0' then
                Name[i] := '_';
        end;
        exit(Name.Replace('__', '_').TrimEnd('_').TrimStart('_'));
    end;

    local procedure AssignValueToFieldRef(var FR: FieldRef; JsonKeyValue: JsonValue)
    begin
        case FR.Type() of
            FieldType::Code,
            FieldType::Text:
                FR.Value := JsonKeyValue.AsText();
            FieldType::Integer:
                FR.Value := JsonKeyValue.AsInteger();
            FieldType::Date:
                FR.Value := JsonKeyValue.AsDate();
            else
                error('%1 is not a supported field type', FR.Type());
        end;
    end;
}