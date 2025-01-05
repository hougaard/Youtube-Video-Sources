// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.Nuget;

using Microsoft.Sales.Customer;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        WooSetup: Record "Woo Webstore Connector Setup";
        SP: Codeunit "SharePoint EFQ";
        APD: Record "APD Setup Hgd";
        AVADetailPosted: Record "AVA Detail Posted";
    begin
        Message('App published: Hello world');
    end;
}