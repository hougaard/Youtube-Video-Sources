page 50148 "Important Data"
{
    Caption = 'Important Data';
    PageType = List;
    SourceTable = ImportantTable;
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(PKey; Rec.PKey)
                {
                    ToolTip = 'Specifies the value of the PKey field.';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                    ApplicationArea = All;
                }
                field(Data1; Rec.Data1)
                {
                    ToolTip = 'Specifies the value of the Data1 field.';
                    ApplicationArea = All;
                }
                field(Date2; Rec.Date2)
                {
                    ToolTip = 'Specifies the value of the Date2 field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
