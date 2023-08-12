tableextension 50100 MyCustomer extends Customer
{
    fields
    {
        field(50100; CreditCardNo; Text[50])
        {
            Caption = 'Credit Card No.';
        }
    }
}
pageextension 50100 MyCustomer extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field(CreditCardCtl; MaskedCreditCard)
            {
                Caption = 'Credit Card No.';
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    if strlen(MaskedCreditCard) < 5 then
                        error('Not a valid credit card');
                    Rec.CreditCardNo := MaskedCreditCard;
                    MaskedCreditCard := PerformMasking();
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        MaskedCreditCard := PerformMasking();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        MaskedCreditCard := PerformMasking()
    end;

    procedure PerformMasking(): Text
    begin
        if Strlen(Rec.CreditCardNo) > 4 then
            exit('*************' + Rec.CreditCardNo.Substring(strlen(Rec.CreditCardNo) - 3))
        else
            exit('');
    end;

    var
        MaskedCreditCard: Text[50];
}