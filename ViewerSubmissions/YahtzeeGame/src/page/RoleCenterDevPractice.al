page 54585 "Development Role Center"
{
    PageType = RoleCenter;
    Caption = 'Development Role Center';

    layout
    {
        area(RoleCenter)
        {
            // part(Headline; "Headline RC Development Role Center
            //     ApplicationArea = Basic, Suite;
            // }
        }
    }

    actions
    {
        area(Creation)
        {
            // action("AppNameDocumentCard")
            // {
            //     RunPageMode = Create;
            //     Caption = 'AppNameDocumentCard';
            //     ToolTip = 'Add some tooltip here';
            //     Image = New;
            //     RunObject = page "AppNameDocumentCard";
            //     ApplicationArea = Basic, Suite;
            // }
        }
        area(Processing)
        {
            group("AppNameSomeProcess Group")
            {
                // action("AppNameSomeProcess")
                // {
                //     Caption = 'AppNameSomeProcess';
                //     ToolTip = 'AppNameSomeProcess description';
                //     Image = Process;
                //     RunObject = Codeunit "AppNameSomeProcess";
                //     ApplicationArea = Basic, Suite;
                // }
            }
        }
        area(Reporting)
        {
            // action("AppNameSomeReport")
            // {
            //     Caption = 'AppNameSomeReport';
            //     ToolTip = 'AppNameSomeReport description';
            //     Image = Report;
            //     RunObject = report "AppNameSomeReport";
            //     Promoted = true;
            //     PromotedCategory = Report;
            //     PromotedIsBig = true;
            //     ApplicationArea = Basic, Suite;
            // }
        }
        area(Embedding)
        {
            action("Yahtzee Setup")
            {
                RunObject = page "Yahtzee setup";
                ApplicationArea = All;
            }
        }
        area(Sections)
        {
            group(Games)
            {
                Caption = 'Games';
                ToolTip = 'Development practicing by creating a Game';
                Image = Capacities;

                action("Yahtzee")
                {
                    ToolTip = 'Run the Yahtzee game page';
                    ApplicationArea = All;
                    RunObject = page Yahtzee;
                }
            }
        }
    }

}