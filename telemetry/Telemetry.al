codeunit 50100 "Telemetry Query thing"
{
    procedure RunQuery()
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Headers: HttpHeaders;
        Content: HttpContent;
        RequestJson: JsonObject;
        ResponseTxt: Text;
        ResponseJson: JsonObject;
        tables: JsonArray;
        T: JsonToken;
        firstTable: JsonObject;
        tablerows: JsonArray;
        row: JsonArray;
    begin

        Request.Method := 'POST';
        Request.SetRequestUri('https://api.applicationinsights.io/v1/apps/fe398af0-439e-481b-9033-5c3e2a04c5dc/query');
        Request.GetHeaders(Headers);
        // key = zjfiij0j5xagnx4qu677j61rj2h1jvyvyp7nsjie
        Headers.Add('x-api-key', 'zjfiij0j5xagnx4qu677j61rj2h1jvyvyp7nsjie');

        RequestJson.Add('query', 'traces| where timestamp > ago(1d)| project customDimensions.eventId, customDimensions.companyName, message');
        Content.WriteFrom(format(RequestJson));
        Content.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'application/json');
        Request.Content(Content);
        if Client.Send(Request, Response) then begin
            if Response.IsSuccessStatusCode() then begin
                Response.Content().ReadAs(ResponseTxt);
                ResponseJson.ReadFrom(ResponseTxt);
                ResponseJson.Get('tables', T);
                tables := T.AsArray();
                tables.Get(0, T);
                firstTable := T.AsObject();
                firstTable.get('rows', T);
                tablerows := T.AsArray();
                tablerows.get(0, T);
                row := T.AsArray();
                message('%1', format(row));
            end else
                error('We got %1 errors', Response.HttpStatusCode());
        end else
            error('Deep trouble!');

    end;
}