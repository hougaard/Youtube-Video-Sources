// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.MedusaRecords;

using Microsoft.Sales.Customer;
using System.Environment;
using System.Reflection;

pageextension 51100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Reports: Record AllObj;
        SessionId: Integer;
        Medusa: Record Medusa;
    begin
        Medusa.DeleteAll();
        Reports.setrange("Object Type", Reports."Object Type"::Report);
        if Reports.FindSet() then
            repeat
                //if Codeunit.Run(Codeunit::MedusaDetector, Reports) then;
                StartSession(SessionId, Codeunit::MedusaDetector, CompanyName, Reports);
            until Reports.Next() = 0;
    end;
}

codeunit 51100 "MedusaDetector"
{
    TableNo = AllObj;
    trigger OnRun()
    var
        RDI: Record "Report Data Items";
        Medusa: Record Medusa;
    begin
        Medusa.Init();
        Medusa.ReportID := Rec."Object ID";
        Medusa.Status := Medusa.Status::Medusa;
        Medusa.Insert();
        Commit();
        RDI.Setrange("Report ID", Rec."Object ID");
        if RDI.findset() then
            repeat
            until RDI.Next() = 0;
        Medusa.Status := Medusa.Status::"No Medusa";
        Medusa.Modify();
    end;
}

table 51100 "Medusa"
{
    fields
    {
        field(1; ReportID; Integer)
        { }
        field(2; Status; Option)
        {
            OptionMembers = Medusa,"No Medusa";
        }
    }
    keys
    {
        key(PK; ReportID)
        { }
    }
}