tableextension 56100 "Our customer fields" extends Customer
{
    fields
    {
        field(56100; "A new hope"; Text[2048])
        {
            Caption = 'A really new hope';
            DataClassification = CustomerContent;
        }
        modify(Address)
        {
            Caption = 'Home Address';
            trigger OnAfterValidate()
            begin
                "A new hope" := Address + ' ' + Address;
            end;
        }
    }
}
pageextension 56100 "My Customer Card" extends "Customer Card"
{
    layout
    {
        addafter(Address)
        {
            field("A new hope"; Rec."A new hope")
            {
                ApplicationArea = all;
            }
        }
    }
}