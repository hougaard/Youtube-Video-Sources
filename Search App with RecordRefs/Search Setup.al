table 51100 "Search Setup"
{
    Caption = 'Search Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Table No."; Integer)
        {
            Caption = 'Table No.';
            DataClassification = SystemMetadata;
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Table));
        }
        field(10; "Search Primary Key"; Boolean)
        {
            Caption = 'Search Primary Key';
            DataClassification = SystemMetadata;
        }
        field(20; "Full Text Search"; Boolean)
        {
            Caption = 'Full Text Search';
            DataClassification = SystemMetadata;
        }
        field(21; "Full Text Search Limit"; Integer)
        {
            Caption = 'Full Text Search Limit';
            DataClassification = SystemMetadata;
        }
        field(50; "Card Page"; Integer)
        {
            Caption = 'Card Page No.';
            DataClassification = SystemMetadata;
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Page));
        }
    }
    keys
    {
        key(PK; "Table No.")
        {
            Clustered = true;
        }
    }

}
