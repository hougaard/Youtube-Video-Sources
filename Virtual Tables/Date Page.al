page 52301 "Date Virtual"
{
    PageType = List;
    SourceTable = Date;
    SourceTableView = where("Period Type" = const(Month));
    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field("Period Type"; "Period Type")
                {
                    Caption = 'Period Type';
                    ApplicationArea = all;
                }
                field("Period Start"; Rec."Period Start")
                {
                    Caption = 'Start';
                    ApplicationArea = all;
                }
            }
        }
    }
}