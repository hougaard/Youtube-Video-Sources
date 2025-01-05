// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.MultiTasking;

using Microsoft.Sales.Customer;
using Microsoft.Purchases.Vendor;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Vendor: Record Vendor;
        Parm: Record "StartSession Parameter";
        Log: Record "Session Log";
        DebugMode: Boolean;
    begin
        DebugMode := false;
        Parm.CustomerNo := 'hello';
        Parm.VendorNo := 'world';
        Parm.LogId := CreateGuid();
        if DebugMode then
            Codeunit.Run(Codeunit::"The Works", Parm)
        else begin
            StartSession(Log.SessionId, Codeunit::"The Works", CompanyName(), Parm);
            Sleep(10 * 1000);
            Log.Get(Parm.LogId);
            Message('Elapsed %1', Log.Elapsed);
        end;
    end;
}

table 50101 "Session Log"
{
    fields
    {
        field(1; ID; Guid)
        { }
        field(2; SessionId; Integer)
        {

        }
        field(10; Result; Text[100])
        {

        }
        field(20; StartTime; DateTime)
        {

        }
        field(21; StopTime; DateTime)
        {

        }
        field(22; Elapsed; Duration)
        {

        }
    }
    keys
    {
        key(PK; ID)
        { }
    }
}

table 50100 "StartSession Parameter"
{
    TableType = Temporary;
    fields
    {
        field(1; CustomerNo; Code[20])
        {

        }
        field(2; VendorNo; Code[20])
        {

        }
        field(3; LogId; Guid)
        {

        }
    }
}