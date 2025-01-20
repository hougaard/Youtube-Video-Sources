codeunit 50101 "Override SharePoint Character"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"SharePoint EFQ", OnBeforeSanitizeNameNoDot, '', true, true)]
    local procedure OnBeforeSanitizeNameNoDot(var Handled: Boolean; var Name: Text)
    var
        Setup: Record "SharePoint Setup EFQ";
        i: Integer;
    begin
        if Setup.Get() then
            case Setup.NameSanitizing of
                Setup.NameSanitizing::Strict:
                    begin
                        for i := 1 to strlen(Name) do
                            if name[i] in ['''', '!', '@', '$', '%', '^', '&', '*', '(', ')', '_', '+', '=', '-', '[', ']', '{', '}', '\', '|', '"', ';', ':', '<', '>', ',', '/', '?', '#'] then
                                name[i] := '_';
                        Handled := true;
                        exit;
                    end;
                Setup.NameSanitizing::Relaxed:
                    begin
                        for i := 1 to strlen(Name) do
                            if name[i] in ['"', '*', ':', '<', '>', '?', '/', '\', '|', '~', '#', '&', '{', '}', '+', ''''] then
                                name[i] := '_';
                        Handled := true;
                        exit;
                    end;
            end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"SharePoint EFQ", OnBeforeSanitizeName, '', true, true)]
    local procedure OnBeforeSanitizeName(var Handled: Boolean; var Name: Text)
    var
        Setup: Record "SharePoint Setup EFQ";
        i: Integer;
    begin
        if Setup.Get() then
            case Setup.NameSanitizing of
                Setup.NameSanitizing::Strict:
                    begin
                        for i := 1 to strlen(Name) do
                            if name[i] in ['''', '!', '@', '$', '%', '^', '&', '*', '(', ')', '_', '+', '=', '-', '[', ']', '{', '}', '\', '|', '"', ';', ':', '<', '>', ',', '.', '/', '?', '#'] then
                                name[i] := '_';
                        Handled := true;
                        exit;
                    end;
                Setup.NameSanitizing::Relaxed:
                    begin
                        for i := 1 to strlen(Name) do
                            if name[i] in ['"', '*', ':', '<', '>', '?', '/', '\', '|', '~', '#', '&', '{', '}', '+', ''''] then
                                name[i] := '_';
                        Handled := true;
                        exit;
                    end;
            end;
    end;
}