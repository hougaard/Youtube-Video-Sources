page 50108 "My Dates"
{
    ApplicationArea = All;
    Caption = 'My Dates';
    PageType = List;
    SourceTable = StuffandDate;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(StartDate; Rec.StartDate)
                {
                    ToolTip = 'Specifies the value of the StartDate field.';
                }
            }
        }
    }
    actions
    {
        area(Promoted)
        {
            actionref(testpromoted; test)
            { }
        }
        area(Processing)
        {
            action(Test)
            {
                Caption = 'Test';
                trigger OnAction()
                var
                    Recur: Codeunit "Recurrence Schedule";
                    ID: Guid;
                    LastDate: DateTime;
                    i: Integer;
                begin
                    //Recur.SetMinDateTime(CurrentDateTime());
                    Rec.DeleteAll();
                    ID := Recur.CreateWeekly(0T, today(), 20231231D, 1, true, false, false, true, false, false, false);
                    Message('This is: %1', Recur.RecurrenceDisplayText(ID));
                    //ID := Recur.CreateDaily(0T, Today(), 20231231D, 3);


                    for i := 1 to 10 do begin
                        LastDate := Recur.CalculateNextOccurrence(ID, LastDate);
                        Rec.StartDate := DT2Date(LastDate);
                        Rec.Insert();
                    end;
                end;
            }
        }
    }
}
