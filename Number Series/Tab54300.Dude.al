table 54300 Dude
{
    Caption = 'Dude';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; City; Text[50])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Setup: Record "Dude Setup";
        NoMgt: Codeunit NoSeriesManagement;
    begin
        if No = '' then begin
            Setup.Get();
            No := NoMgt.GetNextNo(Setup."No. Series for Dude", WORKDATE, true);
        end;
    end;

}
