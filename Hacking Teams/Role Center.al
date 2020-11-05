pageextension 50123 "Teams Role Center" extends "Business Manager Role Center"
{
    layout
    {
        addlast(rolecenter)
        {
            part(teams; "Teams Part")
            {
                ApplicationArea = All;
            }
        }
    }
}