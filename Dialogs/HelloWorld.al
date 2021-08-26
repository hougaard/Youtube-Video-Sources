// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                Caption = 'Test';
                ApplicationArea = all;
                trigger OnAction()
                var
                    Window: Dialog;
                    GL: Record "G/L Entry";
                    DialogTextLbl: Label 'Stay calm,\ AL is #1####### #2###### working...';
                    ResultMsg: Label 'Total is %1';
                    i: Integer;
                    Sum: Decimal;
                begin
                    Window.Open(DialogTextLbl);
                    for i := 1 to 50 do begin
                        Window.Update(1, i);
                        if GL.FindSet() then
                            repeat
                                Sum += GL.Amount * Random(3);
                            until GL.Next() = 0;
                        Window.Update(2, Sum);
                    end;
                    Window.Close();
                    Message(ResultMsg, Sum);
                end;
            }
        }
    }
}