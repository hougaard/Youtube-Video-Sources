codeunit 56100 "Validate Events"
{
    [EventSubscriber(ObjectType::Table, Database::"Validate Table", 'OnBeforeValidateEvent', 'Validate This', true, true)]
    local procedure MyProcedure(var Rec: Record "Validate Table"; var xRec: Record "Validate Table"; CurrFieldNo: Integer)
    begin
        Message('OnBeforeValidateEvent Table Trigger');
        Rec."Validate This" := 'OnBeforeValidateEvent Table Trigger';
    end;

    [EventSubscriber(ObjectType::Table, Database::"Validate Table", 'OnAfterValidateEvent', 'Validate This', true, true)]
    local procedure MyProcedure2(var Rec: Record "Validate Table"; var xRec: Record "Validate Table"; CurrFieldNo: Integer)
    begin
        Message('OnAfterValidateEvent Table Trigger');
        Rec."Validate This" := 'OnAfterValidateEvent Table Trigger';
    end;

    [EventSubscriber(ObjectType::Page, Page::"Validate Test", 'OnBeforeValidateEvent', 'Validate This', true, true)]
    local procedure MyProcedure3(var Rec: Record "Validate Table"; var xRec: Record "Validate Table")
    begin
        Message('OnBeforeValidateEvent Page Trigger');
        Rec."Validate This" := 'OnBeforeValidateEvent Page Trigger';
    end;

    [EventSubscriber(ObjectType::Page, Page::"Validate Test", 'OnAfterValidateEvent', 'Validate This', true, true)]
    local procedure MyProcedure4(var Rec: Record "Validate Table"; var xRec: Record "Validate Table")
    begin
        Message('OnAfterValidateEvent Page Trigger');
        Rec."Validate This" := 'OnAfterValidateEvent Page Trigger';
    end;
}