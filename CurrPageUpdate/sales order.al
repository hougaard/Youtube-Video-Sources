pageextension 50100 "My Sales Order" extends "Sales Order"
{
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                Caption = 'Test';
                ApplicationArea = all;
                trigger OnAction()
                var
                    SL: Record "Sales Line";
                begin
                    SL.Setrange("Document No.", Rec."No.");
                    SL.Setrange("Document Type", Rec."Document Type");
                    if SL.FindSet(true) then
                        repeat
                            SL.Validate(Quantity, SL.Quantity * 2);
                            SL.Modify();
                        until SL.Next() = 0;
                end;
            }
        }
    }
}