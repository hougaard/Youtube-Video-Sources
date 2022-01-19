page 50148 "Important Data"
{
    SourceTable = ImportantTable;
    PageType = List;
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
                    ApplicationArea = all;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                }
                field(Data1; Rec.Data1)
                {
                    ApplicationArea = all;
                }
                field(Date2; Rec.Date2)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}