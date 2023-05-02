page 50100 "My Customer THing"
{
    Caption = 'My Customer THing';
    PageType = Card;
    SourceTable = Customer;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Allow Line Disc."; Rec."Allow Line Disc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if a sales line discount is calculated when a special sales price is offered according to setup in the Sales Prices window.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';
                }
                field("Bank Communication"; Rec."Bank Communication")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the language of the check image.';
                }
                field("Bill-To No. of Credit Memos"; Rec."Bill-To No. of Credit Memos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many credit memos have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-To No. of Pstd. Cr. Memos"; Rec."Bill-To No. of Pstd. Cr. Memos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many posted credit memos have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a different customer who will be invoiced for products that you sell to the customer in the Name field on the customer card.';
                }
            }
        }
    }
}
