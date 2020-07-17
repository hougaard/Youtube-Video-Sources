pageextension 50400 "Hack" extends "Customer List"
{
    layout
    {
        addlast(content)
        {
            usercontrol(InjectorCtl; Injector)
            {
                ApplicationArea = all;
                trigger ControlReady()
                begin
                    CurrPage.InjectorCtl.GetInfo();
                end;

                trigger ReturnInfo(txt: Text)
                begin
                    Message(txt);
                end;
            }
        }
    }
}