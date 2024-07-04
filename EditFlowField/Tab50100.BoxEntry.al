table 50100 "Box Entry"
{
    Caption = 'Box Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; CustomerNo; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = ,Adjustment,Sale,Return;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if Rec.Date = 0D then
            Rec.Date := Today();
        if Rec.Type = 0 then
            Rec.Type := Rec.Type::Adjustment;
    end;
}
