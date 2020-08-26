tableextension 57100 "Payment Method" extends "Payment Method"
{
    fields
    {
        field(57100; "POS Payment"; Boolean)
        {
            Caption = 'POS Payment';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(POS; "POS Payment")
        { }
    }
}

pageextension 57100 "Payment Method" extends "Payment Methods"
{
    layout
    {
        addafter("Bal. Account No.")
        {
            field("POS Payment"; "POS Payment")
            {
                ApplicationArea = all;
            }
        }
    }
}