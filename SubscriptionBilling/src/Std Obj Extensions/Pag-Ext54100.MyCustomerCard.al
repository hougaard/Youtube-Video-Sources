pageextension 54100 "My Customer Card" extends "Customer Card"
{
    actions
    {
        addlast(navigation)
        {
            action(ContractList)
            {
                Caption = 'Contracts';
                ApplicationArea = all;
                RunObject = page "Contract List";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }
}
