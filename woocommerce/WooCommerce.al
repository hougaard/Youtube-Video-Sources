codeunit 51200 "WooCommerce Connector"
{
    procedure GetProducts()
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        ResponseTxt: Text;
        Products: JsonArray;
        Product: JsonObject;
        T: JsonToken;
        NameField: JsonToken;
        ck: Text;
        cs: Text;
    begin
        ck := 'ck_31d8c555d66ebd1c7bc8f61c5020eb647b64f3b9';
        cs := 'cs_a5e0706a4b9e3afcb36c2f576fe417ac83f37c9e';
        Request.Method := 'GET';
        Request.SetRequestUri('https://www.hougaard.com/wp-json/wc/v3/products?consumer_key=' + ck + '&consumer_secret=' + cs);

        if Client.Send(Request, Response) then begin
            if Response.IsSuccessStatusCode() then begin
                Response.Content().ReadAs(ResponseTxt);
                Products.ReadFrom(ResponseTxt);
                foreach T in Products do begin
                    Product := T.AsObject();
                    Product.Get('name', NameField);
                    message('%1', NameField.AsValue().AsText());
                end;
            end else
                error('We got %1 problems', Response.HttpStatusCode());
        end else
            error('We got a problem');
    end;
}