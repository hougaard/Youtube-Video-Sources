interface testinterface
{

    procedure ArchiveUnpostedOrder(var SalesHeader: Record "Sales Header");
    procedure CheckSalesDocument(var SalesHeader: Record "Sales Header");
    procedure CopyToTempLines(SalesHeader: Record "Sales Header"; var TempSalesLine: Record "Sales Line");
    procedure CreateWhseJnlLine(ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line"; var TempWhseJnlLine: Record "Warehouse Journal Line");
    procedure FillTempLines(SalesHeader: Record "Sales Header"; var TempSalesLine: Record "Sales Line");
    procedure GetGlobaDocumentsHeaders(var NewSalesShptHeader: Record "Sales Shipment Header"; var NewSalesInvHeader: Record "Sales Invoice Header"; var NewSalesCrMemoHeader: Record "Sales Cr.Memo Header"; var NewReturnRcptHeader: Record "Return Receipt Header");
    procedure GetGlobalSrcCode(var NewSrcCode: Code[10]);
    procedure GetGlobalTempTrackingSpecification(var NewTempTrackingSpecification: Record "Tracking Specification");
    procedure GetGlobalTempTrackingSpecificationInv(var NewTempTrackingSpecificationInv: Record "Tracking Specification");
    procedure GetGlobalWhseFlags(var NewWhseShip: Boolean; var NewWhseReceive: Boolean; var NewInvtPickPutaway: Boolean);
    procedure GetPostedDocumentRecord(SalesHeader: Record "Sales Header"; var PostedSalesDocumentVariant: Variant);
    procedure GetSalesLines(var SalesHeader: Record "Sales Header"; var NewSalesLine: Record "Sales Line"; QtyType: Option);
    procedure GetSalesLinesTemp(var SalesHeader: Record "Sales Header"; var NewSalesLine: Record "Sales Line"; var OldSalesLine: Record "Sales Line"; QtyType: Option);
    procedure IncrAmount(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; var TotalSalesLine: Record "Sales Line");
    procedure InitProgressWindow(SalesHeader: Record "Sales Header");
    procedure PostDistributeItemCharge(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; var TempItemLedgEntry: Record "Item Ledger Entry"; NonDistrQuantity: Decimal; NonDistrQtyToAssign: Decimal; NonDistrAmountToAssign: Decimal);
    procedure PostItemCharge(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; ItemLedgEntryNo: Integer; QuantityBase: Decimal; AmountToAssign: Decimal; QtyToAssign: Decimal);
    procedure PostItemChargePerShpt(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line");
    procedure PostItemJnlLine(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; QtyToBeShipped: Decimal; QtyToBeShippedBase: Decimal; QtyToBeInvoiced: Decimal; QtyToBeInvoicedBase: Decimal; ItemLedgShptEntryNo: Integer; ItemChargeNo: Code[20]; TrackingSpecification: Record "Tracking Specification"; IsATO: Boolean): Integer;
    procedure PostItemJnlLinePrepareJournalLine(var ItemJnlLine: Record "Item Journal Line"; SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; QtyToBeShipped: Decimal; QtyToBeShippedBase: Decimal; QtyToBeInvoiced: Decimal; QtyToBeInvoicedBase: Decimal; ItemLedgShptEntryNo: Integer; ItemChargeNo: Code[20]; TrackingSpecification: Record "Tracking Specification"; IsATO: Boolean);
    procedure PrepareCheckDocument(var SalesHeader: Record "Sales Header");
    procedure RefreshTempLines(SalesHeader: Record "Sales Header"; var TempSalesLine: Record "Sales Line");
    procedure ReleaseSalesDocument(var SalesHeader: Record "Sales Header");
    procedure ResetTempLines(var TempSalesLineLocal: Record "Sales Line");
    procedure ReverseAmount(var SalesLine: Record "Sales Line");
    procedure SendPostedDocumentRecord(SalesHeader: Record "Sales Header"; var DocumentSendingProfile: Record "Document Sending Profile");
    procedure SetItemEntryRelation(var ItemEntryRelation: Record "Item Entry Relation"; var SalesShptLine: Record "Sales Shipment Line"; var InvoicingTrackingSpecification: Record "Tracking Specification"; var ItemLedgEntryNotInvoiced: Record "Item Ledger Entry"; TrackingSpecificationExists: Boolean; HasATOShippedNotInvoiced: Boolean);
    procedure SetPostingFlags(var SalesHeader: Record "Sales Header");
    procedure SetPreviewMode(NewPreviewMode: Boolean);
    procedure SetSuppressCommit(NewSuppressCommit: Boolean);
    procedure SetWhseJnlRegisterCU(var WhseJnlRegisterLine: Codeunit "Whse. Jnl.-Register Line");
    procedure SetWhseRcptHeader(var WhseRcptHeader2: Record "Warehouse Receipt Header");
    procedure SetWhseShptHeader(var WhseShptHeader2: Record "Warehouse Shipment Header");
    procedure ShouldPostWhseJnlLine(SalesLine: Record "Sales Line"): Boolean;
    procedure SumSalesLines(var NewSalesHeader: Record "Sales Header"; QtyType: Option; var NewTotalSalesLine: Record "Sales Line"; var NewTotalSalesLineLCY: Record "Sales Line"; var VATAmount: Decimal; var VATAmountText: Text[30]; var ProfitLCY: Decimal; var ProfitPct: Decimal; var TotalAdjCostLCY: Decimal);
    procedure SumSalesLinesTemp(var SalesHeader: Record "Sales Header"; var OldSalesLine: Record "Sales Line"; QtyType: Option; var NewTotalSalesLine: Record "Sales Line"; var NewTotalSalesLineLCY: Record "Sales Line"; var VATAmount: Decimal; var VATAmountText: Text[30]; var ProfitLCY: Decimal; var ProfitPct: Decimal; var TotalAdjCostLCY: Decimal);
    procedure TestSalesLine(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line");
    procedure TransferReservToItemJnlLine(var SalesOrderLine: Record "Sales Line"; var ItemJnlLine: Record "Item Journal Line"; QtyToBeShippedBase: Decimal; var TempTrackingSpecification2: Record "Tracking Specification"; var CheckApplFromItemEntry: Boolean);
    procedure UpdateBlanketOrderLine(SalesLine: Record "Sales Line"; Ship: Boolean; Receive: Boolean; Invoice: Boolean);
    procedure UpdateChargeItemReturnRcptLineGenProdPostingGroup(var ReturnReceiptLine: Record "Return Receipt Line");
    procedure UpdateChargeItemSalesLineGenProdPostingGroup(var SalesLine: Record "Sales Line");
    procedure UpdateChargeItemSalesShptLineGenProdPostingGroup(var SalesShipmentLine: Record "Sales Shipment Line");
    procedure UpdatePrepmtSalesLineWithRounding(var PrepmtSalesLine: Record "Sales Line"; TotalRoundingAmount: array[2] of Decimal; TotalPrepmtAmount: array[2] of Decimal; FinalInvoice: Boolean; PricesInclVATRoundingAmount: array[2] of Decimal);
    procedure UpdateSalesOrderChargeAssgnt(SalesOrderInvLine: Record "Sales Line"; SalesOrderLine: Record "Sales Line");
    procedure WhseHandlingRequiredExternal(SalesLine: Record "Sales Line"): Boolean;

}
