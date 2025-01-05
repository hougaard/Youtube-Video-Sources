// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.RandomData;

using Microsoft.Sales.Customer;
using Microsoft.CRM.BusinessRelation;
using System.RestClient;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        starttime: DateTime;
    begin
        starttime := CurrentDateTime();
        Rec.Setfilter(Name, '@erik*'); // 39 milliseconds
        //Rec.Setfilter(Name, '&&Erik*'); // 13-17 milliseconds

        if Rec.FindSet() then
            repeat
            until Rec.Next() = 0;

        message('Time spent %1', CurrentDateTime() - starttime);
    end;
}