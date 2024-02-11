page 50100 "Gantt Test"
{
    PageType = Card;
    Caption = 'Project';
    DataCaptionExpression = Rec.Description;
    UsageCategory = Administration;
    ApplicationArea = all;
    SourceTable = Job; // AKA Project!!!!

    layout
    {
        area(Content)
        {
            usercontrol(Gantt; gantt)
            {
                ApplicationArea = all;
                trigger ControlReady()
                begin
                    CurrPage.Gantt.Load(JobAsJson(Rec));
                end;
            }
        }
    }
    procedure JobAsJson(JobRec: Record Job): JsonObject
    var
        JobTask: Record "Job Task";
        out: JsonObject;
        project: JsonObject;
        task: JsonObject;
        tasks: JsonArray;
        links: JsonArray;
        null: JsonValue;
        id: Integer;
    begin
        //   data: [
        //     {id: 1, text: "Project #1", start_date: null, duration: null, parent:0, progress: 0, open: true},
        //     {id: 2, text: "Task #1", start_date: "2019-08-01 00:00", duration:5, parent:1, progress: 1},
        //     {id: 3, text: "Task #2", start_date: "2019-08-06 00:00", duration:2, parent:1, progress: 0.5},
        //     {id: 4, text: "Task #3", start_date: null, duration: null, parent:1, progress: 0.8, open: true},
        //     {id: 5, text: "Task #3.1", start_date: "2019-08-09 00:00", duration:2, parent:4, progress: 0.2},
        //     {id: 6, text: "Task #3.2", start_date: "2019-08-11 00:00", duration:1, parent:4, progress: 0}
        //   ],
        //   links:[
        //     {id:1, source:2, target:3, type:"0"},
        //     {id:2, source:3, target:4, type:"0"},
        //     {id:3, source:5, target:6, type:"0"}
        //   ]
        null.SetValueToNull();
        id := 1;
        project.Add('id', id);
        project.Add('text', JobRec.Description);
        project.Add('start_date', null);
        project.Add('duration', null);
        project.add('parent', 0);
        project.Add('progress', 0);
        project.add('open', true);
        tasks.Add(project);

        JobTask.Setrange("Job No.", JobRec."No.");
        if JobTask.FindSet() then
            repeat
                clear(task);
                id += 1;
                case Jobtask."Job Task Type" of
                    Jobtask."Job Task Type"::"Begin-Total":
                        begin
                            task.Add('id', id);
                            task.add('text', JobTask.Description);
                            task.add('start_date', null);
                            task.Add('duration', null);
                            if JobTask.Indentation = 0 then
                                task.Add('parent', 1)
                            else
                                task.Add('parent', id - 1); // This won't work, do better Erik!!!
                            task.add('progress', 0);
                            tasks.add(Task);
                        end;
                    Jobtask."Job Task Type"::Posting:
                        begin
                            task.Add('id', id);
                            task.add('text', JobTask.Description);
                            task.add('start_date', JobTask."Start Date");
                            task.Add('duration', JobTask."End Date" - JobTask."Start Date" + 1);
                            if JobTask.Indentation = 0 then
                                task.Add('parent', 1)
                            else
                                task.Add('parent', id - 1); // This won't work, do better Erik!!!
                            task.add('progress', 0);
                            tasks.add(Task);
                        end;
                end;
            until JobTask.Next() = 0;

        out.Add('data', tasks);
        out.add('links', links);
        exit(out);
    end;

}