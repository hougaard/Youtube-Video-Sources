tableextension 56300 "Validate ext" extends "Validate Table"
{
    fields
    {
        modify("Validate This")
        {
            trigger OnAfterValidate()
            begin
                Message('OnAfterValidate TableExt Trigger App3');
                Rec."Validate This" := 'OnAfterValidate TableExt Trigger App3';
            end;

            trigger OnBeforeValidate()
            begin
                Message('OnBeforeValidate TableExt Trigger App3');
                Rec."Validate This" := 'OnBeforeValidate TableExt Trigger App3';
            end;
        }
    }
}

pageextension 56300 "Validate Ext" extends "Validate Test"
{
    layout
    {
        modify("Validate This")
        {
            trigger OnBeforeValidate()
            begin
                Message('OnBeforeValidate PageExt Trigger App3');
                Rec."Validate This" := 'OnBeforeValidate PageExt Trigger App3';
            end;

            trigger OnAfterValidate()
            begin
                Message('OnAfterValidate PageExt Trigger App3');
                Rec."Validate This" := 'OnAfterValidate PageExt Trigger App3';
            end;
        }
    }
}