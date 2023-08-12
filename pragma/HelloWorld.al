
#pragma warning disable AA0215
pageextension 50100 CustomerListExt extends "Customer List"
#pragma warning restore
{
    trigger OnOpenPage();
    begin
#pragma warning disable AA0139
        Rec.Name := GetRidOfSpaces(Rec.Name);
#pragma warning restore
        Rec.Name := GetRidOfSpaces(Rec.Address);
    end;

    procedure GetRidOfSpaces(input: Text): Text
    begin
        exit(input.replace(' ', '_'));
    end;
}