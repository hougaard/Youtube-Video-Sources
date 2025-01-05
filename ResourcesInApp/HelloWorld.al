// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ResourcesInApp;

using Microsoft.Sales.Customer;
using System.Utilities;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Resource: Text;
        InS: InStream;
        data: Text;
    begin
        foreach Resource in NavApp.ListResources() do begin
            //Message('%1', NavApp.GetResourceAsText(Resource));
            NavApp.GetResource(Resource, InS);
            InS.Read(data);
            message(data);
        end;
    end;
}