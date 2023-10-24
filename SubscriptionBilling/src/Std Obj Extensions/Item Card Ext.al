pageextension 54101 "My Item Card" extends "Item Card"
{
    actions
    {
        addlast(navigation)
        {
            action(ContractPrice)
            {
                Caption = 'Contract Prices';
                ApplicationArea = all;
                RunObject = Page "Contract Price List";
                RunPageLink = "Item No." = field("No.");
            }
        }
    }
}