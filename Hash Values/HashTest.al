page 50100 "Hash Test"
{
    PageType = Card;
    layout
    {
        area(Content)
        {
            field(Input; Input)
            {
                CAption = 'Input';
                ApplicationArea = all;
                MultiLine = true;
            }
            field(Hash; Hash)
            {
                Caption = 'Hash';
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Calc)
            {
                Caption = 'Calculate';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = True;
                trigger OnAction()
                var
                    Crypt: Codeunit "Cryptography Management";
                begin
                    Hash := Crypt.GenerateHashAsBase64String(Input, 2);
                end;
            }
            action(Customer)
            {
                Caption = 'Calculate Customer';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = True;
                trigger OnAction()
                var
                    Crypt: Codeunit "Cryptography Management";
                    Customer: Record Customer;
                begin
                    Customer.FindFirst();
                    Hash := Crypt.GenerateHash(format(Customer), 2);
                end;
            }
        }
    }
    var
        Input: Text;
        Hash: Text;
}