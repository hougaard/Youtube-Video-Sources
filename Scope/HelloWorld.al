// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    begin
        Message('This is %1', CompanyName());
        Test2();
    end;

    procedure Test2()
    begin
        CompanyName := 'Global Var';
        Message('This is %1', CompanyName);
        Test();
    end;

    procedure Test()
    var
        CompanyName: Text;
        Today: Date;
    begin
        Today := 20230101D;
        CompanyName := 'Local Var';
        Message('Today'' date is %1', Today);
    end;

    var
        CompanyName: Text;
}