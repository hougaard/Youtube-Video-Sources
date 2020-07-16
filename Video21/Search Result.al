table 51101 "Search Result"
{
    Caption = 'Search Result';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = SystemMetadata;
        }
        field(10; "Table No."; Integer)
        {
            Caption = 'Table No.';
            DataClassification = SystemMetadata;
        }
        field(11; "Table Name"; Text[50])
        {
            Caption = 'Table Name';
            FieldClass = FlowField;
            CalcFormula = lookup (AllObjWithCaption."Object Name" where("Object Type" = const(Table), "Object ID" = field("Table No.")));
        }
        field(15; "Record ID"; RecordId)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
        field(20; "Data Caption"; Text[250])
        {
            Caption = 'Data Caption';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }

}
