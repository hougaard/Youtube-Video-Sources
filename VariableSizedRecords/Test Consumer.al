codeunit 53101 "Document Consumer"
{
    procedure ImportVendors()
    var
        V: Record Vendor;
        Doc: Record "Document Hgd";
    begin
        Doc.Setrange(EntityKey, 'vendor');
        if doc.findset() then
            repeat
                v.INit();
                v."No." := Doc.FieldTxt('No.');
                V.Name := Doc.FieldTxt('Name');
                V.Insert();
            until Doc.Next() = 0;
    end;
}