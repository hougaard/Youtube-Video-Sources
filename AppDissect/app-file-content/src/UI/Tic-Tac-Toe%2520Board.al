page 54500 "Tic-Tac-Toe"
{
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "TTT Board";
    DataCaptionExpression = 'Tic - Tac - Toe';
    UsageCategory = Tasks;
    ApplicationArea = all;
    layout
    {
        area(Content)
        {
            group(Game1)
            {
                ShowCaption = false;
                grid(row_1)
                {
                    GridLayout = Columns;
                    field(B1; Rec.B1)
                    {
                        ShowCaption = false;
                        ApplicationArea = all;
                    }
                    field(B2; Rec.B2)
                    {
                        ShowCaption = false;
                        ApplicationArea = all;
                    }
                    field(B3; Rec.B3)
                    {
                        ShowCaption = false;
                        ApplicationArea = all;
                    }
                }
            }
            group(Game2)
            {
                ShowCaption = false;
                grid(row_2)
                {
                    GridLayout = Columns;
                    field(B4; Rec.B4)
                    {
                        ShowCaption = false;
                        ApplicationArea = all;
                    }
                    field(B5; Rec.B5)
                    {
                        ShowCaption = false;
                        ApplicationArea = all;
                    }
                    field(B6; Rec.B6)
                    {
                        ShowCaption = false;
                        ApplicationArea = all;
                    }
                }
            }
            group(Game3)
            {
                ShowCaption = false;
                grid(row_3)
                {
                    GridLayout = Columns;
                    field(B7; Rec.B7)
                    {
                        ShowCaption = false;
                        ApplicationArea = all;
                    }
                    field(B8; Rec.B8)
                    {
                        ShowCaption = false;
                        ApplicationArea = all;
                    }
                    field(B9; Rec.B9)
                    {
                        ShowCaption = false;
                        ApplicationArea = all;
                    }
                }
            }
            usercontrol(HTML; HTML)
            {
                ApplicationArea = all;
                trigger ControlReady()
                begin
                    CurrPage.HTML.AttachClickTracker();
                end;

                trigger ControlClicked(Control: Text)
                begin
                    if LastClicked = 0 then begin
                        LastClicked := Engine.UserClicked(Rec, Control);
                        if LastClicked > 0 then
                            CurrPage.HTML.StartTimer(500);
                        CalcScoreInfo := '';
                    end;
                end;

                trigger TimerTic()
                begin
                    CurrPage.HTML.StopTimer();
                    if LastClicked <> 0 then begin
                        LastClicked := 0;
                        if not Engine.RoomLeft() then
                            Message('The only winning move it not to play!')
                        else begin
                            Engine.PlayComputer(Rec, LastClicked);
                            CalcScoreInfo := Engine.CalcInfo();
                        end;
                    end;
                end;
            }
            field(Info2; CalcScoreInfo)
            {
                ShowCaption = false;
                ApplicationArea = all;
                Editable = false;
                Style = Strong;
                Visible = false;
            }
        }
        area(FactBoxes)
        {
            part(Info; "Instructions")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(HostNewGame)
            {
                Caption = 'New game';
                ToolTip = 'Start a new game!';
                ApplicationArea = all;
                Image = NewOpportunity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    CurrPage.Update(false);
                    Engine.NewGameAndClearBoard(Rec);
                    LastClicked := 0;
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        Engine.NewGameAndClearBoard(Rec);
    end;

    trigger OnOpenPage()
    begin
        Randomize();
        Rec.Insert();
        CurrPage.Editable(false);
    end;

    var
        Engine: Codeunit "Game Engine";
        CalcScoreInfo: Text;
        LastClicked: Integer;
}