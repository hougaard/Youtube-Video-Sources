// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        headers : HttpHeaders;
    begin
        headers.Keys
    end;

    [ErrorBehavior(ErrorBehavior::Collect)]
    procedure Test()
    var
        err : ErrorInfo;
    begin
        err := ErrorInfo.Create('Error');   
        err.

    end;
}