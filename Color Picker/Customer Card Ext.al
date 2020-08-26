pageextension 55300 "Customer Card Youtube" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            usercontrol(Color; ColorPicker)
            {
                ApplicationArea = All;
                trigger ColorPicked(ColorInfo: Text)
                begin
                    Message(ColorInfo);
                end;
            }
        }
    }
}