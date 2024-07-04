namespace ListInColumns.ListInColumns;

using System.Utilities;

page 50102 "Thing Browser"
{
    ApplicationArea = All;
    Caption = 'Thing Browser';
    PageType = ListPart;
    SourceTable = Integer;
    //SourceTableView = where(Number = filter(1 .. 100));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec.Number)
                {
                }
            }
        }
    }
}
