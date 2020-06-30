table 50101 "USPS Address Verify Hgd"
{
    Caption = 'USPS Address Verify';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Type; Enum "USPS Verify Type Hgd")
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(10; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(11; "Address 1"; Text[100])
        {
            Caption = 'Address 1';
            DataClassification = CustomerContent;
        }
        field(12; "Address 2"; Text[100])
        {
            Caption = 'Address 2';
            DataClassification = CustomerContent;
        }
        field(13; City; Text[100])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }
        field(14; "Post Code"; Text[30])
        {
            Caption = 'Post Code';
            DataClassification = CustomerContent;
        }
        field(15; County; Text[100])
        {
            Caption = 'County';
            DataClassification = CustomerContent;
        }
        field(100; "USPS FirmName"; Text[100])
        {
            Caption = 'USPS FirmName';
            DataClassification = CustomerContent;
        }
        field(101; "USPS Address 1"; Text[100])
        {
            Caption = 'USPS Address 1';
            DataClassification = CustomerContent;
        }
        field(102; "USPS Address 2"; Text[100])
        {
            Caption = 'USPS Address 2';
            DataClassification = CustomerContent;
        }
        field(103; "USPS City"; Text[100])
        {
            Caption = 'USPS City';
            DataClassification = CustomerContent;
        }
        field(104; "USPS State"; Text[100])
        {
            Caption = 'USPS State';
            DataClassification = CustomerContent;
        }
        field(105; "USPS Zip5"; Text[10])
        {
            Caption = 'USPS Zip5';
            DataClassification = CustomerContent;
        }
        field(106; "USPS Zip4"; Text[10])
        {
            Caption = 'USPS Zip4';
            DataClassification = CustomerContent;
        }
        field(107; "USPS Business"; Boolean)
        {
            Caption = 'USPS Business';
            DataClassification = CustomerContent;
        }
        field(108; "USPS Vacant"; Boolean)
        {
            Caption = 'USPS Vacant';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Type, "No.")
        {
            Clustered = true;
        }
    }

}
