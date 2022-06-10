pageextension 50109 "Role1" extends "Business Manager Role Center"
{
    actions
    {
        addfirst(sections)
        {
            group(FantasGroup)
            {
                Caption = 'Fantastico';
                action(Fantas)
                {
                    Caption = 'Fantastico';
                    ApplicationArea = all;
                    RunObject = Page "Fantastico List";
                }
            }
        }
    }
}