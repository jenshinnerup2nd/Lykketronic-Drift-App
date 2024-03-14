page 50002 DynSaleLine
{
    ApplicationArea = All;
    Caption = 'Ordre beholdning';
    AdditionalSearchTerms = ' Lykketronic (Uge) Ordre beholdning';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sales Line";
    ShowFilter = true;
    SourceTableView = sorting("Shipment Date", "Outstanding Quantity") order(ascending)
                        where(Type = filter(Item),
                              "Outstanding Quantity" = filter(<> 0),
                              "Document Type" = filter("Sales Document Type"::Order)
                              );
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(WeekNo; WeekNo)
                {
                    Caption = 'Uge';
                    StyleExpr = DynStyle;
                    HideValue = WeekNoHideValue;

                }

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number.';
                    StyleExpr = DynStyle;
                    HideValue = DocumentNoHideValue;
                }
                field(DynCustomerName; Rec.DynCustomerName)
                {
                    Caption = 'Kunde';
                    StyleExpr = DynStyle;
                    HideValue = DocumentNoHideValue;
                }
                field(DynSalesRef; Rec.DynSalesRef)
                {
                    Caption = 'Kunde ref';
                    StyleExpr = DynStyle;
                    HideValue = DocumentNoHideValue;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                    StyleExpr = DynStyle;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the record.';
                    StyleExpr = DynStyle;
                }
                field("Item Reference No."; Rec."Item Reference No.")
                {
                    ToolTip = 'Specifies item reference number.';
                    StyleExpr = DynStyle;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the item or service on the line.';
                    StyleExpr = DynStyle;
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ToolTip = 'Specifies how many units on the order line have not yet been shipped.';
                    StyleExpr = DynStyle;
                    DecimalPlaces = 0;
                }
                field(DynInventory; Rec.DynInventory)
                {
                    Caption = 'Lager';
                    StyleExpr = DynStyle;
                    DecimalPlaces = 0;

                }
                // field(DynProduction; Rec.DynProduction)
                // {
                //     Caption = 'Antal i produktion';
                // }
                // field(DynPurchase; Rec.DynPurchase)
                // {
                //     Caption = 'Antal i købsordre';
                // }
                field(DynItemDescription; Rec.DynItemDescription)
                {
                    Caption = 'Varebeskrivelse';
                    StyleExpr = DynStyle;

                }
            }
        }
    }

    trigger OnOpenPage()
    var
    begin
        Rec.SetFilter("Shipment Date", '>=%1', CalcDate('<-CY>', Today()));
    end;

    trigger OnAfterGetRecord()
    var
        EmptyDate: Date;

    begin
        If Rec."Shipment Date" = EmptyDate then begin
            If Rec."Requested Delivery Date" = EmptyDate then begin
                WeekNo := Date2DWY(CalcDate('<CM+30D>', Today()), 2);
            end else begin
                WeekNo := Date2DWY(CalcDate('<CM+30D>', Rec."Requested Delivery Date"), 2);
            end;
            Rec.Description := '#-' + Rec.Description
        end else begin
            WeekNo := Date2DWY(Rec."Shipment Date", 2);

            If Rec.DynInventory >= rec."Outstanding Quantity" then begin
                DynStyle := 'Favorable';
            end else begin
                DynStyle := 'Unfavorable'
            end;
        end;
        WeekNoHideValue := true;
        If WeekNo <> PrevWeekNo then begin
            // DocumentNoHideValue := false;
            // DocumentNoOnFormat();
            WeekNoHideValue := false;

        end;
        PrevWeekNo := WeekNo;



    end;


    // local procedure IsFirstDocLine(): Boolean
    // var
    //     SalesHeader2: Record "Sales Header";
    //     SalesLine2: Record "Sales Line";
    //     QtyNotReturned2: Decimal;
    //     RevUnitCostLCY2: Decimal;
    // begin
    //     if SalesHeader.IsEmpty then begin
    //         SalesHeader.Get(Rec."Document Type", Rec."Document No.");
    //     end;
    //     TempSalesLine.Reset();
    //     TempSalesLine.CopyFilters(Rec);
    //     TempSalesLine.SetRange("Document No.", Rec."Document No.");
    //     if not TempSalesLine.FindFirst() then begin
    //         SalesHeader2 := SalesHeader;          
    //         SalesLine2.CopyFilters(Rec);
    //         SalesLine2.SetRange("Document No.", Rec."Document No.");
    //         if not SalesLine2.FindSet() then
    //             exit(false);
    //         repeat
    //             ShowRec := IsShowRec(SalesLine2);
    //             if ShowRec then begin
    //                 TempSalesLine := SalesLine2;
    //                 TempSalesLine.Insert();
    //             end;
    //         until (SalesLine2.Next() = 0) or ShowRec;
    //         SalesHeader := SalesHeader2;

    //     end;

    //     if Rec."Document No." <> SalesHeader."No." then
    //         SalesHeader.Get(Rec."Document Type", Rec."Document No.");
    //     exit(Rec."Line No." = TempSalesLine."Line No.");
    // end;

    local procedure IsFirstDocLine(): Boolean
    var
        PrevRecord: Record "Sales Line";
    begin
        PrevRecord := Rec;
        if PrevRecord.Find('-') then
            IF Rec."Document No." <> PrevRecord."Document No." then
                exit(true);
        ;
    end;


    local procedure IsShowRec(SalesLine2: Record "Sales Line"): Boolean
    var
    begin
        exit(true);
    end;

    local procedure DocumentNoOnFormat()
    begin
        if not IsFirstDocLine() then
            DocumentNoHideValue := true;
    end;

    var
        WeekNo: Integer;
        DynIventoryCheck: Boolean;
        DynStyle: Text;
        ToSalesHeader: Record "Sales Header";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TempSalesLine: Record "Sales Line" temporary;
        QtyNotReturned: Decimal;
        RevUnitCostLCY: Decimal;
        UnitPrice: Decimal;
        LineAmount: Decimal;
        RevQtyFilter: Boolean;
        FillExactCostReverse: Boolean;
        IsVisible: Boolean;
        ShowRec: Boolean;
        DocumentNoHideValue: Boolean;
        WeekNoHideValue: Boolean;
        PrevWeekNo: Integer;
        PrevSalesOrderNo: Code[20];

}
