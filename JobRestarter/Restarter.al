codeunit 54600 "Job Queue Restarter"
{
    TableNo = "Job Queue Entry";
    trigger OnRun()
    var
        JQ: Record "Job Queue Entry";
    begin
        JQ.Setrange(Status, JQ.Status::Error);
        JQ.SetFilter("Object ID to Run", Rec."Parameter String");
        if JQ.FindSet() then
            repeat
                JQ.Restart();
            until JQ.Next() = 0;
    end;
}