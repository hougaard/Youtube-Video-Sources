page 50710 "What is my IP Address"
{
    PageType = Card;
    Caption = 'What is my IP Address';
    Editable = false;
    UsageCategory = Administration;
    ApplicationArea = all;
    layout
    {
        area(Content)
        {
            field(IP; GetIP())
            {
                Caption = 'Current IP Address of BC Server';
                ApplicationArea = All;
            }
        }
    }
    procedure GetIP(): Text
    var
        Client: HttpClient;
        Respone: HttpResponseMessage;
        J: JsonObject;
        ResponeTxt: Text;
    begin
        // https://api.ipify.org?format=json
        if Client.Get('https://api.ipify.org?format=json', Respone) then
            if Respone.IsSuccessStatusCode() then begin
                Respone.Content().ReadAs(ResponeTxt);
                J.ReadFrom(ResponeTxt);
                exit(GetJsonTextField(J, 'ip'));
            end;
    end;

    procedure GetJsonTextField(O: JsonObject; Member: Text): Text
    var
        Result: JsonToken;
    begin
        if O.Get(Member, Result) then
            exit(Result.AsValue().AsText());
    end;
}
