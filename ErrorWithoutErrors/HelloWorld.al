// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50106 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
    begin
        if Client.Get('krjfvndkfjghszjfkgbdzkvjzsdfhbv', Response) then begin
            if Response.IsSuccessStatusCode() then
                message('All good! %1', Response.HttpStatusCode());
        end else
            message('%1', GetLastErrorText());
    end;
}