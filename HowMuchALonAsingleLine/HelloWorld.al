pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        Customer: Record Customer;
        Vendor: Record Vendor;
    begin
        if true then begin
            message('yes!');
            message('no!');
        end;

        if true and
           false and
           true and
           (false and false) or
           true and
           true then
            Message('!!');

        if true then
            exit;
        if false then
            exit;

    end;
}