pageextension 50102 "Team - sales inv" extends "Posted Sales Invoice"
{
    layout
    {
        addfirst(factboxes)
        {
            part(Team; "Sales Team FactBox")
            {
                ApplicationArea = all;
                //SubPageLink = ParentTable = const(112), ParentSystemId = field(SystemId);
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        Ref: RecordRef;
    begin
        Ref.GetTable(Rec);
        CurrPage.Team.Page.SetParent(Ref);
    end;
}