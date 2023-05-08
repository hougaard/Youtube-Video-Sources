tableextension 50100 "My Job" extends Job
{
    fields
    {
        field(50100; MyProgress; Integer)
        {
            Caption = 'Progress';
        }
    }
}

pageextension 50100 "My Job" extends "Job Card"
{
    layout
    {
        addlast(General)
        {
            field(MyProgress; Rec.MyProgress)
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    CurrPage.bar.SetProgress(Rec.MyProgress);
                end;
            }
            usercontrol(bar; MyProgressBar)
            {
                ApplicationArea = All;
                trigger IAmReady()
                begin
                    CurrPage.bar.SetProgress(Rec.MyProgress);
                end;
            }
        }
    }
}
