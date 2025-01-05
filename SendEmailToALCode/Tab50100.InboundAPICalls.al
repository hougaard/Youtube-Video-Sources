table 50100 "Inbound API Calls"
{
    Caption = 'Inbound API Calls';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
            AutoIncrement = true;
        }
        field(2; Subject; Text[200])
        {
            Caption = 'Subject';
        }
        field(3; "Return Value"; Text[100])
        {
            Caption = 'Return Value';
        }
        field(4; Sender; Text[200])
        {
            Caption = 'Sender';
        }
    }
    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }
}
