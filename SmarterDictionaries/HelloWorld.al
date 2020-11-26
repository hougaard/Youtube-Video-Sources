// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Dict: JsonObject;
        Dict3: Dictionary of [Code[20], JsonObject];
        Dict2: Dictionary of [Text, Text];
        L1: List of [JsonObject];
        L2: JsonArray;
        Start, Stop : Time;
        i: Integer;
        v: JsonValue;
        T: JsonToken;
        Txt: Text;
        Customer: Record Customer;
    begin
        for i := 1 to 500000 do begin
                Dict2.Add(format(i), format(i))
        end;
        Start := Time();
        for i := 1 to 500000 do
            Dict.Get(format(i), T);

        Stop := Time();
        Message('Time Spend %1', Stop - Start);

    end;

    procedure CustomerToJson(Customer: Record Customer): JsonObject
    begin
        exit;
    end;

    procedure JsonToCustomer(JCust: JsonObject; var Customer: Record Customer)
    begin

    end;
}