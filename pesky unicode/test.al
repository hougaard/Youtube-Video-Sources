tableextension 56700 "Customer" extends Customer
{
    fields
    {
        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                i: Integer;
                charNo: Integer;
            begin
                for i := 1 to strlen(Rec."No.") do begin
                    charNo := Rec."No."[i];
                    if not (Rec."No."[i] in ['A' .. 'Z', 'a' .. 'z', '0' .. '9']) then
                        error('Only A-Z 0-9 allowed');
                end;
            end;
        }
    }
}

pageextension 56700 "Customer List" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(inspect)
            {
                caption = 'Inspect No.';
                ApplicationArea = all;
                trigger OnAction()
                var
                    i: Integer;
                    charNo: Integer;
                    str: Text;
                begin
                    for i := 1 to strlen(Rec."No.") do begin
                        charNo := Rec."No."[i];
                        str += format(charNo) + ' - ';
                    end;
                    message(str);
                end;
            }
        }
    }
}