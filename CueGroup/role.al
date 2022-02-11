pageextension 66100 "My role" extends "Business Manager Role Center"
{
    layout
    {
        addfirst(rolecenter)
        {
            part(My; "Cue Test")
            {
                ApplicationArea = all;
            }
        }
    }
}