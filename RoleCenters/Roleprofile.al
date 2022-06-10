profile youtube
{
    Caption = 'YouTube';
    RoleCenter = "My RoleCenter";
    Promoted = true;
    Enabled = true;
}

page 50110 "My RoleCenter"
{
    PageType = RoleCenter;
    actions
    {
        area(Embedding)
        {
            action(Fantas)
            {
                Caption = 'Fantastico';
                ApplicationArea = all;
                RunObject = Page "Fantastico List";
            }
        }
    }
}