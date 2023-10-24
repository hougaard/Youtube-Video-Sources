table 54102 "Contract Item Price"
{
    Caption = 'Contract Item Price';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(2; Frequency; DateFormula)
        {
            Caption = 'Frequency';
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(4; Price; Decimal)
        {
            Caption = 'Price';
        }
    }
    keys
    {
        key(PK; "Item No.", "Customer No.", Frequency)
        {
            Clustered = true;
        }
    }
}
