// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50123 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Http)
            {
                Caption = 'HttpClient Test';
                ApplicationArea = all;
                trigger OnAction()
                var
                    s: Time;
                    i: Integer;
                begin
                    s := Time();
                    for i := 1 to 100 do begin
                        if not HttpTest() then
                            error('Failed after %1 calls', i);
                    end;
                    message('Succes! %1', Time() - S);
                end;
            }
        }
    }
    procedure HttpTest(): Boolean
    var
        //Client: HttpClient;
        Resp: HttpResponseMessage;
        Txt: Text;
    begin
        if Client.Get('https://www.google.com', Resp) then begin
            if Resp.IsSuccessStatusCode() then begin
                Resp.Content().ReadAs(Txt);
            end;
            exit(true);
        end;
        exit(false);
    end;

    var
        Client: HttpClient;
}