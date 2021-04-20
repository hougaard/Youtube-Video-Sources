tableextension 50138 "My Sales Invoice" extends "Sales Invoice Header"
{
    fields
    {
        field(50138; MyField; Code[20])
        {
            Caption = 'My Field';
        }
    }
    keys
    {
        key(ExtDocKey; "External Document No.")
        {
        }
    }
}