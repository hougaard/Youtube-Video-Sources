pageextension 51100 "Standard dialog ext" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                Caption = 'Test Standard Dialog';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    SD: Page "Standard dialog test";
                begin
                    SD.Setup('Erik', 'Soccer', 'Euro 2020 in 2021');
                    if SD.RunModal() = Action::OK then begin
                        message('%1 %2 %3', SD.GetX(), SD.GetY(), SD.GetZ());
                        message('%1 %2 %3', SD.GetX(), SD.GetY(), SD.GetZ());
                    end;
                end;
            }
        }
    }
}