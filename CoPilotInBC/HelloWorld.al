// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    layout
    {
        addfirst(factboxes)
        {
            part(EntityTextFactBox; "Entity Text Factbox Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Marketing Text';
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.EntityTextFactBox.Page.SetContext(Database::Customer,
                                                   Rec.SystemId,
                                                   Enum::"Entity Text Scenario"::"Marketing Text",
                                                   MarketingTextPlaceholderTxt);
    end;

    var
        MarketingTextPlaceholderTxt: Label '[Create draft]() based on this csutomer''s attributes (preview). Review to make sure it''s accurate.', Comment = 'Text contained in [here]() will be clickable to invoke the generate action';

}