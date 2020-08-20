page 54100 "Scanner Test 1"
{

    ApplicationArea = All;
    Caption = 'Scanner Test 1';
    PageType = List;
    SourceTable = "Scanned Data";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Data; Data)
                {
                    ApplicationArea = All;
                }
            }
            usercontrol(Scanner; ScannerInterface)
            {
                ApplicationArea = all;
                trigger Scanned(Barcode: Text)
                var
                    ScanRec: Record "Scanned Data";
                begin
                    ScanRec.init();
                    ScanRec.Data := Barcode;
                    ScanRec.Insert(true);
                    CurrPage.Update(false);
                end;
            }
        }
    }

}
