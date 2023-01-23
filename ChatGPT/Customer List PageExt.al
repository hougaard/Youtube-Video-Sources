pageextension 50101 "Customers List Action" extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action("View Card")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Page.RunModal(Page::"Customers List");
                end;
            }
        }
    }
}
