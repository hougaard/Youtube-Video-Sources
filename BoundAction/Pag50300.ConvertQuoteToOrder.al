page 50300 ConvertQuoteToOrder
{
    APIGroup = 'youtube';
    APIPublisher = 'hougaard';
    APIVersion = 'v2.0';
    Caption = 'convertQuoteToOrder';
    DelayedInsert = true;
    EntityName = 'quote';
    EntitySetName = 'quotes';
    PageType = API;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const(Quote));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
            }
        }
    }
    [ServiceEnabled]
    procedure ConvertToOrder(var ActionContext: WebServiceActionContext)
    var
        SalesQuoteToOrder: Codeunit "Sales-Quote to Order";
    begin
        SalesQuoteToOrder.Run(Rec);

        ActionContext.SetObjectType(ObjectType::Page);
        ActionContext.SetObjectId(Page::ConvertQuoteToOrder);
        ActionContext.AddEntityKey(Rec.FieldNo("No."), Rec."No.");
        ActionContext.SetResultCode(WebServiceActionResultCode::Created);
    end;

    [ServiceEnabled]
    procedure ConvertToInvoice(var ActionContext: WebServiceActionContext)
    var
        SalesQuoteToOrder: Codeunit "Sales-Quote to Invoice";
    begin
        SalesQuoteToOrder.Run(Rec);

        ActionContext.SetObjectType(ObjectType::Page);
        ActionContext.SetObjectId(Page::ConvertQuoteToOrder);
        ActionContext.AddEntityKey(Rec.FieldNo("No."), Rec."No.");
        ActionContext.SetResultCode(WebServiceActionResultCode::Created);
    end;x`x`
}
