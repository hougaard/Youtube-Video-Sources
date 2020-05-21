table 72101 "Subscription Overview Focus"
{
    Caption = 'Subscription Overview Focus';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = SystemMetadata;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = SystemMetadata;
        }
        field(10; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = SystemMetadata;
        }
        field(11; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = SystemMetadata;
        }
        field(12; "User Count"; Integer)
        {
            Caption = 'User Count';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Customer No.", "Invoice No.", "Item No.")
        {
            Clustered = true;
        }
    }

}
