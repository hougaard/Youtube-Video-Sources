page 57100 "Point of sale"
{
    Caption = 'Point of Sale';
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const(Invoice));
    Editable = true;
    InsertAllowed = false;
    PageType = Document;
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            field(Status; PosStatus)
            {
                Caption = 'Status';
                ApplicationArea = all;
                Editable = false;
            }
            field("No."; "No.")
            {
                ApplicationArea = all;
            }
            field("Sell-to Customer Name"; "Sell-to Customer Name")
            {
                ApplicationArea = all;
            }
            part(Lines; "POS Lines")
            {
                SubPageLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                ApplicationArea = all;
            }
            usercontrol(Scanner; ScannerInterface)
            {
                ApplicationArea = all;
                trigger Scanned(Barcode: Text)
                var
                    Item: Record Item;
                    PM: Record "Payment Method";
                begin
                    case PosStatus of
                        PosStatus::"Awaiting new Receipt":
                            begin
                                NewReceipt();
                                if Item.get(Barcode) then
                                    ScanItem(Item);
                            end;
                        PosStatus::"Receipt Active":
                            begin
                                if Item.Get(BarCode) then
                                    ScanItem(Item)
                                else
                                    if PM.Get(BarCode) then
                                        PayAndPost(PM);
                            end;
                    end;
                end;
            }
        }
        area(FactBoxes)
        {
            part(Total; "POS Receipt Total")
            {
                SubPageLink = "Document Type" = field("Document Type"), "No." = field("No.");
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(NewReceiptAction)
            {
                Caption = 'New Receipt';
                ApplicationArea = All;
                Image = NewReceipt;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    NewReceipt();
                end;
            }
            action(PayAction)
            {
                Caption = 'Pay';
                ApplicationArea = All;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    PM: REcord "Payment Method";
                    Post: Codeunit "Sales-Post";
                begin
                    PM.Setrange("POS Payment", true);
                    if page.Runmodal(Page::"Select Payment", PM) = Action::LookupOK then begin
                        PayAndPost(PM);
                    end;
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        setfilter("No.", '%1', '');
        PosStatus := PosStatus::"Awaiting new Receipt";
    end;

    procedure NewReceipt()
    var
        Setup: Record "POS Setup";
        SH: Record "Sales Header";
    begin
        Setup.GET();
        SH.Init();
        SH."Document Type" := SH."Document Type"::Invoice;
        SH.Insert(true);
        Setfilter("No.", SH."No.");
        FindFirst();
        Validate("Sell-to Customer No.", Setup."Cash Customer");
        Validate("Posting Date", TODAY());
        Modify(true);
        PosStatus := PosStatus::"Receipt Active";
    end;

    local procedure ScanItem(Item: Record Item)
    var
        SL: Record "Sales Line";
        NextNo: Integer;
        Release: Codeunit "Release Sales Document";
    begin
        Release.Reopen(Rec);
        SL.setrange("Document Type", Rec."Document Type");
        SL.Setrange("Document No.", Rec."No.");
        SL.Setrange(Type, SL.Type::Item);
        SL.Setrange("No.", Item."No.");
        if Sl.FindFirst() then begin
            SL.Validate(Quantity, SL.Quantity + 1);
            SL.Modify(true);
        end else begin
            SL.Setrange("No.");
            SL.Setrange(Type);
            if SL.FindLast() then
                NextNo := SL."Line No." + 10000
            else
                NextNo := 10000;
            SL.Reset();
            SL."Document type" := Rec."Document Type";
            SL."Document No." := Rec."No.";
            Sl."Line No." := NextNo;
            SL.Insert(true);
            SL.Validate(Type, SL.Type::Item);
            SL.Validate("No.", Item."No.");
            SL.Validate(Quantity, 1);
            Sl.Modify(true);
        end;
        Release.Run(Rec);
    end;

    local procedure PayAndPost(PM: Record "Payment Method")
    var
        Post: Codeunit "Sales-Post";
    begin
        Validate("Payment Method Code", PM.Code);
        Modify(true);
        Post.SetSuppressCommit(true);
        Post.Run(Rec);
        PosStatus := PosStatus::"Awaiting new Receipt";
        CurrPage.Update(false);
        Currpage.Scanner.SetFocus();
    end;


    var
        PosStatus: Option "Awaiting new Receipt","Receipt Active";
}