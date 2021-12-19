tableextension 56200 "Validate ext" extends "Validate Table"
{
    fields
    {
        modify("Validate This")
        {
            trigger OnAfterValidate()
            begin
                Message('OnAfterValidate TableExt Trigger');
                Rec."Validate This" := 'OnAfterValidate TableExt Trigger';
            end;

            trigger OnBeforeValidate()
            begin
                Message('OnBeforeValidate TableExt Trigger');
                Rec."Validate This" := 'OnBeforeValidate TableExt Trigger';
            end;
        }
    }
}

pageextension 56200 "Validate Ext" extends "Validate Test"
{
    layout
    {
        modify("Validate This")
        {
            trigger OnBeforeValidate()
            begin
                Message('OnBeforeValidate PageExt Trigger');
                Rec."Validate This" := 'OnBeforeValidate PageExt Trigger';
            end;

            trigger OnAfterValidate()
            begin
                Message('OnAfterValidate PageExt Trigger');
                Rec."Validate This" := 'OnAfterValidate PageExt Trigger';
            end;
        }
    }
}