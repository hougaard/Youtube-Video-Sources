page 51101 "Search"
{
    Caption = 'Search';
    PageType = List;
    SourceTable = "Search Result";
    UsageCategory = Tasks;
    ApplicationArea = All;
    SourceTableTemporary = true;
    Editable = true;
    InsertAllowed = false;
    //ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            Group(SearchGrp)
            {
                Caption = 'Search';
                field(Search; SearchTxt)
                {
                    Caption = 'Search term';
                    ApplicationArea = all;
                    Editable = true;
                    trigger OnValidate()
                    var
                        Mgt: Codeunit "Search Management";
                    begin
                        Mgt.Search(SearchTxt, Rec);
                    end;
                }
            }
            repeater(General)
            {
                field("Data Caption"; "Data Caption")
                {
                    ApplicationArea = All;
                    Editable = false;
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        Mgt: Codeunit "Search Management";
                    begin
                        Mgt.NavigateTo(Rec);
                    end;
                }
                field("Table Name"; "Table Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Setup)
            {
                Caption = 'Setup';
                ApplicationArea = all;
                ToolTip = 'Setup tables to search in';
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Search Tables";
            }
        }
    }
    var
        SearchTxt: Text;
}
