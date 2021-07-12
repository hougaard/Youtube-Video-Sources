page 51100 "Standard dialog test"
{
    PageType = StandardDialog;
    Caption = 'This is the caption';
    layout
    {
        area(Content)
        {
            field(x; x)
            {
                ApplicationArea = all;
                Caption = 'This is X';
            }
            field(y; y)
            {
                ApplicationArea = all;
                Caption = 'This is Y';
            }
            field(z; z)
            {
                ApplicationArea = all;
                Caption = 'This is Z';
            }
        }
    }
    procedure Setup(_x: Text; _y: Text; _z: Text)
    begin
        x := _x;
        y := _y;
        z := _z;
    end;

    procedure GetX(): Text
    begin
        exit(x);
    end;

    procedure GetY(): Text
    begin
        exit(y);
    end;

    procedure GetZ(): Text
    begin
        exit(z);
    end;

    var
        x: Text;
        y: Text;
        z: Text;
}