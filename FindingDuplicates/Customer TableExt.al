tableextension 50103 "My Customer" extends Customer
{
    fields
    {
        modify(Name)
        {
            trigger OnBeforeValidate()
            var
                CustomerDup: Record Customer;
            begin
                if GuiAllowed() then begin
                    CustomerDup.Setfilter(Name, '@*' + Rec.Name + '*');
                    CustomerDup.Setfilter(Address, '@*' + Rec.Address + '*');
                    CustomerDup.Setfilter("No.", '<>%1', Rec."No.");
                    CustomerDup.SetCurrentKey(Name);
                    if CustomerDup.FindFirst() then begin
                        message('A customer with the name %1 (No = %2) already exists, consider deleting this one!', CustomerDup.Name, CustomerDup."No.")
                    end;
                end;
            end;
        }
        modify(Address)
        {
            trigger OnBeforeValidate()
            var
                CustomerDup: Record Customer;
            begin
                if GuiAllowed() then begin
                    CustomerDup.Setfilter(Name, '@*' + Rec.Name + '*');
                    CustomerDup.Setfilter(Address, '@*' + Rec.Address + '*');
                    CustomerDup.Setfilter("No.", '<>%1', Rec."No.");
                    CustomerDup.SetCurrentKey(Name);
                    if CustomerDup.FindFirst() then begin
                        message('A customer with the name %1 (No = %2) already exists, consider deleting this one!', CustomerDup.Name, CustomerDup."No.")
                    end;
                end;
            end;
        }
    }
}