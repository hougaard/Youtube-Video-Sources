page 54583 "Yahtzee setup"
{
    PageType = StandardDialog;
    Caption = 'Yahtzee options';
    SourceTable = "Yahtzee Data Setup";
    SourceTableTemporary = true;
    Editable = true;
    DeleteAllowed = false;
    ModifyAllowed = true;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(FieldsGrp)
            {
                ShowCaption = false;
                field("Full-house for dice-price"; Rec."Full-house for dice-price")
                {
                    ToolTip = 'If enabled, Full-house scores dice-price, otherwise it scores fixed points.';
                    ApplicationArea = All;
                }
                field("Highest score"; Rec."Highest score")
                {
                    ApplicationArea = all;
                }
            }
            field(ClearAction; LblClearHistoryAction)
            {
                ApplicationArea = All;
                ShowCaption = false;

                trigger OnDrillDown()
                begin
                    ClearGameHistory();
                end;
            }
            field(CleanupDoneFld; LblCleanupDone)
            {
                ApplicationArea = All;
                ShowCaption = false;
                Style = AttentionAccent;
                Visible = CleanupDone;
            }
        }
    }

    procedure CleanupWasDone(): Boolean
    begin
        exit(CleanupDone);
    end;

    procedure SaveSetup()
    var
    begin
        Setup.Copy(Rec);
        Setup.Modify(true);
    end;

    local procedure ClearGameHistory()
    var
        Engine: Codeunit Yahtzee;
    begin
        Engine.ClearGameHistory();
        CleanupDone := true;
    end;

    trigger OnOpenPage()
    begin
        if Setup.UniqueKey = 0 then
            Setup := Setup.FindOrCreate();
        Rec.Copy(Setup);
        Rec.Insert(true);
        CurrPage.Editable(true);
    end;

    var
        Setup: Record "Yahtzee Data Setup";
        LblClearHistoryAction: Label 'Clear game history';
        LblCleanupDone: Label 'Cleanup done!';
        [InDataSet]
        CleanupDone: Boolean;


}
