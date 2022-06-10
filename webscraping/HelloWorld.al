// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        httpClient: HttpClient;
        Response: HttpResponseMessage;
        RawHtml: Text;
        Regex: Codeunit Regex;
        Matches: Record Matches temporary;
        Groups: Record Groups temporary;
    begin
        if httpClient.Get('https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.efoqus-5058796%7CAID.replicator%7CPAPPID.18a4d438-88d1-44ee-a38d-3c0ea0d77338?tab=DetailsAndSupport', Response) then begin
            if Response.IsSuccessStatusCode() then begin
                Response.Content.ReadAs(RawHtml);
                Regex.Match(RawHtml, '\"AppVersion\":\"(\d{1,5}\.\d{1,5}\.\d{1,5}\.\d{1,5})\"', matches);
                if Matches.FindSet() then
                    repeat
                        Regex.Groups(Matches, Groups);
                        Groups.Get(1);
                        Message('Version is %1', copystr(RawHtml, Groups.Index + 1, Groups.Length));
                    until Matches.Next() = 0;
            end;
        end;
    end;
}