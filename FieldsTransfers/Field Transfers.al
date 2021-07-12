codeunit 50100 "Field Tranfers"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterCopySellToCustomerAddressFieldsFromCustomer', '', true, true)]
    local procedure MyProcedure(var SalesHeader: Record "Sales Header"; SellToCustomer: Record Customer)
    begin
        SalesHeader."Sell-to E-Mail" := SellToCustomer."E-Mail";
    end;
}

tableextension 50102 SalesShip extends "Sales Shipment Header"
{
    fields
    {
        field(50100; MyField; Integer)
        {

        }
    }
}
tableextension 50100 "Sales Header" extends "Sales Header"
{
    fields
    {
        field(50100; MyField; Integer)
        {

        }
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                Customer: Record Customer;
            begin
                Customer.Get("Sell-to Customer No.");
                Rec."Sell-to E-Mail" := Customer."E-Mail";
            end;
        }
    }
}
tableextension 50101 "Sales Line" extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
                Res: Record Resource;

            begin
                case Type of
                    Type::Resource:
                        begin
                            Res.Get("No.");
                            Rec.Field := Res.Field;
                        end;
                    Type::Item:
                        begin
                            Item.get("No.");
                            Rec.Field := Item.Field;
                        end;
                end;
            end;
        }
    }
}