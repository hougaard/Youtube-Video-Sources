page 50100 "Spinner"
{
    ApplicationArea = all;
    layout
    {
        area(Content)
        {
            usercontrol(Spin; WaitSpinner)
            {
                trigger Ready()
                begin
                    if ControlReady then
                        exit;
                    ControlReady := true;
                    CurrPage.Spin.Wait(0);
                end;

                trigger Callback()
                var
                    Customer: Record Customer;
                begin
                    Customer.SetAutoCalcFields(Balance);
                    if Customer.FindSet() then
                        repeat
                            Balance += Customer.Balance + Random(100);
                        until Customer.NExt() = 0;
                    CurrPage.Spin.Wait(0);
                end;
            }
            field(WaitTime; Balance)
            {
                Caption = 'Wating';
                Editable = false;
            }
        }
    }
    trigger OnOpenPage()
    begin
    end;

    var
        ControlReady: Boolean;
        Balance: Decimal;
        WaitTime: Integer;
}