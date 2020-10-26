table 50145 "XML Data"
{
    Caption = 'XML Data';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; FirstName; Text[50])
        {
            Caption = 'FirstName';
            DataClassification = ToBeClassified;
        }
        field(2; LastName; Text[50])
        {
            Caption = 'LastName';
            DataClassification = ToBeClassified;
        }
        field(3; Company; Text[100])
        {
            Caption = 'Company';
            DataClassification = ToBeClassified;
        }
        field(4; StreetNumber; Integer)
        {
            Caption = 'StreetNumber';
            DataClassification = ToBeClassified;
        }
        field(5; StreetName; Text[50])
        {
            Caption = 'StreetName';
            DataClassification = ToBeClassified;
        }
        field(6; Suffix; Text[10])
        {
            Caption = 'Suffix';
            DataClassification = ToBeClassified;
        }
        field(7; City; Text[50])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(8; State; Code[10])
        {
            Caption = 'State';
            DataClassification = ToBeClassified;
        }
        field(9; Zip; Integer)
        {
            Caption = 'Zip';
            DataClassification = ToBeClassified;
        }
        field(10; AreaCode; Code[3])
        {
            Caption = 'AreaCode';
            DataClassification = ToBeClassified;
        }
        field(11; Phone; Code[10])
        {
            Caption = 'Phone';
            DataClassification = ToBeClassified;
        }
        field(12; RowID; Integer)
        {
            Caption = 'RowID';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; RowID)
        {
            Clustered = true;
        }
    }

}
