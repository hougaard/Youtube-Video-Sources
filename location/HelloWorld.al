// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50140 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        GeoLocation: Codeunit Geolocation;
        latitude, longitude : Decimal;
    begin
        GeoLocation.SetHighAccuracy(true);
        if GeoLocation.RequestGeolocation() then
            if GeoLocation.HasGeolocation() then begin
                GeoLocation.GetGeolocation(latitude, longitude);
                message('I see you at %1,%2', latitude, longitude);
            end;
    end;
}