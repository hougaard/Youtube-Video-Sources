page 50132 "Test Page"
{
    SourceTable = Customer;
    Editable = true;
    PageType = List;
    layout
    {
        area(Content)
        {
            grid(g)
            {
                usercontrol(x; testaddin)
                {
                    ApplicationArea = all;
                    trigger ImAmReady(Parameters: JsonObject)
                    var
                        JsonTools: Codeunit "Json Tools";
                    begin
                        //CurrPage.x.HeresSomeData(JsonTools.Rec2Json(Rec));
                        //CurrPage.x.Draw(TheCode);
                    end;
                }
                field(TheCode; TheCode)
                {
                    ApplicationArea = all;
                    MultiLine = true;
                    trigger OnValidate()
                    begin
                        CurrPage.x.Draw(TheCode);
                    end;
                }
                // repeater(Rep)
                // {
                //     field(Name; Rec.Name)
                //     {
                //         ApplicationArea = All;
                //         ToolTip = 'Specifies the customer''s name.';
                //     }
                //     field(Address; Rec.Address)
                //     {
                //         ApplicationArea = All;
                //         ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
                //     }
                // }
            }
        }
    }
    var
        TheCode: Text;
}