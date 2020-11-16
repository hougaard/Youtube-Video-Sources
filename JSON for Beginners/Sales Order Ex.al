pageextension 50144 "JSON" extends "Sales Order"
{
    actions
    {
        addfirst(processing)
        {
            action(ShowJson)
            {
                Caption = 'Show JSON';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = all;
                Image = Document;
                trigger OnAction()
                var
                    obj: JsonObject;
                    O2: JsonObject;
                    item: JsonObject;
                    Token: JsonToken;
                    T2: JsonToken;
                    T3: JsonToken;
                    ja: JsonArray;
                    v: JsonValue;
                    txt: Text;
                begin
                    obj.Add('field', 'Youtube Video');

                    v.SetValue(123.456);
                    obj.Add('Price', v);

                    obj.Add('version', '0.2.0');
                    item.add('No', 20201110D);
                    ja.add(item);
                    clear(item);
                    item.add('No', 20201112D);
                    ja.add(item);
                    ja.Add(100);
                    ja.Add(200);
                    obj.Add('Items', ja);

                    if obj.Contains('Items') then begin
                        obj.get('Items', Token);
                        foreach T2 in Token.AsArray() do begin
                            if T2.IsObject() then begin
                                O2 := T2.AsObject();
                                O2.Get('No', T3);
                                if T3.IsValue() then begin
                                    V := T3.AsValue();
                                    Message('Value as Date %1', CalcDate('+5D', V.AsDate()));
                                end;
                            end;
                        end;
                    end;

                    //obj.WriteTo(txt);
                    //Message(txt);
                end;
            }
        }
    }
}