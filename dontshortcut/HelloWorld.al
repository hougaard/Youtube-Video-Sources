pageextension 50100 MyPage extends "Sales Order"
{
    actions
    {
        addfirst(processing)
        {
            action(ReleaseAction)
            {
                Caption = 'My Release Function';
                trigger OnAction()
                var
                    SalesReleaseManagement: Codeunit "Release Sales Document";
                begin
                    //SalesReleaseManagement.Reopen(Rec);
                    Rec.Validate(Status,Rec.Status::Open);
                    Rec.Modify(true);
                end;
            }
        }
    }
}