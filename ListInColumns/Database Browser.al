namespace hougaard.databasebrowser;
using System.Reflection;
using ListInColumns.ListInColumns;

page 50132 "Database Browser"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = AllObj;
    SourceTableView = where("Object Type" = const(Table));
    layout
    {
        area(Content)
        {
            grid(grid1)
            {
                group(g1)
                {
                    repeater(Rep)
                    {

                        field("Object ID"; Rec."Object ID")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the ID of the object.';
                        }
                        field("Object Name"; Rec."Object Name")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the name of the object.';
                        }
                    }
                }
                group(g2)
                {
                    part(Fields; "Field Browser")
                    {
                        SubPageLink = TableNo = field("Object ID");
                    }
                }
            }
        }
    }
}