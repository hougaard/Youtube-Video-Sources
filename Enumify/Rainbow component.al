table 54800 "Rainbow Component"
{
    fields
    {
        field(1; Layer; Integer)
        {
            Caption = 'Layer';
        }
        field(2; Size; Decimal)
        {
            Caption = 'Size';
        }
        // field(3; Color; Option)
        // {
        //     Caption = 'Color';
        //     OptionMembers = Red,Orange,Yellow,Green,Blue,Indigo;
        // }
        field(3; Color; Enum RainbowColors)
        {
            Caption = 'Color';
        }
    }
    procedure Add(_Layer : Integer; _Size : Decimal; _Color : Enum RainbowColors)
    begin
        Rec.init();
        Rec.Layer := _Layer;
        Rec.Size := _Size;
        Rec.Color := _Color;
    end;

    procedure Test() : List of [Text]
   begin
        Add(10,1000,RainbowColors::Indigo);
    end;
}
