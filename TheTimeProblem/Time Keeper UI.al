page 53400 "Time Keeper"
{
    PageType = Card;
    SourceTable = "Time Keeper";
    layout
    {
        area(Content)
        {

            field(Time1; Rec.Time1)
            {
                ToolTip = 'Specifies the value of the Time1 field';
                ApplicationArea = All;
            }
            field(Time2; Rec.Time2)
            {
                ToolTip = 'Specifies the value of the Time2 field';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Foreground)
            {
                caption = 'Foreground';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    Codeunit.Run(53400);
                end;
            }
            action(Background)
            {
                caption = 'Background';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Id: Integer;
                begin
                    //StartSession(Id, 53400);

                    TaskScheduler.CreateTask(53400, 0);

                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if IsEmpty then
            insert();
    end;
}