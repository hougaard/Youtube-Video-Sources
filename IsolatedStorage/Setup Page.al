page 59300 "ISO Setup"
{

    Caption = 'ISO Setup';
    PageType = Card;
    SourceTable = "ISO Setup";

    layout
    {
        area(content)
        {
            group("Login Information")
            {
                field("User Name"; "User Name")
                {
                    ApplicationArea = All;
                }
                field(Password; pw)
                {
                    ApplicationArea = All;
                    Editable = PageEdit;
                    ExtendedDatatype = Masked;
                    trigger OnValidate()
                    begin
                        Password(pw);
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(WhatPassword)
            {
                Caption = 'What is my password';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message(Password());
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        PageEdit := CurrPage.Editable;
        pw := Password();
    end;

    trigger OnOpenPage()
    begin
        PageEdit := CurrPage.Editable;
        if IsEmpty() then
            Insert();
    end;

    var
        [InDataSet]
        pw: Text;
        PageEdit: Boolean;
}
