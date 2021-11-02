codeunit 50144 "subs"
{
    SingleInstance = true;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Trouble Codeunit", 'OnTheSecondEvent', '', true, true)]
    local procedure OnTheSecondEventSubscriber(Time: Time)
    begin
        message('%1', CreateDateTime(SavedDate, Time));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Trouble Codeunit", 'OnTheFirstEvent', '', true, true)]
    local procedure OnTheFirstEvent(Date: Date; Number: Integer; NumberTxt: Text)
    begin
        SavedDate := Date;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Trouble Codeunit", 'OnInit', '', true, true)]
    local procedure OnInit()
    begin
        SavedDate := 0D;
    end;

    var
        SavedDate: Date;
}