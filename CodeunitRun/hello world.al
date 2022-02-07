pageextension 50800 "Customer List Hello" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                caption = 'Run with errors';
                ApplicationArea = all;
                trigger OnAction()
                var
                    cu: Codeunit "Problematic Codeunit";
                begin
                    if Rec.FindSet() then
                        repeat
                            // Do something with Rec
                            Rec.Modify();
                            Commit();
                            if not cu.Run() then begin
                                Rec."Name 2" := copystr(GetLastErrorText(),1,MaxStrLen(Rec."Name 2"));
                                Rec.Modify();
                            end;
                        until Rec.Next() = 0;

                end;
            }
        }
    }
}