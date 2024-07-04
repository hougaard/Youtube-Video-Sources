// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.QuerySaveAs;

using Microsoft.Sales.Customer;
using Microsoft.Bank.Ledger;
using System.Utilities;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        q: Query "Bank Account Ledger Entries";
        OutS: OutStream;
        Blob: Codeunit "Temp Blob";
        InS: InStream;
        FileName: Text;
        Sep: Text[1];
        Parts: List of [Text];
        FieldNames: List of [Text];
        Line: Text;
        Data: JsonArray;
        DataEntry: JsonObject;
        i: Integer;
        Dec: Decimal;
        DT: DateTime;
        B: Boolean;
    begin
        Blob.CreateOutStream(OutS);
        Sep[1] := 1;
        q.SaveAsCsv(OutS, 1, Sep);
        Blob.CreateInStream(InS);
        InS.ReadText(Line);
        FieldNames := Line.Split(Sep);
        while InS.ReadText(Line) > 0 do begin
            Parts := Line.Split(Sep);
            Clear(DataEntry);
            for i := 1 to Parts.Count do begin
                if Evaluate(DT, Parts.Get(i)) then
                    DataEntry.Add(FieldNames.Get(i), DT)
                else
                    if Evaluate(Dec, Parts.Get(i)) then
                        DataEntry.Add(FieldNames.Get(i), Dec)
                    else
                        if Evaluate(B, Parts.Get(i)) then
                            DataEntry.Add(FieldNames.Get(i), B)
                        else
                            DataEntry.Add(FieldNames.get(i), Parts.Get(i));
            end;
            Data.Add(DataEntry);
        end;
        message('%1', format(Data));
        //FileName := 'data.csv';
        //DownloadFromStream(InS, '', '', '', FileName);
    end;
}