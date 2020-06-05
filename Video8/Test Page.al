page 50300 "Barcode Page"
{

    Caption = 'Barcode Page';
    PageType = Card;
    SourceTable = "Test Table BarCode";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(BarCode; BarCode)
                {
                    ApplicationArea = All;
                }
                field("BarCode Picture"; "BarCode Picture")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CreateBar)
            {
                Caption = 'Create BarCode';
                ApplicationArea = all;
                trigger OnAction()
                var
                    B: Codeunit "Barcode 3 of 9";
                    OutS: OutStream;
                begin
                    CalcFields("BarCode Picture");
                    "BarCode Picture".CreateOutStream(OutS);
                    B.SetDPI(48, 9600, 900);
                    B.AddQuiet(true);
                    B.MkBarcode(BarCode, OutS, true);
                    Modify();
                end;
            }
        }
    }

}
