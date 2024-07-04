namespace ListInColumns.ListInColumns;

using System.Reflection;

page 50101 "Field Browser"
{
    ApplicationArea = All;
    Caption = 'Field Browser';
    PageType = List;
    SourceTable = "Field";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                }
                field(FieldName; Rec.FieldName)
                {
                }
                field("Type"; Rec."Type")
                {
                }
                field(Len; Rec.Len)
                {
                }
            }
            part(Numbers; "Thing Browser")
            {
                SubPageLink = Number = field("No.");
            }
        }
    }
}
