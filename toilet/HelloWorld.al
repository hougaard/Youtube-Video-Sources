// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        Headers: HttpHeaders;
    begin
        Request.Method := 'POST';
        Request.SetRequestUri('https://ptsv2.com/t/youtube/post?Parm1=1234&Parm2=Erik');
        //Request.SetRequestUri('https://hougaard.sharepoint.com/apijkgksdjf glssdk jskdg');
        Content.WriteFrom('Hello Youtube');
        Request.Content := Content;
        Request.GetHeaders(Headers);
        Headers.Add('Authorization', 'Bearer thisisatoken');
        Client.Send(Request, Response);
    end;
}