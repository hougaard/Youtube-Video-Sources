// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.RandomData;

using Microsoft.Sales.Customer;
using Microsoft.CRM.BusinessRelation;
using System.RestClient;

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Import)
            {
                Caption = 'Create Customers';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    Import();
                end;
            }
        }
    }
    procedure Import()
    var
        Rest: Codeunit "Rest Client";
        JSONTools: Codeunit JSONTools;
        Data: JsonObject;
        Results: JsonArray;
        T: JsonToken;
        Person: JsonObject;
        Customer: Record Customer;
        Name: JsonObject;
        Location: JsonObject;
        Street: JsonObject;
        Rel: Record "Contact Business Relation";
    begin
        //.DeleteAll();
        Data := rest.GetAsJson('https://randomuser.me/api/?results=1000').AsObject();

        Results := JSONTools.GetArray(Data, 'results');

        foreach T in results do begin
            Person := T.AsObject();

            Customer.Init();
            Customer."No." := '';
            Customer.Insert(true);
            // Extract sub json structures
            Name := JSONTools.GetObj(Person, 'name');
            Location := JSONTools.GetObj(Person, 'location');
            Street := JSONTools.GetObj(Location, 'street');

            Customer.Validate(Name, JSONTools.GetText(Name, 'first') + ' ' + JSONTools.GetText(Name, 'last'));
            Customer.Validate(Address, JSONTools.GetText(Street, 'name') + ' ' + JSONTools.GetText(Street, 'number'));
            Customer.City := copystr(JSONTools.GetText(Location, 'city'), 1, MaxStrLen(Customer.City));
            Customer."Post Code" := JSONTools.GetText(Location, 'postcode');
            Customer.County := JSONTools.GetText(Location, 'state');
            //Customer."Country/Region Code"
            Customer."E-Mail" := JSONTools.GetText(Person, 'email');
            Customer.Modify(true);
        end;
    end;
}