// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        AzureAuth: Codeunit "Azure Functions Authentication";
        AzureFunc: Codeunit "Azure Functions";
        Auth: Interface "Azure Functions Authentication";
        Response: Codeunit "Azure Functions Response";
        Query: Dictionary of [Text, Text];
        Result: Text;
    begin
        Auth := AzureAuth.CreateCodeAuth('https://callmefromal20221106104102.azurewebsites.net/api/Function1',
                                         '1tz26BtEaDtNpASSQp8bLu0QjEwCmD8menaQogWJbm-8AzFu1O94kQ==');
        Query.Add('name', 'Erik');
        Response := AzureFunc.SendGetRequest(Auth, Query);
        //Response := AzureFunc.SendPostRequest(Auth,)
        Response.GetResultAsText(Result);
        message('%1\%2\%3', Response.IsSuccessful(), Response.GetError(), Result);
    end;
}