table 57100 "POS Setup"
{
    Caption = 'POS Setup';
    fields
    {
        field(1; POSKEY; Code[10])
        {
            DataClassification = SystemMetadata;
        }
        field(13; "Cash Customer"; Code[18])
        {
            Caption = 'Cash Customer No.';
            TableRelation = Customer."No.";
        }
    }
}
page 57104 "POS Setup"
{
    Caption = 'POS Setup';
    SourceTable = "POS Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(Content)
        {
            field("Cash Customer"; "Cash Customer")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if isempty() then
            insert();
    end;
}