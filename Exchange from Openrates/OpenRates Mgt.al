codeunit 70310155 "OpenRates Mgt"
{
    procedure GetRateForDate(D: Date)
    var
        GenLedSetup: Record "General Ledger Setup";
        Client: HttpClient;
        Response: HttpResponseMessage;
        ContentTxt: Text;
        Root: JsonObject;
        rates: JsonToken;
        CurRec: Record Currency;
        rate: JsonToken;
        CurRate: Decimal;
        DateToken: JsonToken;
        CurDate: Date;
        ExchangeRate: Record "Currency Exchange Rate";
        keys: List of [Text];
        k: Text;
    begin
        GenLedSetup.Get();
        if Client.Get('https://api.openrates.io/' + format(D, 0, 9) + '?base=' + GenLedSetup."LCY Code", Response) then begin
            if Response.IsSuccessStatusCode() then begin
                if Response.Content().ReadAs(ContentTxt) then begin
                    if Root.ReadFrom(ContentTxt) then begin
                        if Root.Get('rates', rates) then begin
                            Root.Get('date', DateToken);
                            CurDate := DateToken.AsValue().AsDate();
                            if CurRec.FindSet() then
                                repeat
                                    if rates.AsObject().Contains(CurRec.Code) then begin
                                        if rates.AsObject().Get(CurRec.Code, rate) then begin
                                            CurRate := rate.AsValue().AsDecimal();
                                            ExchangeRate.Init();
                                            ExchangeRate."Currency Code" := CurRec.Code;
                                            ExchangeRate."Starting Date" := CurDate;
                                            if ExchangeRate.Insert(true) then begin
                                                ExchangeRate.Validate("Exchange Rate Amount", 1);
                                                ExchangeRate.Validate("Relational Exch. Rate Amount", 1 / CurRate);
                                                ExchangeRate.Modify(true);
                                            end;
                                        end;
                                    end;
                                until CurRec.Next() = 0;
                        end else
                            error('Could not find "rates" in json (%1)', ContentTxt);
                    end else
                        error('Malformed JSON (%1)', ContentTxt);
                end else
                    error('Server did not return any data');
            end else begin
                if Response.Content().ReadAs(ContentTxt) then
                    error('Http call failed, return value (%1) (Info %2', Response.HttpStatusCode(), ContentTxt)
                else
                    error('Http call failed, return value (%1)', Response.HttpStatusCode());
            end;
        end else
            error('Could not connect to openrates.io');
    end;
}
