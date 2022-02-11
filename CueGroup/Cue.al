page 66100 "Cue Test"
{
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            cuegroup(g1)
            {
                Caption = 'A nice caption';
                field(Number; Number)
                {
                    Caption = 'Number';
                    ApplicationArea = all;
                    trigger OnDrillDown()
                    begin
                        Message('Hello Mom, I''m doing cues!');
                    end;
                }
                field(Balance; Rec.Balance)
                {
                    //Style = Favorable;
                    StyleExpr = 'Unfavorable';
                    ApplicationArea = all;
                }
                field("Balance Due"; Rec."Balance Due")
                {
                    ApplicationArea = all;
                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                    ApplicationArea = all;
                }
            }
            cuegroup(g2)
            {
                caption = 'Even more actions';
                actions
                {
                    action(HelloWorld)
                    {
                        Caption = 'Hello World';
                        ApplicationArea = all;
                        Image = TileBrickCustomer;
                        trigger OnAction()
                        begin
                            Message('Hello World');
                        end;
                    }
                    action(HelloWorld2)
                    {
                        Caption = 'Hello World2';
                        ApplicationArea = all;
                        Image = TileOrange;
                        trigger OnAction()
                        begin
                            Message('Hello World');
                        end;
                    }
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Number := -99;
    end;

    var
        Number: Integer;
}