// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 51200 Items extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(Woo)
            {
                Caption = 'Woo';
                ApplicationArea = all;
                trigger OnAction()
                var
                    Woo: Codeunit "WooCommerce Connector";
                begin
                    Woo.GetProducts();
                end;
            }
        }
    }
}