pageextension 50001 "My Vendor List" extends "Vendor List"
{
    layout
    {
        addafter(Name)
        {
            field("Name 2 Ctl"; Rec."Name 2")
            {
                ApplicationArea = All;
            }
        }
    }
}
