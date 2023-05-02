page 81500 "Test"
{
    actions
    {
        area(Processing)
        {
            action(Test2)
            {
                Caption = 'Test';
                ApplicationArea = all;
                trigger OnAction()
                var
                    Henrik: Codeunit "Dialog Helper TBHLG";
                    i: Integer;
                begin
                    Henrik.OpenWindow('Important work #1#####################', true);
                    for i := 1 to 1200 do begin
                        Henrik.UpdateWindow(i, 1200);
                        Henrik.UpdateWindow(1, format(Random(99999999)));
                        Sleep(10);
                    end;
                end;
            }
        }
    }
}