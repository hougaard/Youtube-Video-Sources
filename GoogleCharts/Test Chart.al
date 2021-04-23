page 51100 TestGoogleChart
{
    PageType = Card;
    layout
    {
        area(Content)
        {
            usercontrol(Chart; GoogleCharts)
            {
                ApplicationArea = all;
                trigger ControlReady()
                var
                    Customer: Record Customer;
                    Data: JsonArray;
                    JsonA: JsonArray;
                begin
                    Customer.SetAutoCalcFields("Sales (LCY)");
                    JSonA.Add('Customer');
                    JsonA.Add('Sales');
                    Data.Add(JsonA);
                    if Customer.FindSet() then
                        repeat
                            clear(JsonA);
                            JsonA.Add(Customer.Name);
                            JsonA.Add(Customer."Sales (LCY)");
                            Data.Add(JsonA);
                        until Customer.Next() = 0;
                    //message('%1', format(Data));
                    CurrPage.Chart.RunSomeCode(Data);
                end;
            }
        }
    }
}