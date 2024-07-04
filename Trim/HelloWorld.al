// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.Trim;

using Microsoft.Sales.Customer;

pageextension 50100 CustomerListExt extends "Customer Card"
{
    layout
    {
        modify(Name)
        {
            trigger OnBeforeValidate()
            begin
                Rec.Name := Rec.Name.Trim();
            end;
        }
        modify("Home Page")
        {
            trigger OnBeforeValidate()
            begin
                Rec."Home Page" := Rec."Home Page".Trim().TrimEnd('/') + '/contact.html';
            end;
        }
    }
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}