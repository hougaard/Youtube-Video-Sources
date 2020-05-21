table 72100 "Software Inc Setup"
{
    Caption = 'Software Inc Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "KEY"; Code[10])
        {
            Caption = 'KEY';
            DataClassification = SystemMetadata;
        }
        field(10; "Subscription Customization"; Boolean)
        {
            Caption = 'Subscription Customization';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "KEY")
        {
            Clustered = true;
        }
    }

}
