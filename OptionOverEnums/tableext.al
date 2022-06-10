enumextension 50135 "SL Type" extends "Sales Line Type"
{
    value(50135; Job)
    {
        Caption = 'Job';
    }
}

codeunit 50135 "Our Subscribers"
{
    [EventSubscriber(ObjectType::Table, Database::"Option Lookup Buffer", 'OnBeforeIncludeOption', '', true, true)]
    local procedure OnBeforeIncludeOption(LookupType: Option; Option: Integer; OptionLookupBuffer: Record "Option Lookup Buffer"; RecRef: RecordRef; var Handled: Boolean; var Result: Boolean)
    begin
        if (LookupType = 0) and (Option = 50135) and (RecRef.Number = 37) then begin
            Handled := true;
            Result := true;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateNo', '', true, true)]
    local procedure SalesLine_OnBeforeValidateNo(CurrentFieldNo: Integer; var IsHandled: Boolean; var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    begin
        If SalesLine.Type = SalesLine.Type::Job then
            IsHandled := true;
    end;
}

tableextension 50135 MySales extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            TableRelation = IF (Type = const(Job)) Job."No.";
            trigger OnAfterValidate()
            var
                job: Record Job;
            begin
                if Type = Type::Job then begin
                    job.get("No.");
                    Rec.Validate(Description, Job.Description);
                end;
            end;
        }
    }
}