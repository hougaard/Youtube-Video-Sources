page 50123 "Teams Part"
{
    PageType = CardPart;
    layout
    {
        area(Content)
        {
            usercontrol(HTMLctl; HTML)
            {
                ApplicationArea = All;
                trigger ControlReady()
                begin
                    CurrPage.HTMLctl.AddTeams();
                end;
            }
        }
    }
}