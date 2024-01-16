codeunit 50100 "My Constants"
{
    SingleInstance = true;

    procedure Welcome(): Text
    begin
        exit(_Welcome2);
    end;

    procedure SomeThingElse(): Text
    begin
        exit('hello there!');
    end;

    procedure Data(): JsonObject
    begin
        if not Data_Cached then begin
            _Data.ReadFrom(_JsonLabel);
            Data_Cached := true;
        end;
        exit(_Data);
    end;


    var
        Data_Cached: Boolean;
        _Data: JsonObject;
        _JsonLabel: Label '{"hello" : "Hello"}', Locked = true;
        _Welcome: Label 'App published: Hello world';
        _Welcome2: Label 'Hello YouTube', Locked = true;

}