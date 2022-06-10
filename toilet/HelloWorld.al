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

        Request.GetHeaders(Headers);
        Headers.Add('Authorization', 'Bearer w83479tywn89eruigwn eruigheruihwerigserfv');
        Headers.Add('EriksHeader', 'A great value');

        Content.WriteFrom('{ "test" : 123 }');

        Content.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'application/json');

        Request.Content := Content;
        Client.Send(Request, Response);
        Headers := Response.Headers();

    end;
}