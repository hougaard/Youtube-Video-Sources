// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 74500 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Json: Codeunit "Json Tools";
        C: Record Customer;
    begin
        C.FindFirst();
        message('%1', Json.Rec2Json(C));
    end;
}