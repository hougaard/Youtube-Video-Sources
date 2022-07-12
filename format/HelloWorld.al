// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        d: Decimal;
        i: integer;
        ti: Time;
        da: Date;
        s: Text;
        j: JsonObject;
    begin
        j.Add('value', 123);
        j.add('house', 'abc');
        s := '>' + format(j, 0, 3) + '<';
        Message(s);
    end;
}