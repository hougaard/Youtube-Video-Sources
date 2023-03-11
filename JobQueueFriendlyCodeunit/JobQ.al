codeunit 50133 "My JobQueue Job"
{
    TableNo = "Job Queue Entry";
    trigger OnRun()
    begin
        if Rec."Job Queue Category Code" = 'DOTHIS' then
            if Rec."Object ID to Run" = 0 then
                // Running outside Jobqueue
                else
            // Running in Jobqueue
    end;
}