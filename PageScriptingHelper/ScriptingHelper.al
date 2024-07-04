namespace Hougaard.ScriptingHelper;
using Microsoft.Foundation.PaymentTerms;
using System.Tooling;
using System.Utilities;
using System.Reflection;

codeunit 73100 ScriptingHelper
{
    procedure GenerateScript(PageNo: Integer; Rec: Variant)
    var
        MetaData: Record "Page Metadata";
        PageFields: Record "Page Control Field";
        Ref: RecordRef;
        FR: FieldRef;
        Script: TextBuilder;
        RepeaterName: Text;
        InS: InStream;
        FileName: Text;
        Blob: Codeunit "Temp Blob";
        OutS: OutStream;
    begin
        MetaData.Get(PageNo);
        if MetaData.SourceTable = 0 then
            error('No source table found, cannot create script');
        Ref.GetTable(Rec);

        // Get repeater from Page Meta Fields
        RepeaterName := 'Control1';

        Script.Append(Header());
        if Ref.FindSet() then
            repeat
                Script.Append(NewRec(MetaData));
                PageFields.Setrange(PageNo, MetaData.ID);
                // PageFields.setrange(Editable,'true'); <---- MAJOR PROBLEM!
                // PageFields.Setrange(Visible,'true');
                PageFields.SetFilter(FieldNo, '1');
                if PageFields.FindSet() then // Loop primary key fields
                    repeat
                        FR := Ref.Field(PageFields.FieldNo);
                        Script.Append(FillOutField(MetaData, RepeaterName, PageFields, FR));
                    until PageFields.Next() = 0;
                PageFields.SetFilter(FieldNo, '2|5');
                if PageFields.FindSet() then // loop rest of fields
                    repeat
                        FR := Ref.Field(PageFields.FieldNo);
                        Script.Append(FillOutField(MetaData, RepeaterName, PageFields, FR));
                    until PageFields.Next() = 0;
            until Ref.Next() = 0;
        Script.Append(NewRec(MetaData));
        Blob.CreateOutStream(OutS);
        OutS.WriteText(Script.ToText());
        Blob.CreateInStream(InS);
        FileName := 'script.yml';
        DownloadFromStream(InS, '', '', '', FileName);
    end;

    local procedure NewRec(MetaData: Record "Page Metadata"): Text
    var
        out: TextBuilder;
    begin
        out.AppendLine('  - type: invoke');
        out.AppendLine('    target:');
        out.AppendLine('      - page: ' + MetaData.Name);
        out.AppendLine('        runtimeRef: xxx');
        out.AppendLine('      - action: Control_New');
        out.AppendLine('    invokeType: New');
        out.AppendLine('    description: Invoke New on <caption>New</caption>');
        exit(out.ToText());
    end;

    local procedure Header(): Text
    var
        out: TextBuilder;
    begin
        out.AppendLine('name: Recording');
        out.AppendLine('description: Test recording');
        out.AppendLine('start:');
        out.AppendLine('  profile: BUSINESS MANAGER');
        out.AppendLine('steps:');
        exit(out.ToText());
    end;

    local procedure FillOutField(MetaData: Record "Page Metadata"; RepeaterName: Text; PageFields: Record "Page Control Field"; var FR: FieldRef): Text
    var
        out: TextBuilder;
    begin
        out.AppendLine('  - type: focus');
        out.AppendLine('    target:');
        out.AppendLine('      - page: ' + MetaData.Name);
        out.AppendLine('        runtimeRef: xxx');
        out.AppendLine('      - repeater: ' + RepeaterName);
        out.AppendLine('      - field: ' + PageFields.ControlName);
        out.AppendLine('    description: Focus <caption>' + PageFields.ControlName + '</caption>');
        out.AppendLine('  - type: input');
        out.AppendLine('    target:');
        out.AppendLine('      - page: ' + MetaData.Name);
        out.AppendLine('        runtimeRef: xxx');
        out.AppendLine('      - repeater: ' + RepeaterName);
        out.AppendLine('      - field: ' + PageFields.ControlName);
        out.AppendLine('    value: ' + format(FR.Value, 0, 9));
        out.AppendLine('    description: Input <value>' + format(FR.Value, 0, 9) + '</value> into <caption>' + PageFields.ControlName + '</caption>');
        exit(out.ToText());
    end;
}

pageextension 73100 PaymentTerms extends "Payment Terms"
{
    actions
    {
        addfirst(processing)
        {
            action(Generate)
            {
                Caption = 'Generate Script';
                ApplicationArea = all;
                trigger OnAction()
                var
                    ScriptingHelper: Codeunit ScriptingHelper;
                begin
                    ScriptingHelper.GenerateScript(Page::"Payment Terms", Rec);
                end;
            }
        }
    }
}