// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('Test %1', QBNegativeId(-2147483075));
    end;

    procedure QBNegativeId(NegativeId: Integer): Integer
    begin
        exit(power(2, 31) + NegativeId);
    end;
}