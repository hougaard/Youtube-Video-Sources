codeunit 50100 "OpenAI GPT Hacking"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Entity Text", OnRequestEntityContext, '', true, true)]
    local procedure MyProcedure(SourceScenario: Enum "Entity Text Scenario";
                                SourceSystemId: Guid;
                                SourceTableId: Integer;
                                var Facts: Dictionary of [Text, Text];
                                var Handled: Boolean;
                                var TextFormat: Enum "Entity Text Format";
                                var TextTone: Enum "Entity Text Tone")
    var
        Customer: Record Customer;
    begin
        case SourceTableId of
            Database::Customer:
                begin
                    TextFormat := TextFormat::Paragraph;
                    TextTone := TextTone::Inspiring;
                    Handled := true;
                    Customer.GetBySystemId(SourceSystemId);
                    Facts.Add('Customer Name', Customer.Name);
                    Facts.Add('Address', Customer.Address);
                    Facts.Add('City', Customer.City);
                    Customer.CalcFields(Balance);
                    Facts.Add('Current balance', format(Customer.Balance));
                end;
        end;
    end;
}