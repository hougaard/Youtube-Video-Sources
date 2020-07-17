page 50100 "USPS Setup Hgd"
{

    Caption = 'USPS Setup';
    PageType = Card;
    SourceTable = "USPS Setup Hgd";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(URL; URL)
                {
                    ToolTip = 'URL for USPS Web service (usually https://secure.shippingapis.com/ShippingAPI.dll)';
                    ApplicationArea = All;
                }
                field(UserID; UserID)
                {
                    ToolTip = 'UserID from USPS';
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if IsEmpty() then begin
            URL := 'https://secure.shippingapis.com/ShippingAPI.dll';
            Insert(true);
        end;
    end;
}
