table 59300 "ISO Setup"
{
    Caption = 'ISO Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PKey; Code[10])
        {
            Caption = 'PKey';
            DataClassification = SystemMetadata;
        }
        field(10; "User Name"; Text[30])
        {
            Caption = 'User Name';
            DataClassification = SystemMetadata;
        }
        // field(11; Password; Text[30])
        // {
        //     Caption = 'Password';
        //     DataClassification = SystemMetadata;
        // }
    }
    keys
    {
        key(PK; PKey)
        {
            Clustered = true;
        }
    }
    procedure Password(pw: Text): Text
    begin
        IsolatedStorage.Set('password', pw, DataScope::Company);
        exit(pw);
    end;

    procedure Password(): Text
    var
        pw: Text;
    begin
        if IsolatedStorage.Get('password', DataScope::Company, pw) then
            exit(pw);
    end;
}
