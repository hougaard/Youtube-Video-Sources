page 50142 "Drop Table"
{

    ApplicationArea = All;
    Caption = 'Drop Table';
    PageType = List;
    SourceTable = "Drop table";
    SourceTableView = sorting("Sorting Index");
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(pkey; pkey)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Sorting Index"; "Sorting Index")
                {
                    ApplicationArea = All;
                }
            }
            usercontrol(HTML; DragDrop)
            {
                ApplicationArea = all;
                trigger ControlReady()
                begin
                    CurrPage.HTML.DragDropEnable('pkey');
                end;

                trigger DropEvent(DragID: Text; DropID: Text)
                var
                    drag: Record "Drop table";
                    drop: Record "Drop table";
                begin
                    drag.get(dragID);
                    drop.get(DropID);
                    //message('%1 dropped on %2', drag.Description, drop.Description);
                    if drag."Sorting Index" < drop."Sorting Index" then
                        drag."Sorting Index" := drop."Sorting Index" + 1
                    else
                        drag."Sorting Index" := drop."Sorting Index" - 1;
                    drag.Modify();
                    CurrPage.Update(false);
                end;
            }
        }
    }

}
