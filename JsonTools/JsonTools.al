codeunit 74500 "Json Tools"
{
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
}