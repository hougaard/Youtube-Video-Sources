pageextension 50500 "Our own headline" extends "Headline RC Business Manager"
{
    layout
    {
        addbefore(Control1)
        {
            field(HeadlineTxt; HeadlineTxt)
            {
                ApplicationArea = All;
                trigger OnDrillDown()
                begin
                    Hyperlink('https://www.hougaard.com');
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        HeadlineTxt := 'Hello <emphasize>User!</emphasize> from youtube';
    end;

    var
        HeadlineTxt: Text;
}