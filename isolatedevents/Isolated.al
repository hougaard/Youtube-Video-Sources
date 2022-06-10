codeunit 50100 "Test"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Company Triggers", 'OnCompanyOpenCompleted', '', true, true)]
    local procedure MyProcedure()
    begin
        if random(10) < 3 then
            error('Hello Youtube! 2');
    end;
}