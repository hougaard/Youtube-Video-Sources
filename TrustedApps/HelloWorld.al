// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 RecAppList extends "Recommended Apps List"
{
    trigger OnOpenPage();
    var
        RecApp: Codeunit "Recommended Apps";
    begin
        RecApp.DeleteAllApps();
        RecApp.InsertApp(CreateGuid(), -9999, 'Simple Object Designer', 'Hougaard', 'No-Code development tools for BC', 'Add fields to tables, pages and reports. And expose data as API pages, all without writing any code',
        "Recommended By"::App,
        'https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.hougaard-4699382%7CAID.designer%7CPAPPID.4c032704-5c36-4480-b710-29e8565568bc');
    end;
}

enumextension 50100 "Recom" extends "App Recommended By"
{
    value(1; "App")
    {
        Caption = 'An installed app';
    }
}