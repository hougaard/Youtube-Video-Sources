table 50132 "Code Table"
{
    fields
    {
        field(1; Primary; Text[20])
        { }
        field(2; Display; Text[19])
        {
            trigger OnValidate()
            begin
                Primary := ' ' + Display;
                Primary[1] := strlen(Display) + 48;
            end;
        }
    }
    keys
    {
        key(P; Primary)
        { }
    }
}