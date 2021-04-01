page 50148 "Lookup tester"
{

    Caption = 'Lookup tester';
    PageType = Card;
    SourceTable = "Lookup tester";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Item: Record Item;
                    begin
                        if Page.RunModal(PAGE::"Item List", Item) = Action::LookupOK then begin
                            Text := Item."No.";
                            exit(true);
                        end;
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
    end;
}
