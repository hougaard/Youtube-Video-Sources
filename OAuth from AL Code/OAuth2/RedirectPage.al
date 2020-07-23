page 50101 "OAuth2 Redirect Page"
{
    Caption = 'Authentication';
    layout
    {
        area(Content)
        {
            label(Done)
            {
                Caption = 'Authentication finished, please close this window.';
                ApplicationArea = All;
            }
            usercontrol(oa; OAuthReDirect)
            {
                ApplicationArea = All;
                trigger RedirectReceived(Code: Text; State: Text)
                var
                    ID: Text;
                    ContinuePageTxt: Text;
                    ContinuePageID: Integer;
                    StateValue: Text;
                    WebClient: HttpClient;
                    Response: HttpResponseMessage;
                    URL2: Text;
                    Token: Text;
                    JO: JsonObject;
                    JT: JsonToken;
                begin
                    IsolatedStorage.Get('OAUTH-STATE', StateValue);
                    if StateValue <> State then
                        ERROR('OAuth2 State mismatch, aborting! (%1 <> %2)', State, StateValue);
                    IsolatedStorage.Set('OAUTH-CODE', Code);
                    IsolatedStorage.Get('OAUTH-URL2', URL2);
                    URL2 := URL2.Replace('AUTH_CODE_HERE', Code);
                    if WebClient.Get(URL2, Response) then begin
                        if Response.HttpStatusCode = 200 then begin
                            Response.Content().ReadAs(Token);
                            JO.ReadFrom(Token);
                            if JO.Get('access_token', JT) then begin
                                JT.WriteTo(Token);
                                IsolatedStorage.Set('OAUTH-TOKEN', copystr(Token, 2, strlen(Token) - 2));
                            end else
                                error('Error: API Server did not return a token (%1)', Token);
                        end else
                            error('Error: API Server returned %1', Response.HttpStatusCode);
                    end else
                        error('Could not contact API Server');
                    Done := true;
                    CurrPage.Caption('Authentication Done');
                    CurrPage.oa.CloseCurrentWindow();
                end;
            }
        }
    }
    var
        Done: Boolean;
}