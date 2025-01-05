codeunit 50100 "The Works"
{
    TableNo = "StartSession Parameter";
    trigger OnRun()
    var
        Customer: Record Customer;
        Log: Record "Session Log";
    begin
        Log.Init();
        Log.StartTime := CurrentDateTime();
        Sleep(3 * 1000);
        Customer.FindFirst();
        Customer.Address := Rec.CustomerNo + ' ' + Rec.VendorNo;
        Customer.Modify();
        Log.SessionId := SessionId;
        Log.Id := Rec.LogId;
        Log.StopTime := CurrentDateTime();
        Log.Elapsed := Log.StopTime - Log.StartTime;
        Log.Insert();
    end;
}