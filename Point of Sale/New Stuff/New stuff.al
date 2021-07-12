pageextension 57101 "Something new" extends "Dim Correction Schedule"
{
    actions
    {
        addlast(Processing)
        {
            action(Test)
            {
                Caption = 'Test';
                ApplicationArea = all;
                trigger OnAction()
                var
                    base64: codeunit "Base64 Convert";
                begin
                    message('Test');
                end;
            }
        }
    }
}