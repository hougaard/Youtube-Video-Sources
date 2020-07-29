page 50130 "Test Enum Select"
{
    trigger OnOpenPage()
    var
        p: Page "Select an Enum";
        N: Integer;
    begin
        repeat
            clear(p);
            p.SetupPage(77, 1);
            p.LookupMode(true);
            if p.RunModal() = Action::LookupOK then begin
                N := p.GetSelectedEnum();
                Message('You selected %1', N);
            end;
        until 4 = 5;
    end;
}