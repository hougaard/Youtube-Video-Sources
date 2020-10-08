page 50129 "SHow the table"
{

    ApplicationArea = All;
    Caption = 'temporary table';
    PageType = List;
    SourceTable = "Very Temporary Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Primary; Primary)
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
