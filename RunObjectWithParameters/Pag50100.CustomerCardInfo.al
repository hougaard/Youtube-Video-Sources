page 50100 "Customer Card Info EH"
{
    Caption = 'Customer Card Info';
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(RememberParm1; RememberParm1)
                {
                    ApplicationArea = all;
                    Caption = 'Parm 1';
                    Editable = false;
                }
                field(RememberParm2; RememberParm2)
                {
                    ApplicationArea = all;
                    Caption = 'Parm 2';
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Editable = RememberParm2 > 200;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = All;
                }
                field("Telex No."; Rec."Telex No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    internal procedure SetupPage(Parm1: Text; Parm2: Decimal)
    begin
        RememberParm1 := Parm1;
        RememberParm2 := Parm2;
    end;

    procedure GetParm1(): Text
    begin
        Exit(RememberParm1);
    end;

    trigger OnOpenPage()
    begin
        message('OpenPage %1 %2', RememberParm1, RememberParm2);
    end;

    trigger OnInit()
    begin
        message('OnInit %1 %2', RememberParm1, RememberParm2);
    end;

    var
        RememberParm1: Text;
        RememberParm2: Decimal;
}
