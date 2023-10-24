table 54101 "Contract Line"
{
    Caption = 'Contract Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
        }
        field(100; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No." where(Type = const(Service));
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field("Item No.")));
            Editable = false;
        }
        field(9; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(10; StartingDate; Date)
        {
            Caption = 'Starting Date';
        }
        field(11; Frequency; DateFormula)
        {
            Caption = 'Billing Frequency';
            TableRelation = "Contract Item Price".Frequency;
            trigger OnValidate()
            var
                PriceList: Record "Contract Item Price";
            begin
                PriceList.get(Rec."Item No.", '', Rec.Frequency);
                Rec.Price := PriceList.Price;
            end;
        }
        field(12; LastBillingDate; Date)
        {
            Caption = 'Last Billed up to Date';
            Editable = false;
        }
        field(13; Price; Decimal)
        {
            Caption = 'Frequency Price';
        }
    }
    keys
    {
        key(PK; "Contract No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Contract: Record Contract;
    begin
        Contract.Setrange("Contract No.", Rec."Contract No.");
        contract.FindFirst();
        Rec."Customer No." := Contract."Customer No.";
    end;
}
