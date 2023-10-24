table 54100 Contract
{
    Caption = 'Contract';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
        }
        field(2; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Contract No.", "Customer No.")
        {
            Clustered = true;
        }
    }
}
