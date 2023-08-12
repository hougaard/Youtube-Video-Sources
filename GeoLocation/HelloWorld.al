// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        GeoLocation: Codeunit Geolocation;
        Lat, Long : Decimal;
    begin
        GeoLocation.SetHighAccuracy(true);
        if GeoLocation.RequestGeolocation() then begin
            GeoLocation.GetGeolocation(Lat, Long);
            Message('%1 %2', Lat, long);
        end;
    end;
}