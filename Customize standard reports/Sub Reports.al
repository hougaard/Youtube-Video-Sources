codeunit 54100 "Sub Reports YT"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', true, true)]
    local procedure MyProcedure(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Customer - Top 10 List" then
            NewReportId := Report::"Customer - Top 10 List (YT)";
    end;
}