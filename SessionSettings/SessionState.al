pageextension 50138 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            Action(Test)
            {
                Caption = 'Try';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    s: SessionSettings;
                begin
                    s.Init();
                    s.LanguageId(1030);
                    s.RequestSessionUpdate(true);
                end;
            }
            Action(Test2)
            {
                Caption = 'Verify';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    s: SessionSettings;
                    T: Codeunit "Type Helper";
                begin
                    Message('Is %1 equal to %2', CurrentDateTime(), T.FormatUtcDateTime(CurrentDateTime(), '', ''));
                end;
            }
        }
    }
}