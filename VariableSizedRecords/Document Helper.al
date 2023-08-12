codeunit 53100 "Document Helper"
{
    SingleInstance = true;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Caption Class", OnResolveCaptionClass, '', true, true)]
    local procedure MyCaptionHandler(CaptionArea: Text; CaptionExpr: Text; Language: Integer; var Caption: Text; var Resolved: Boolean)
    begin
        if CaptionArea = 'DOC' then begin
            Caption := CaptionExpr;
            Resolved := true;
        end;
    end;

    procedure GetCurrentSortField(): Text
    begin
        exit(CurrentSortField);
    end;

    procedure SetCurrentSortField(_f: Text)
    begin
        CurrentSortField := _f;
    end;

    var
        CurrentSortField: Text;
}