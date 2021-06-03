pageextension 70310155 "OpenRates Currencies" extends Currencies
{
    actions
    {
        addlast(processing)
        {
            action(GetOpenRates)
            {
                Caption = 'Get OpenRates';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                trigger OnAction()
                var
                    OpenRates: Codeunit "OpenRates Mgt";
                begin
                    OpenRates.GetRateForDate(Today());
                end;
            }
        }
    }
}