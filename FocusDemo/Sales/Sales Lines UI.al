pageextension 72102 "Sales Lines Focus" extends "Sales Order Subform"
{
    layout
    {
        addbefore(Quantity)
        {

            field("User Count"; "User Count")
            {
                ApplicationArea = All;
            }
            field("Start Date"; "Start Date")
            {
                ApplicationArea = All;
            }
            field("End Date"; "End Date")
            {
                ApplicationArea = All;
            }
        }
    }
}