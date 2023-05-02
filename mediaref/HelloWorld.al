// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(UploadMedia)
            {
                Caption = 'Upload Media';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                ToolTip = 'Upload Media';
                trigger OnAction();
                var
                    Vendor: Record Vendor temporary;
                    InS: InStream;
                    FileName: Text;
                    Ref: RecordRef;
                    FR: FieldRef;
                begin
                    if UploadIntoStream('Get Image', '', '', FileName, InS) then begin
                        Ref.GetTable(Rec);
                        FR := Ref.Field(Rec.FieldNo(Image));

                        Vendor.init();
                        Vendor.Image.ImportStream(InS, '');
                        Vendor.Insert();

                        FR.Value := Vendor.Image;
                        Ref.Modify(true);
                    end;
                end;
            }
        }
    }
}