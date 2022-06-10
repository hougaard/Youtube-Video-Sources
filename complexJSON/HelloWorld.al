// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('%1', format(Job2Json('JOB00010')));
    end;

    procedure Job2Json(JobNo: Code[20]): JsonObject
    var
        Job: Record Job;
        JO: JsonObject;
    begin
        Job.Get(JobNo);
        JO.Add('JobNo', Job."No.");
        JO.Add('Tasks', Tasks2Json(Job."No."));
        exit(JO);
    end;

    procedure Tasks2Json(JobNo: Code[20]): JsonArray
    var
        Task: Record "Job Task";
        JA: JsonArray;
        JO: JsonObject;
        Tools: Codeunit "Json Tools";
    begin
        Task.Setrange("Job No.", JobNo);
        if Task.FindSet() then
            repeat
                JO := Tools.Rec2Json(Task);
                JO.Add('Budget', PlanningLines2Json(Task));
                JO.Add('Actual', LedgerEntries2Json(Task));
                JA.Add(JO);
            until Task.Next() = 0;
        exit(JA);
    end;

    procedure PlanningLines2Json(Task: Record "Job Task"): JsonArray
    var
        JA: JsonArray;
        PlanLine: Record "Job Planning Line";
        Tools: Codeunit "Json Tools";
    begin
        PlanLine.Setrange("Job No.", Task."Job No.");
        PlanLine.Setrange("Job Task No.", Task."Job Task No.");
        if PlanLine.FindSet() then
            repeat
                JA.Add(Tools.Rec2Json(PlanLine));
            until PlanLine.Next() = 0;
        exit(JA);
    end;

    procedure LedgerEntries2Json(Task: Record "Job Task"): JsonArray
    var
        JA: JsonArray;
        JLE: Record "Job Ledger Entry";
        Tools: Codeunit "Json Tools";
    begin
        JLE.Setrange("Job No.", Task."Job No.");
        JLE.Setrange("Job Task No.", Task."Job Task No.");
        if JLE.FindSet() then
            repeat
                JA.Add(Tools.Rec2Json(JLE));
            until JLE.Next() = 0;
        exit(JA);
    end;
}