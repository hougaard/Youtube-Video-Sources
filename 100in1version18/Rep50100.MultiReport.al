reportextension 50123 "Multi Report" extends "Standard Sales - Invoice"
{
    requestpage
    {
        layout
        {
            addfirst(content)
            {
                field(LayoutCtl; Layout.Description)
                {
                    Caption = 'Selected Layout';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    trigger OnInitReport() <-- This doesn''t work....
    var
        RLS: Record "Report Layout Selection";
    begin
        Layout.Setrange("Report ID", 50123);
        if page.RunModal(50123, Layout) = action::LookupOK then
            RLS.SetTempLayoutSelected(Layout.Code)
        else
            error('Please select a layout to continue!');
    end;

    var
        Layout: Record "Custom Report Layout";
}
