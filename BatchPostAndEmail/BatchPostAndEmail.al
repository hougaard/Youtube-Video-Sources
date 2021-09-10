reportextension 50100 "Batch Post" extends "Batch Post Sales Orders"
{
    dataset
    {
        modify("Sales Header")
        {
            trigger OnAfterAfterGetRecord()
            begin

            end;
        }
    }
    requestpage
    {
        layout
        {
            addafter(PrintDoc)
            {
                field(eMail; eMail)
                {
                    ApplicationArea = all;
                    Caption = 'Email invoices';
                }
            }
        }
    }
    var
        eMail: Boolean;
}