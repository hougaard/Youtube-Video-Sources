codeunit 50100 "Implement" implements testinterface
{
    procedure ArchiveUnpostedOrder(var SalesHeader: Record "Sales Header");
    begin

    end;

    procedure CheckSalesDocument(var SalesHeader: Record "Sales Header");
    begin

    end;

    procedure CopyToTempLines(SalesHeader: Record "Sales Header"; var TempSalesLine: Record "Sales Line");
    begin

    end;

    procedure CreateWhseJnlLine(ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line"; var TempWhseJnlLine: Record "Warehouse Journal Line");
    begin

    end;

    procedure FillTempLines(SalesHeader: Record "Sales Header"; var TempSalesLine: Record "Sales Line");
    begin

    end;

    procedure GetGlobaDocumentsHeaders(var NewSalesShptHeader: Record "Sales Shipment Header"; var NewSalesInvHeader: Record "Sales Invoice Header"; var NewSalesCrMemoHeader: Record "Sales Cr.Memo Header"; var NewReturnRcptHeader: Record "Return Receipt Header");
    begin

    end;

    procedure GetGlobalSrcCode(var NewSrcCode: Code[10]);
    begin

    end;

    procedure GetGlobalTempTrackingSpecification(var NewTempTrackingSpecification: Record "Tracking Specification");
    begin

    end;

    procedure GetGlobalTempTrackingSpecificationInv(var NewTempTrackingSpecificationInv: Record "Tracking Specification");
    begin

    end;

    procedure GetGlobalWhseFlags(var NewWhseShip: Boolean; var NewWhseReceive: Boolean; var NewInvtPickPutaway: Boolean);
    begin

    end;

    procedure GetPostedDocumentRecord(SalesHeader: Record "Sales Header"; var PostedSalesDocumentVariant: Variant);
    begin

    end;

    procedure GetSalesLines(var SalesHeader: Record "Sales Header"; var NewSalesLine: Record "Sales Line"; QtyType: Option);
    begin

    end;

    procedure GetSalesLinesTemp(var SalesHeader: Record "Sales Header"; var NewSalesLine: Record "Sales Line"; var OldSalesLine: Record "Sales Line"; QtyType: Option);
    begin

    end;

    procedure IncrAmount(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; var TotalSalesLine: Record "Sales Line");
    begin

    end;

    procedure InitProgressWindow(SalesHeader: Record "Sales Header");
    begin

    end;

    procedure PostDistributeItemCharge(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; var TempItemLedgEntry: Record "Item Ledger Entry"; NonDistrQuantity: Decimal; NonDistrQtyToAssign: Decimal; NonDistrAmountToAssign: Decimal);
    begin

    end;

    procedure PostItemCharge(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; ItemLedgEntryNo: Integer; QuantityBase: Decimal; AmountToAssign: Decimal; QtyToAssign: Decimal);
    begin

    end;

    procedure PostItemChargePerShpt(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line");
    begin

    end;

    procedure PostItemJnlLine(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; QtyToBeShipped: Decimal; QtyToBeShippedBase: Decimal; QtyToBeInvoiced: Decimal; QtyToBeInvoicedBase: Decimal; ItemLedgShptEntryNo: Integer; ItemChargeNo: Code[20]; TrackingSpecification: Record "Tracking Specification"; IsATO: Boolean): Integer;
    begin

    end;

    procedure PostItemJnlLinePrepareJournalLine(var ItemJnlLine: Record "Item Journal Line"; SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; QtyToBeShipped: Decimal; QtyToBeShippedBase: Decimal; QtyToBeInvoiced: Decimal; QtyToBeInvoicedBase: Decimal; ItemLedgShptEntryNo: Integer; ItemChargeNo: Code[20]; TrackingSpecification: Record "Tracking Specification"; IsATO: Boolean);
    begin

    end;

    procedure PrepareCheckDocument(var SalesHeader: Record "Sales Header");
    begin

    end;

    procedure RefreshTempLines(SalesHeader: Record "Sales Header"; var TempSalesLine: Record "Sales Line");
    begin

    end;

    procedure ReleaseSalesDocument(var SalesHeader: Record "Sales Header");
    begin

    end;

    procedure ResetTempLines(var TempSalesLineLocal: Record "Sales Line");
    begin

    end;

    procedure ReverseAmount(var SalesLine: Record "Sales Line");
    begin

    end;

    procedure SendPostedDocumentRecord(SalesHeader: Record "Sales Header"; var DocumentSendingProfile: Record "Document Sending Profile");
    begin

    end;

    procedure SetItemEntryRelation(var ItemEntryRelation: Record "Item Entry Relation"; var SalesShptLine: Record "Sales Shipment Line"; var InvoicingTrackingSpecification: Record "Tracking Specification"; var ItemLedgEntryNotInvoiced: Record "Item Ledger Entry"; TrackingSpecificationExists: Boolean; HasATOShippedNotInvoiced: Boolean);
    begin

    end;

    procedure SetPostingFlags(var SalesHeader: Record "Sales Header");
    begin

    end;

    procedure SetPreviewMode(NewPreviewMode: Boolean);
    begin

    end;

    procedure SetSuppressCommit(NewSuppressCommit: Boolean);
    begin

    end;

    procedure SetWhseJnlRegisterCU(var WhseJnlRegisterLine: codeunit "Whse. Jnl.-Register Line");
    begin

    end;

    procedure SetWhseRcptHeader(var WhseRcptHeader2: Record "Warehouse Receipt Header");
    begin

    end;

    procedure SetWhseShptHeader(var WhseShptHeader2: Record "Warehouse Shipment Header");
    begin

    end;

    procedure ShouldPostWhseJnlLine(SalesLine: Record "Sales Line"): Boolean;
    begin

    end;

    procedure SumSalesLines(var NewSalesHeader: Record "Sales Header"; QtyType: Option; var NewTotalSalesLine: Record "Sales Line"; var NewTotalSalesLineLCY: Record "Sales Line"; var VATAmount: Decimal; var VATAmountText: Text[30]; var ProfitLCY: Decimal; var ProfitPct: Decimal; var TotalAdjCostLCY: Decimal);
    begin

    end;

    procedure SumSalesLinesTemp(var SalesHeader: Record "Sales Header"; var OldSalesLine: Record "Sales Line"; QtyType: Option; var NewTotalSalesLine: Record "Sales Line"; var NewTotalSalesLineLCY: Record "Sales Line"; var VATAmount: Decimal; var VATAmountText: Text[30]; var ProfitLCY: Decimal; var ProfitPct: Decimal; var TotalAdjCostLCY: Decimal);
    begin

    end;

    procedure TestSalesLine(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line");
    begin

    end;

    procedure TransferReservToItemJnlLine(var SalesOrderLine: Record "Sales Line"; var ItemJnlLine: Record "Item Journal Line"; QtyToBeShippedBase: Decimal; var TempTrackingSpecification2: Record "Tracking Specification"; var CheckApplFromItemEntry: Boolean);
    begin

    end;

    procedure UpdateBlanketOrderLine(SalesLine: Record "Sales Line"; Ship: Boolean; Receive: Boolean; Invoice: Boolean);
    begin

    end;

    procedure UpdateChargeItemReturnRcptLineGenProdPostingGroup(var ReturnReceiptLine: Record "Return Receipt Line");
    begin

    end;

    procedure UpdateChargeItemSalesLineGenProdPostingGroup(var SalesLine: Record "Sales Line");
    begin

    end;

    procedure UpdateChargeItemSalesShptLineGenProdPostingGroup(var SalesShipmentLine: Record "Sales Shipment Line");
    begin

    end;

    procedure UpdatePrepmtSalesLineWithRounding(var PrepmtSalesLine: Record "Sales Line"; TotalRoundingAmount: array[2] of Decimal; TotalPrepmtAmount: array[2] of Decimal; FinalInvoice: Boolean; PricesInclVATRoundingAmount: array[2] of Decimal);
    begin

    end;

    procedure UpdateSalesOrderChargeAssgnt(SalesOrderInvLine: Record "Sales Line"; SalesOrderLine: Record "Sales Line");
    begin

    end;

    procedure WhseHandlingRequiredExternal(SalesLine: Record "Sales Line"): Boolean;
    begin

    end;
}