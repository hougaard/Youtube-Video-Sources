page 50100 "Demo Page"
{
    Caption = 'Demo Page';
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(Content)
        {
            label(Lbl)
            {
                Caption = 'Just to show we''re here!';
                ApplicationArea = All;
            }
            usercontrol(url; urlhack)
            {
                ApplicationArea = all;
                trigger GetDemo(Demo: Text)
                begin
                    message('Value from URL = %1', Demo);
                end;
            }
        }
    }
}