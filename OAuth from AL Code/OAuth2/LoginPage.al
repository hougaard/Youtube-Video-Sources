page 50100 "OAuth2 Login Page"
{
    ApplicationArea = all;
    Caption = 'OAuth Test Page';
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            label(Warning)
            {
                Caption = 'Please allow popups from this page.';
                ApplicationArea = all;
            }
            usercontrol(oa; OAuthReDirect)
            {
                ApplicationArea = All;
                trigger ControlReady()
                var
                    Secrets: Codeunit "AL Secret";
                    TypeHelper: Codeunit "Type Helper";
                    URL: Text;
                    URL2: Text;
                    AuthorizationEndpoint: Text;
                    TokenEndpoint: Text;
                    ClientID: Text;
                    ClientSecret: Text;
                    AppCallbackUrl: Text;
                    StateValue: Text;
                begin
                    AuthorizationEndpoint := 'https://www.linkedin.com/oauth/v2/authorization';
                    TokenEndpoint := 'https://www.linkedin.com/oauth/v2/accessToken';
                    AppCallbackUrl := 'https://businesscentral.dynamics.com/sandbox?page=50101';
                    AppCallbackUrl := TypeHelper.UrlEncode(AppCallbackUrl);
                    ClientID := Secrets.getclientid();
                    ClientSecret := Secrets.getclientsecret();

                    StateValue := State();

                    URL := AuthorizationEndpoint + '?' +
                           'response_type=code' +
                           '&client_id=' + ClientID +
                           '&redirect_uri=' + AppCallbackUrl +
                           '&state=' + StateValue +
                           '&scope=r_liteprofile+r_emailaddress';

                    URL2 := TokenEndpoint + '?' +
                            'grant_type=authorization_code' +
                            '&code=AUTH_CODE_HERE' +
                            '&redirect_uri=' + AppCallbackUrl +
                            '&client_id=' + ClientID +
                            '&client_secret=' + ClientSecret;

                    CurrPage.oa.LaunchURLinNewWindow(URL);
                    IsolatedStorage.Set('OAUTH-STATE', StateValue);
                    IsolatedStorage.Set('OAUTH-URL2', URL2);
                    if IsolatedStorage.Delete('OAUTH-TOKEN') then;
                    CurrPage.oa.StartTimer();
                end;

                trigger TimerTic()
                begin
                    if IsolatedStorage.Contains('OAUTH-TOKEN') then begin
                        CurrPage.oa.CloseWindow();
                        Page.run(50102);
                        CurrPage.Close();
                    end;
                end;
            }
        }
    }
    procedure State(): Text
    begin
        exit(format(Random(1000000), 0, 9) + format(Random(1000000), 0, 9) + format(Random(1000000), 0, 9));
    end;
}