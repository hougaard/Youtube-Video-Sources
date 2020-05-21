tableextension 72101 "Sales Line Focus" extends "Sales Line"
{
    fields
    {
        modify(Quantity)
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
                Setup: Record "Software Inc Setup";
                ThisIsASubsciptionItemLbl: Label 'This is a subscription item, please use the subscription field.';
            begin
                if Quantity <> 0 then
                    if setup.get() then
                        if Type = type::Item then
                            if Item.get("No.") then
                                if item."Subscription Item" then
                                    error(ThisIsASubsciptionItemLbl);
            end;
        }
        field(72100; "User Count"; Integer)
        {
            Caption = 'User Count';
            MinValue = 0;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Mgt: Codeunit "Subscription Mgt Focus";
            begin
                Mgt.CalcQty(Rec);
            end;
        }
        field(72101; "Start Date"; Date)
        {
            Caption = 'Subscription Start';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Mgt: Codeunit "Subscription Mgt Focus";
                YouCannotEndSubsriptionBeforeItStartsLbl: Label 'You cannot end a subscription before it starts!';
            begin
                if ("Start Date" <> 0D) and ("End Date" <> 0D) then begin
                    if "End Date" < "Start Date" then
                        error(YouCannotEndSubsriptionBeforeItStartsLbl);
                    Mgt.CalcQty(Rec);
                end;
            end;
        }
        field(72102; "End Date"; Date)
        {
            Caption = 'Subscription End';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Mgt: Codeunit "Subscription Mgt Focus";
                YouCannotEndSubsriptionBeforeItStartsLbl: Label 'You cannot end a subscription before it starts!';
            begin
                if ("Start Date" <> 0D) and ("End Date" <> 0D) then begin
                    if "End Date" < "Start Date" then
                        error(YouCannotEndSubsriptionBeforeItStartsLbl);
                    Mgt.CalcQty(Rec);
                end;
            end;
        }
    }
}