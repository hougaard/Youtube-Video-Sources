table 50100 "Awesome AZ demo"
{
    Caption = 'Awesome AZ demo';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Key Field"; Code[20])
        {
            Caption = 'Key Field';
            DataClassification = SystemMetadata;
        }
        field(10; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Key Field")
        {
            Clustered = true;
        }
    }
    
}
