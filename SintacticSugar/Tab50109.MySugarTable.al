table 50109 MySugarTable
{
    Caption = 'MySugarTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; P; Code[30])
        {
            Caption = 'P';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; P)
        {
            Clustered = true;
        }
    }
    // procedure Test(var Sugar : Record MySugarTable)
    // begin
    //     Sugar.Description := 'Hello';
    // end;
    procedure Test()
    begin
        Rec.Description := 'Hello2';
    end;

    procedure Test(var Rec: Record MySugarTable)
    begin
        Rec.Description := 'Hello2';
    end;

    procedure Clone(): Record MySugarTable;
    var
        NewSugar: Record MySugarTable;
    begin
        NewSugar := Rec;
        NewSugar.P := IncStr(Rec.P);
        NewSugar.Insert();
        exit(NewSugar);
    end;
}

codeunit 50100 "My Sugar Test"
{
    procedure testtest()
    var
        Sugar: Record MySugarTable;
        NewS: Record MySugarTable;

    begin
        Sugar.Test();
        message('%1', Sugar.Description);
        News := Sugar.Clone();
    end;
}
