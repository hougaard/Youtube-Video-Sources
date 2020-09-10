page 50132 "Test Chart"
{
    PageType = Card;
    Caption = 'Test Chart';
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(Content)
        {
            usercontrol(Chart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
            {
                ApplicationArea = All;
                trigger DataPointClicked(point: JsonObject)
                var
                    JsonTxt: Text;
                begin
                    point.WriteTo(JsonTxt);
                    Message('%1', JsonTxt);
                end;

                trigger AddInReady()
                var
                    Buffer: Record "Business Chart Buffer" temporary;
                    Customer: Record Customer;
                    i: Integer;
                begin
                    Buffer.Initialize();

                    // Index 0
                    Buffer.AddMeasure('Sales', 1, Buffer."Data Type"::Decimal, Buffer."Chart Type"::Column);

                    // Index 1
                    Buffer.AddMeasure('Profit', 1, Buffer."Data Type"::Decimal, Buffer."Chart Type"::Pie);

                    Buffer.SetXAxis('Customer', Buffer."Data Type"::String);

                    if Customer.FindSet(false, false) then
                        repeat
                            Customer.CalcFields("Sales (LCY)", "Profit (LCY)");
                            if Customer."Sales (LCY)" <> 0 then begin
                                Buffer.AddColumn(Customer.Name);
                                Buffer.SetValueByIndex(0, i, Customer."Sales (LCY)");
                                Buffer.SetValueByIndex(1, i, Customer."Profit (LCY)");
                                i += 1;
                            end;
                        until Customer.Next() = 0;

                    Buffer.Update(CurrPage.Chart);
                end;
            }
        }
    }
}