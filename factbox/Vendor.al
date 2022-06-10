pageextension 50101 "Team - Vendor" extends "Vendor Card"
{
    layout
    {
        addfirst(factboxes)
        {
            part(Team; "Sales Team FactBox")
            {
                ApplicationArea = all;
                //SubPageLink = ParentTable = const(23), ParentSystemId = field(SystemId);
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