codeunit 50112 "Trouble Codeunit"
{
    procedure GreatestCodeOfAllTime()
    begin
        ///
        OnInit();
        ///
        ///
        OnTheFirstEvent('123', 123, calcdate('-34D', Today()));
        ///
        ////
        /// 
        /// 
        ///
        OnTheSecondEvent(Time());
        ////
        /// 
    end;

    [IntegrationEvent(false, false)]
    local procedure OnTheFirstEvent(NumberTxt: Text; Number: Integer; Date: Date)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnTheSecondEvent(Time: Time)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInit()
    begin
    end;
}