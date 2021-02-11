pageextension 50000 "My Customer List" extends "Customer List"
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
