// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.RuntimeDependencies;

using Microsoft.Sales.Customer;
using System.Utilities;
using Microsoft.Inventory.Reports;

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Upload)
            {
                Caption = 'Upload to SharePoint';
                ApplicationArea = all;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    ParmVar: Variant;
                    ParmRef: RecordRef;
                    ParmField: FieldRef;
                begin
                    TempBlob.CreateOutStream(OutS);
                    Report.SaveAs(Report::"Item List", '', ReportFormat::Pdf, OutS);

                    ParmRef.Open(70319494);
                    // 1 Guid
                    ParmField := ParmRef.Field(1);
                    ParmField.Value := CreateGuid();

                    ParmRef.Insert();

                    // 2 Blob
                    ParmField := ParmRef.Field(2);
                    TempBlob.ToFieldRef(ParmField);
                    // 3 Filename
                    ParmField := ParmRef.Field(3);
                    ParmField.Value := 'youtube-item-list.pdf';
                    // 4 RecordID
                    ParmField := ParmRef.Field(5);
                    ParmField.Value := Rec.RecordId;
                    // 5 Table
                    ParmField := ParmRef.Field(4);
                    ParmField.Value := DATABASE::Customer;
                    // 6 Overwrite?
                    ParmField := ParmRef.Field(6);
                    ParmField.Value := true;

                    ParmRef.Modify();

                    ParmVar := ParmRef;
                    Codeunit.Run(70319499, ParmVar);
                end;
            }
        }
    }
}