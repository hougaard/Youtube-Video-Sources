pageextension 50100 "Team - Customer" extends "Customer Card"
{
    layout
    {
        addfirst(factboxes)
        {
            part(Team; "Sales Team FactBox")
            {
                ApplicationArea = all;
                //SubPageLink = ParentTable = const(18), ParentSystemId = field(SystemId);
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