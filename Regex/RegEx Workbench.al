page 51100 "RegEx Workbench"
{
    PageType = Card;
    Caption = 'RegEx Workbench';
    UsageCategory = Administration;
    ApplicationArea = all;
    layout
    {
        area(Content)
        {
            field(InputData; InputData)
            {
                Caption = 'Input';
                ApplicationArea = all;
                MultiLine = true;
            }
            field(Pattern; Pattern)
            {
                Caption = 'Pattern';
                ApplicationArea = All;
                trigger OnAssistEdit()
                var
                    PatRec: REcord "RegEx Pattern";
                begin
                    if page.RunModal(Page::Patterns, PatRec) = action::LookupOK then
                        Pattern := PatRec.RegEx;
                end;
            }
            part(Matchpart; "RegEx Matches")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(MatchAction)
            {
                caption = 'Match';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    RegEx: Codeunit Regex;
                begin
                    RegEx.Match(InputData, Pattern, Matches);
                    CurrPage.Matchpart.Page.Fill(InputData, Matches);
                end;
            }
        }
    }

    var
        Matches: Record Matches;
        InputData: Text;
        Pattern: Text;
}