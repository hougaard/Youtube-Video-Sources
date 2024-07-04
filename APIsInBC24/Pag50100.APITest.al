page 50140 APITest
{
    APIGroup = 'group';
    APIPublisher = 'hougaard';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiTest';
    DelayedInsert = true;
    EntityName = 'salesheader';
    EntitySetName = 'salesheaders';
    PageType = API;
    SourceTable = "Sales Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(subtype; Rec.Subtype)
                {
                    Caption = 'Subtype';
                }
                field(vatCalculationType; Rec."VAT Calculation Type")
                {
                    Caption = 'VAT Calculation Type';
                }
                field(prepmtVATCalcType; Rec."Prepmt. VAT Calc. Type")
                {
                    Caption = 'Prepmt. VAT Calc. Type';
                }
                field(itemReferenceType; Rec."Item Reference Type")
                {
                    Caption = 'Item Reference Type';
                }
                field(icPartnerRefType; Rec."IC Partner Ref. Type")
                {
                    Caption = 'IC Partner Ref. Type';
                }
            }
        }
    }
}
