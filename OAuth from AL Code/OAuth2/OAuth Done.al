page 50102 "OAuth Done"
{
    PageType = Card;
    Editable = true;
    PromotedActionCategories = 'Process';
    layout
    {
        area(Content)
        {
            field(Token; TokenValue)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(testURL; testURL)
            {
                ApplicationArea = All;
                Editable = true;
                MultiLine = true;
            }
            field(T2; TestResult)
            {
                ApplicationArea = All;
                Editable = false;
                MultiLine = true;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(SearchNow)
            {
                Caption = 'Search';
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Search(testURL);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        IsolatedStorage.Get('OAUTH-TOKEN', TokenValue);
    end;

    procedure Search(QueryString: Text): Text
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Headers: HttpHeaders;
        Access_Token: Text;
    begin
        Request.GetHeaders(Headers);
        IsolatedStorage.Get('OAUTH-TOKEN', Access_Token);
        Headers.Add('Authorization', 'Bearer ' + Access_Token);
        Headers.Add('X-Restli-Protocol-Version', '2.0.0');

        Request.Method := 'GET';
        Request.SetRequestUri('https://api.linkedin.com/v2/' + QueryString);
        if Client.Send(Request, Response) then begin
            Response.Content().ReadAs(TestResult);
        end else
            error('Could not contact api.linkedin.com');
    end;

    var
        TokenValue: Text;
        TestResult: Text;
        testURL: Text;
}