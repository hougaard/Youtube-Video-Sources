// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer Card"
{
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                ApplicationArea = All;
                Caption = 'Test';
                Image = Test;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Test';

                trigger OnAction()
                var
                    e: ErrorInfo;
                    Helpful: Codeunit Helpful;
                begin
                    e.Message := 'Not that fancy';
                    e.PageNo := 21;
                    e.FieldNo := Rec.FieldNo(Address);
                    e.RecordId := Rec.RecordId;
                    e.AddNavigationAction('Go North');
                    e.AddAction('Go South', 50100, 'Behelpful');
                    Helpful.SetContext(Rec.SystemId);
                    error(e);
                end;
            }
        }
    }
}