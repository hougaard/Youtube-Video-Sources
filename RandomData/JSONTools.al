codeunit 50100 JSONTools
{
    internal procedure new(Type: Text): JsonObject
    var
        O: JsonObject;
    begin
        O.Add('_Type', Type);
        exit(O);
    end;

    internal procedure Get(Obj: JsonObject; KeyTxt: Text): JsonObject
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then
            exit(t.AsObject())
        else
            error('%1 not found in %2', KeyTxt, format(Obj));
    end;

    procedure GetText(Obj: JsonObject; KeyTxt: Text): Text
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then begin
            if not t.AsValue().IsNull() then
                exit(t.AsValue().AsText());
        end else
            error('%1 not found in %2', KeyTxt, format(Obj));
    end;

    procedure GetDateTime(Obj: JsonObject; KeyTxt: Text): DateTime
    var
        TypeHelper: Codeunit "Type Helper";
        t: JsonToken;
        dt: DateTime;
    begin
        if Obj.Get(KeyTxt, T) then begin
            if not t.AsValue().IsNull() then begin
                dt := t.AsValue().AsDateTime();
                //exit(TypeHelper.AddHoursToDateTime(dt, 7));
                exit(dt);
            end;
        end
        else
            error('%1 not found in %2', KeyTxt, format(Obj));
    end;

    procedure GetDateTimeUTC(Obj: JsonObject; KeyTxt: Text): DateTime
    var
        TypeHelper: Codeunit "Type Helper";
        t: JsonToken;
        dt: DateTime;
    begin
        if Obj.Get(KeyTxt, T) then begin
            if not t.AsValue().IsNull() then begin
                dt := t.AsValue().AsDateTime();
                exit(TypeHelper.AddHoursToDateTime(dt, 7));
                //exit(dt);
            end;
        end
        else
            error('%1 not found in %2', KeyTxt, format(Obj));
    end;

    procedure GetDecimal(Obj: JsonObject; KeyTxt: Text): Decimal
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then begin
            if not t.AsValue().IsNull() then
                exit(t.AsValue().AsDecimal());
        end
        else
            error('%1 not found in %2', KeyTxt, format(Obj));
    end;

    internal procedure GetChildText(Obj: JsonObject; ChildElement: Text; FieldInChild: Text): Text
    begin
        exit(GetText(GetObj(Obj, ChildElement), FieldInChild));
    end;

    internal procedure GetChildInteger(Obj: JsonObject; ChildElement: Text; FieldInChild: Text): Integer
    begin
        exit(GetInteger(GetObj(Obj, ChildElement), FieldInChild));
    end;

    internal procedure GetTextOrDefault(Obj: JsonObject;
    KeyTxt: Text): Text
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then
            if not t.AsValue().IsNull() then
                exit(t.AsValue().AsText());
    end;

    internal procedure GetOption(Obj: JsonObject;
    KeyTxt: Text): Option
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then
            exit(t.AsValue().AsOption())
        else
            error('%1 not found in %2', KeyTxt, format(Obj));
    end;

    internal procedure GetValue(Obj: JsonObject;
    KeyTxt: Text): JsonValue
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then
            exit(t.AsValue())
        else
            error('Internal Error: %1 not found in %2', KeyTxt, format(Obj));
    end;

    internal procedure GetObj(Obj: JsonObject;
    KeyTxt: Text): JsonObject
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then
            exit(t.AsObject())
        else
            error('Internal Error: %1 not found in %2', KeyTxt, format(Obj));
    end;

    procedure GetArray(Obj: JsonObject; KeyTxt: Text): JsonArray
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then
            exit(t.AsArray())
        else
            error('Internal Error: %1 not found in %2', KeyTxt, format(Obj));
    end;

    procedure GetArrayTextMember(Obj: JsonArray; Number: Integer): Text
    var
        t: JsonToken;
    begin
        if Obj.Get(Number, t) then
            if not t.AsValue().IsNull then
                exit(t.AsValue().AsText())
            else
                exit('');
        error('Internal Error: %1 does not have member %2', format(Obj), Number);
    end;

    procedure GetArrayDateTimeMember(Obj: JsonArray; Number: Integer): DateTime
    var
        t: JsonToken;
    begin
        if Obj.Get(Number, t) then
            if not t.AsValue().IsNull then
                exit(t.AsValue().AsDateTime())
            else
                exit(0DT);
        error('Internal Error: %1 does not have member %2', format(Obj), Number);
    end;

    internal procedure GetBool(Obj: JsonObject;
    KeyTxt: Text): Boolean
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then
            exit(t.AsValue().AsBoolean())
        else
            error('Internal Error: %1 not found in %2', KeyTxt, format(Obj));
    end;

    internal procedure GetBoolOrDefault(Obj: JsonObject;
    KeyTxt: Text): Boolean
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then
            exit(t.AsValue().AsBoolean())
        else
            exit(false);
    end;

    internal procedure GetInteger(Obj: JsonObject;
    KeyTxt: Text): Integer
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then
            exit(t.AsValue().AsInteger())
        else
            error('Internal Error: %1 not found in %2', KeyTxt, format(Obj));
    end;

    internal procedure GetLineNo(Obj: JsonObject): Integer
    var
        t: JsonToken;
    begin
        if Obj.Get('LineNo', T) then
            exit(t.AsValue().AsInteger())
        else
            if Obj.Contains('Identifier') then
                exit(GetLineNo(GetObj(Obj, 'Identifier')))
            else
                if Obj.Contains('IdentifierToken') then
                    exit(GetLineNo(GetObj(Obj, 'IdentifierToken')))
                else
                    if Obj.Contains('Member') then
                        exit(GetLineNo(GetObj(Obj, 'Member')))
                    else
                        error('Internal Error: %1 not found in %2', 'LineNo', format(Obj));
    end;

    internal procedure GetIntegerOrDefault(Obj: JsonObject;
    KeyTxt: Text): Integer
    var
        t: JsonToken;
    begin
        if Obj.Get(KeyTxt, T) then exit(t.AsValue().AsInteger())
    end;

    internal procedure GetArrayPivot(Obj: JsonObject;
    KeyTxt: Text): JsonObject
    var
        t: JsonToken;
        i: Integer;
        dict: JsonObject;
    begin
        if Obj.Get(KeyTxt, T) then begin
            i := 0;
            foreach t in t.AsArray() do begin
                dict.add(GetText(t.AsObject(), 'Text'), i);
                if format(i) <> GetText(t.AsObject(), 'Text') then dict.Add(format(i), GetText(t.AsObject(), 'Text'));
                i += 1;
            end;
            exit(Dict);
        end
        else
            error('Internal Error: %1 not found in %2', KeyTxt, format(Obj));
    end;

    internal procedure IsEmpty(s: JsonObject): Boolean
    begin
        exit(s.Keys().Count = 0);
    end;
}
