page 54580 Yahtzee
{
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Yahtzee Data Dice";
    RefreshOnActivate = true;
    DataCaptionExpression = StrSubstNo('Game %1', Rec.GameId);
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            grid(DiceGrid)
            {
                GridLayout = Columns;
                group(Dice1Grp)
                {
                    ShowCaption = false;
                    field(Dice1Img; Rec.Dice1Img)
                    {
                        ShowCaption = false;
                        Editable = false;
                        ApplicationArea = All;
                    }
                    field(Dice1Val; Rec.Dice1Val)
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                        Visible = ShowDiceValue;
                    }
                    field(Dice1Mark; Rec.Dice1Mark)
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                    }
                }
                group(Dice2Grp)
                {
                    ShowCaption = false;
                    field(Dice2Img; Rec.Dice2Img)
                    {
                        ShowCaption = false;
                        Editable = false;
                        ApplicationArea = All;
                    }
                    field(Dice2Val; Rec.Dice2Val)
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                        Visible = ShowDiceValue;
                    }
                    field(Dice2Mark; Rec.Dice2Mark)
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                    }
                }
                group(Dice3Grp)
                {
                    ShowCaption = false;
                    field(Dice3Img; Rec.Dice3Img)
                    {
                        ShowCaption = false;
                        Editable = false;
                        ApplicationArea = All;
                    }
                    field(Dice3Val; Rec.Dice3Val)
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                        Visible = ShowDiceValue;
                    }
                    field(Dice3Mark; Rec.Dice3Mark)
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                    }
                }
                group(Dice4Grp)
                {
                    ShowCaption = false;
                    field(Dice4Img; Rec.Dice4Img)
                    {
                        ShowCaption = false;
                        Editable = false;
                        ApplicationArea = All;
                    }
                    field(Dice4Val; Rec.Dice4Val)
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                        Visible = ShowDiceValue;
                    }
                    field(Dice4Mark; Rec.Dice4Mark)
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                    }
                }
                group(Dice5Grp)
                {
                    ShowCaption = false;
                    field(Dice5Img; Rec.Dice5Img)
                    {
                        ShowCaption = false;
                        Editable = false;
                        ApplicationArea = All;
                    }
                    field(Dice5Val; Rec.Dice5Val)
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                        Visible = ShowDiceValue;
                    }
                    field(Dice5Mark; Rec.Dice5Mark)
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                    }
                }
                group(DiceRoundInfoGrp)
                {
                    ShowCaption = false;
                    //Visible = GameRunning;
                    field(DiceTurnNumFld; Rec.DiceTurnDisplay())
                    {
                        Caption = 'Turn';
                        ToolTip = 'Num of Game Turn';
                        ApplicationArea = All;
                        Style = Subordinate;
                    }
                    field(DiceRoundCountFld; Rec.DiceRoundDisplay())
                    {
                        Caption = 'Dice round';
                        ApplicationArea = All;
                        Style = Unfavorable;
                        StyleExpr = not CanRollDice;
                    }
                    field(DiceRollActionFld; ActionLabelDiceRoll)
                    {
                        ShowCaption = false;
                        ToolTip = 'Roll all Marked Dice';
                        ApplicationArea = All;
                        Style = StrongAccent;
                        StyleExpr = CanRollDice;
                        Enabled = CanRollDice;

                        trigger OnDrillDown()
                        begin
                            RunDiceRoll();
                        end;
                    }
                }
            }
            part(ScorePart; "Yahtzee Score Part")
            {
                SubPageLink = GameId = field(GameId);
                ApplicationArea = All;
            }
            group(StatGrp)
            {
                Caption = 'Statistics';
                grid(StatGrid)
                {
                    GridLayout = Rows;

                    field(Occurences1; occurCount(1))
                    {
                        ApplicationArea = All;
                        Style = Strong;
                        Caption = '1';
                    }
                    field(Occurences2; occurCount(2))
                    {
                        ApplicationArea = All;
                        Style = Strong;
                        Caption = '2';
                    }
                    field(Occurences3; occurCount(3))
                    {
                        ApplicationArea = All;
                        Style = Strong;
                        Caption = '3';
                    }
                    field(Occurences4; occurCount(4))
                    {
                        ApplicationArea = All;
                        Style = Strong;
                        Caption = '4';
                    }
                    field(Occurences5; occurCount(5))
                    {
                        ApplicationArea = All;
                        Style = Strong;
                        Caption = '5';
                    }
                    field(Occurences6; occurCount(6))
                    {
                        ApplicationArea = All;
                        Style = Strong;
                        Caption = '6';
                    }
                    field(StatTotalFld; StatTotal())
                    {
                        ApplicationArea = All;
                        Style = Strong;
                        Caption = 'Total';
                    }
                }
            }
        }
        area(FactBoxes)
        {
            part(GameLinePart; "Yahtzee Line Part")
            {
                Caption = 'Combinations';
                ApplicationArea = All;
                SubPageLink = "GameId" = field(GameId);
                UpdatePropagation = Both;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(NewGameAction)
            {
                Caption = 'New Game';
                ToolTip = 'This starts a new game';
                ApplicationArea = all;
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    Engine.NewGame();
                    UpdPageState();
                end;
            }
            action(DiceRollAction)
            {
                Caption = 'Roll dice';
                ToolTip = 'Rolls all marked Dice';
                ApplicationArea = all;
                Image = Change;
                Enabled = CanRollDice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    RunDiceRoll();
                end;
            }
            action(StatTest)
            {
                Caption = 'Test Dice Chances';
                ToolTip = 'Rolls the dice a 100 times to count occurrences of each number';
                ApplicationArea = all;
                Image = StatisticsGroup;

                trigger OnAction()
                begin
                    runStatTest();
                end;
            }
            action(GameOptions)
            {
                ApplicationArea = All;
                Caption = 'Game options';
                ToolTip = 'Small setup options for the game rules. It stays Disabled while a game is running';
                Image = Setup;
                //Enabled = (GameRunning = false);

                trigger OnAction()
                var
                    SetupDialog: Page "Yahtzee setup";
                begin
                    if SetupDialog.RunModal() = Action::OK then
                        SetupDialog.SaveSetup();
                    if SetupDialog.CleanupWasDone() then
                        ResetPage();
                end;
            }
        }
    }

    local procedure RunDiceRoll()
    var
    begin
        Engine.DiceRollAll(Rec);
        UpdPageState();
    end;

    local procedure GameDataID(): Integer
    begin
        exit(Engine.GetGameData().GameId);
    end;

    local procedure runStatTest(): Integer
    var
        Dice: Codeunit "Dice Six-Sided";
        idx: Integer;
    begin
        // Reset statistics
        for idx := 1 to 6 do begin
            stat[idx] := 0;
        end;
        // Redo statistics
        for idx := 1 to 100 do begin
            Dice.Roll();
            stat[dice.GetValue()] += 1;
        end;
    end;

    local procedure occurCount(chanceNum: Integer): Integer
    begin
        exit(stat[chanceNum]);
    end;

    local procedure StatTotal(): Integer
    var
        Total: Integer;
        iChance: Integer;
    begin
        for iChance := 1 to 6 do begin
            Total += stat[iChance];
        end;
        exit(Total);
    end;

    procedure OnChanceApplied()
    begin
        Engine.NewTurn(Rec);
        UpdPageState();
    end;

    local procedure UpdPageState()
    begin
        Rec := Engine.GetDiceRoundData();
        CurrGameId := Engine.GetGameData().GameId;
        DiceRoundNum := Rec.TryCount;
        GameRunning := Engine.IsGameRunning();
        CanRollDice := GameRunning AND (DiceRoundNum > 0) AND (DiceRoundNum < 3);
        CurrPage.GameLinePart.Page.OnDiceRolled(Engine);
    end;

    local procedure ResetPage()
    begin
        Engine.ResetGame();
        UpdPageState();
    end;

    trigger OnOpenPage()
    begin
        Randomize();
        ResetPage();
        CurrPage.Editable(true);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if CurrPage.GameLinePart.Page.GetChanceApplied() then
            OnChanceApplied();
    end;

    var
        Engine: Codeunit Yahtzee;
        ActionLabelDiceRoll: Label 'Roll dice';
        stat: Array[6] of Integer;
        ShowDiceValue: Boolean;
        // PageState Vars
        [InDataSet]
        GameRunning: Boolean;
        CurrGameId: Integer;
        CanRollDice: Boolean;
        [InDataSet]
        DiceRoundNum: Integer;
}