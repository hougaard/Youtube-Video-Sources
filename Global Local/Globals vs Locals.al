page 50108 "Global vs Local"
{
    Caption = 'Globals vs locals';
    PageType = List;
    SourceTable = Customer;
    layout
    {
        area(Content)
        {
            repeater(Rep)
            {

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field(test; GlobalText(Rec))
                {
                    Caption = 'Global Text';
                    ApplicationArea = all;
                }
            }
        }
    }
    procedure GlobalText(Customer: Record Customer): Text
    begin
        test2(Customer);
        exit(Customer.Name + ' ' + format(random(100000)));
    end;

    procedure test2(var Customer: Record Customer)
    begin
        Customer.Name := 'Erik';
    end;

    procedure test3()
    var
        sh: record "Sales Header";
        sl: Record "Sales Line";
    begin
        repeat
            test4(sl);
        until true;
    end;

    procedure test4(var sl: Record "Sales Line")
    begin
        sl."Document Type" := sl."Document Type"::Invoice;
        sl.insert();
        if 4 > 6 then
            sl.Quantity := 10;
        sl.Modify();
    end;


}