codeunit 50114 "Custom transformation"
{
    [EventSubscriber(ObjectType::Table, Database::"Transformation Rule", 'OnTransformation', '', false, false)]
    local procedure OnTransformation(TransformationCode: Code[20]; InputText: Text; var OutputText: Text);
    var
        i: Integer;
    begin
        case TransformationCode of
            'AAA':
                begin
                    OutputText := '';
                    for i := 1 to strlen(InputText) do
                        OutputText += InputText[strlen(InputText) - i + 1];
                end;
        end;
    end;

}