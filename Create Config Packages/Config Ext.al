pageextension 50134 ConfigAl extends "Config. Packages"
{
    actions
    {
        addfirst(processing)
        {
            action(Add)
            {
                Caption = 'Add my Config Package';
                ApplicationArea = all;
                trigger OnAction()
                var
                    Generator: Codeunit "AL Config Generator";
                begin
                    Generator.CreateConfigPackage();
                end;

            }
        }
    }
}