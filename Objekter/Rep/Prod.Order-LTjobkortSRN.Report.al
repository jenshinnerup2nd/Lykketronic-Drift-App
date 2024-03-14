//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50011 "Prod. Order - LT jobkort SRN"
{
    // 191213 VD/age   Lykketronic "jobkort"
    // 060814 VD/MBP
    // 
    // //Dynalogic, srn 06112014
    // tilf¢jet ext.varenummer + beskrivelse
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Prod. Order - LT jobkort SRN.rdl';

    Caption = 'Prod. Order - LT jobkort';
    PreviewMode = Normal;

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = sorting(Status, "No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = Status, "No.", "Source Type", "Source No.";
            column(ReportForNavId_4824; 4824)
            {
            }
            column(TodayFormatted; Format(Today, 0, 4))
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(ProdOrderTableCaptionFilter; TableCaption + ':' + ProdOrderFilter)
            {
            }
            column(No_ProdOrder; "No.")
            {
            }
            column(Desc_ProdOrder; Description)
            {
            }
            column(SourceNo_ProdOrder; "Source No.")
            {
                IncludeCaption = true;
            }
            column(Status_ProdOrder; Status)
            {
            }
            column(Qty_ProdOrder; Quantity)
            {
                IncludeCaption = true;
            }
            column(Filter_ProdOrder; ProdOrderFilter)
            {
            }
            column(ProdOrderMaterialRqstnCapt; ProdOrderMaterialRqstnCaptLbl)
            {
            }
            column(CurrReportPageNoCapt; CurrReportPageNoCaptLbl)
            {
            }
            column(naviNo; naviNo)
            {
            }
            column(prodBom; prodBom)
            {
            }
            column(shelf; shelf)
            {
            }
            column(qtyInv; Format(qtyInv))
            {
            }
            column(serialNos; serialNos)
            {
            }
            column(commentTxt; commentTxt)
            {
            }
            column(extItem; extItem)
            {
            }
            column(extDescription; extDescription)
            {
            }
            dataitem("Prod. Order Component"; "Prod. Order Component")
            {
                DataItemLink = "Prod. Order No." = field("No.");
                DataItemTableView = sorting(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.");
                column(ReportForNavId_7771; 7771)
                {
                }
                column(ItemNo_ProdOrderComp; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(Desc_ProdOrderComp; Description)
                {
                    IncludeCaption = true;
                }
                column(Qtyper_ProdOrderComp; "Quantity per")
                {
                    IncludeCaption = true;
                }
                column(UOMCode_ProdOrderComp; "Unit of Measure Code")
                {
                    IncludeCaption = true;
                }
                column(RemainingQty_ProdOrderComp; "Remaining Quantity")
                {
                    IncludeCaption = true;
                }
                column(Scrap_ProdOrderComp; "Scrap %")
                {
                    IncludeCaption = true;
                }
                column(DueDate_ProdOrderComp; Format("Due Date"))
                {
                    IncludeCaption = false;
                }
                column(LocationCode_ProdOrderComp; "Location Code")
                {
                    IncludeCaption = true;
                }
                column(naviNo2; naviNo2)
                {
                }
                column(shelfNo; shelfNoItem)
                {
                }
                column(qtyInvItem; qtyInvItem)
                {
                }
                column(pickQty; pickQty)
                {
                }
                column(short; short)
                {
                }
                column(pos; pos)
                {
                }
                column(shelfNo_Item; shelfNoItem)
                {
                }

                trigger OnAfterGetRecord()
                var
                    item: Record Item;
                begin
                    // 191213:
                    naviNo2 := '';
                    shelfNoItem := '';
                    if item.Get("Prod. Order Component"."Item No.") then begin
                        naviNo2 := item.NaviNo;
                        shelfNoItem := item."Shelf No.";
                        item.CalcFields(Inventory);
                        qtyInvItem := item.Inventory;                    // udskrives ikke, egentlig overfl¢dig ...
                    end;
                    pos := Lowercase("Prod. Order Component".Position + "Prod. Order Component"."Position 2");
                    // :191213

                    pickQty := "Prod. Order Component".Quantity;
                    compBefore.Reset;
                    compBefore.SetRange(Status, "Prod. Order Component".Status);
                    compBefore.SetRange("Prod. Order No.", "Prod. Order Component"."Prod. Order No.");
                    compBefore.SetRange("Prod. Order Line No.", "Prod. Order Component"."Prod. Order Line No.");
                    compBefore.SetFilter("Line No.", '<%1', "Prod. Order Component"."Line No.");
                    compBefore.SetRange("Item No.", "Prod. Order Component"."Item No.");
                    if compBefore.FindSet then begin
                        pickQty := 0;                   // shown with earlier line
                        shelfNoItem := '^';
                    end else begin
                        compAfter.Reset;
                        compAfter.SetRange(Status, "Prod. Order Component".Status);
                        compAfter.SetRange("Prod. Order No.", "Prod. Order Component"."Prod. Order No.");
                        compAfter.SetRange("Prod. Order Line No.", "Prod. Order Component"."Prod. Order Line No.");
                        compAfter.SetFilter("Line No.", '>%1', "Prod. Order Component"."Line No.");
                        compAfter.SetRange("Item No.", "Prod. Order Component"."Item No.");
                        if compAfter.FindSet then
                            repeat
                                pickQty += compAfter.Quantity;                      // include later lines for same itemNo
                            until compAfter.Next = 0;
                    end;
                    pickQty := pickQty * "Production Order".Quantity;
                    if pickQty > item.Inventory then
                        short := 'M'
                    else
                        short := '';
                    //short := format(round(item.inventory));
                    // :191213

                    with ReservationEntry do begin
                        SetCurrentkey("Source ID", "Source Ref. No.", "Source Type", "Source Subtype");

                        SetRange("Source Type", Database::"Prod. Order Component");
                        SetRange("Source ID", "Production Order"."No.");
                        SetRange("Source Ref. No.", "Line No.");
                        SetRange("Source Subtype", Status);
                        SetRange("Source Batch Name", '');
                        SetRange("Source Prod. Order Line", "Prod. Order Line No.");

                        if FindSet then begin
                            RemainingQtyReserved := 0;
                            repeat
                                if ReservationEntry2.Get("Entry No.", not Positive) then
                                    if (ReservationEntry2."Source Type" = Database::"Prod. Order Line") and
                                       (ReservationEntry2."Source ID" = "Prod. Order Component"."Prod. Order No.")
                                    then
                                        RemainingQtyReserved += ReservationEntry2."Quantity (Base)";
                            until Next = 0;
                            if "Prod. Order Component"."Remaining Qty. (Base)" = RemainingQtyReserved then
                                CurrReport.Skip;
                        end;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    //SRN
                    //SETFILTER("Remaining Quantity",'<>0');
                end;
            }
            dataitem("<Prod. Order Comment Line>"; "Prod. Order Component")
            {
                DataItemLink = "Prod. Order No." = field("No.");
                DataItemTableView = sorting(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.");
                column(ReportForNavId_1160520017; 1160520017)
                {
                }
                column(ItemNo_Comment; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(Desc_Comment; Description)
                {
                    IncludeCaption = true;
                }
                dataitem("Comment Line"; "Comment Line")
                {
                    DataItemLink = "No." = field("Item No.");
                    DataItemTableView = sorting("Table Name", "No.", "Line No.") where("Table Name" = filter(Item));
                    column(ReportForNavId_1160520015; 1160520015)
                    {
                    }
                    column(Comment; "Comment Line".Comment)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                var
                    item: Record Item;
                begin
                    // 191213:
                    naviNo2 := '';
                    shelfNoItem := '';
                    if item.Get("Prod. Order Component"."Item No.") then begin
                        naviNo2 := item.NaviNo;
                        shelfNoItem := item."Shelf No.";
                        item.CalcFields(Inventory);
                        qtyInvItem := item.Inventory;                    // udskrives ikke, egentlig overfl¢dig ...
                    end;
                    pos := Lowercase("Prod. Order Component".Position + "Prod. Order Component"."Position 2");
                    // :191213

                    pickQty := "Prod. Order Component".Quantity;
                    compBefore.Reset;
                    compBefore.SetRange(Status, "Prod. Order Component".Status);
                    compBefore.SetRange("Prod. Order No.", "Prod. Order Component"."Prod. Order No.");
                    compBefore.SetRange("Prod. Order Line No.", "Prod. Order Component"."Prod. Order Line No.");
                    compBefore.SetFilter("Line No.", '<%1', "Prod. Order Component"."Line No.");
                    compBefore.SetRange("Item No.", "Prod. Order Component"."Item No.");
                    if compBefore.FindSet then begin
                        pickQty := 0;                   // shown with earlier line
                        shelfNoItem := '^';
                    end else begin
                        compAfter.Reset;
                        compAfter.SetRange(Status, "Prod. Order Component".Status);
                        compAfter.SetRange("Prod. Order No.", "Prod. Order Component"."Prod. Order No.");
                        compAfter.SetRange("Prod. Order Line No.", "Prod. Order Component"."Prod. Order Line No.");
                        compAfter.SetFilter("Line No.", '>%1', "Prod. Order Component"."Line No.");
                        compAfter.SetRange("Item No.", "Prod. Order Component"."Item No.");
                        if compAfter.FindSet then
                            repeat
                                pickQty += compAfter.Quantity;                      // include later lines for same itemNo
                            until compAfter.Next = 0;
                    end;
                    pickQty := pickQty * "Production Order".Quantity;
                    if pickQty > item.Inventory then
                        short := 'M'
                    else
                        short := '';
                    //short := format(round(item.inventory));
                    // :191213

                    with ReservationEntry do begin
                        SetCurrentkey("Source ID", "Source Ref. No.", "Source Type", "Source Subtype");

                        SetRange("Source Type", Database::"Prod. Order Component");
                        SetRange("Source ID", "Production Order"."No.");
                        SetRange("Source Ref. No.", "Line No.");
                        SetRange("Source Subtype", Status);
                        SetRange("Source Batch Name", '');
                        SetRange("Source Prod. Order Line", "Prod. Order Line No.");

                        if FindSet then begin
                            RemainingQtyReserved := 0;
                            repeat
                                if ReservationEntry2.Get("Entry No.", not Positive) then
                                    if (ReservationEntry2."Source Type" = Database::"Prod. Order Line") and
                                       (ReservationEntry2."Source ID" = "Prod. Order Component"."Prod. Order No.")
                                    then
                                        RemainingQtyReserved += ReservationEntry2."Quantity (Base)";
                            until Next = 0;
                            if "Prod. Order Component"."Remaining Qty. (Base)" = RemainingQtyReserved then
                                CurrReport.Skip;
                        end;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    //SRN
                    //SETFILTER("Remaining Quantity",'<>0');
                end;
            }

            trigger OnAfterGetRecord()
            var
                item: Record Item;
                noSeriesLine: Record "No. Series Line";
                CommentLine: Record "Comment Line";
                ProdOrderLine: Record "Prod. Order Line";
                ReserveProdOrderLine: Codeunit "Prod. Order Line-Reserve";
                TrackingSpecification: Record "Tracking Specification";
                ItemTrackingForm: Page "Item Tracking Lines";
                ItemTrackingMgt: Codeunit "Item Tracking Management";
                TrackingSpecificationLines: Record "Tracking Specification";
                ItemSeriel: Record Item;
            begin
                // 191213:
                shelf := '';
                if item.Get("Production Order"."Source No.") then begin
                    naviNo := item.NaviNo;
                    shelf := item."Shelf No.";
                    prodBom := item."Production BOM No.";
                    item.CalcFields(Inventory);
                    qtyInv := item.Inventory;
                end;

                firstSerialNo := '';
                lastSerialNo := '';
                ProdOrderLine.SetCurrentkey(Status, "Prod. Order No.");
                ProdOrderLine.SetRange(Status, Status);
                ProdOrderLine.SetRange("Prod. Order No.", "No.");

                if ProdOrderLine.FindFirst then begin

                    // if (ItemSeriel.Get(ProdOrderLine."Item No.") and (ItemSeriel."Item Tracking Code" <> '')) then begin                
                    //   if ProdOrderLine.Status = ProdOrderLine.Status::Finished then begin
                    //     ItemTrackingMgt.CallPostedItemTrackingForm4(Database::"Prod. Order Line",
                    //     ProdOrderLine."Prod. Order No.",ProdOrderLine."Line No.",0);
                    //   end else begin
                    //     ProdOrderLine.TestField("Item No.");
                    //     ReserveProdOrderLine.InitTrackingSpecification(ProdOrderLine,TrackingSpecification);
                    //     ItemTrackingForm.SetSource(TrackingSpecification,ProdOrderLine."Due Date");
                    //     serialNos := ItemTrackingForm.GetTrackingSpecificationRange();                                 
                    //   end;
                    // end;
                end;

                commentTxt := '';                                                                                              //060814
                CommentLine.SetRange("Table Name", CommentLine."table name"::Item);
                CommentLine.SetRange("No.", "Production Order"."Source No.");
                CommentLine.SetRange(CommentLine."Line No.", 10000);
                if CommentLine.FindFirst then
                    commentTxt1 := CommentLine.Comment;

                Clear(CommentLine);
                CommentLine.SetRange("Table Name", CommentLine."table name"::Item);
                CommentLine.SetRange("No.", "Production Order"."Source No.");
                CommentLine.SetRange(CommentLine."Line No.", 20000);
                if CommentLine.FindFirst then
                    commentTxt2 := CommentLine.Comment;

                Clear(CommentLine);
                CommentLine.SetRange("Table Name", CommentLine."table name"::Item);
                CommentLine.SetRange("No.", "Production Order"."Source No.");
                CommentLine.SetRange(CommentLine."Line No.", 30000);
                if CommentLine.FindFirst then
                    commentTxt3 := CommentLine.Comment;

                Clear(CommentLine);
                CommentLine.SetRange("Table Name", CommentLine."table name"::Item);
                CommentLine.SetRange("No.", "Production Order"."Source No.");
                CommentLine.SetRange(CommentLine."Line No.", 40000);
                if CommentLine.FindFirst then
                    commentTxt4 := CommentLine.Comment;

                Clear(CommentLine);
                CommentLine.SetRange("Table Name", CommentLine."table name"::Item);
                CommentLine.SetRange("No.", "Production Order"."Source No.");
                CommentLine.SetRange(CommentLine."Line No.", 50000);
                if CommentLine.FindFirst then
                    commentTxt5 := CommentLine.Comment;

                commentTxt := commentTxt1 + ' ' + commentTxt2 + ' ' + commentTxt3 + ' ' + commentTxt4 + ' ' + commentTxt5;

                //Dynalogic, srn 06112014 Begin
                commentTxt := '';
                Clear(CommentLine);
                CommentLine.SetRange("Table Name", CommentLine."table name"::Item);
                CommentLine.SetRange("No.", "Production Order"."Source No.");
                if CommentLine.FindSet then
                    repeat
                        if commentTxt <> '' then begin
                            commentTxt := commentTxt + ' ' + CommentLine.Comment;
                        end else begin
                            commentTxt := CommentLine.Comment;
                        end;
                        if StrLen(commentTxt) > 1000 then begin
                            exit;
                        end;
                    until CommentLine.Next = 0;
                //Dynalogic, srn 06112014 End

                if Print then begin
                    "No. Printed" := "No. Printed" + 1;
                    Modify;
                    Commit;
                end;

                //Dynalogic, srn 06112014 Begin
                if "Production Order".CustomerNo <> '' then begin
                    iItemRef.SetRange("Item No.", "Production Order"."Source No.");
                    iItemRef.SetRange("Reference Type", iItemRef."Reference type"::Customer);
                    iItemRef.SetRange("Reference Type No.", "Production Order".CustomerNo);
                    if iItemRef.FindFirst then begin
                        extItem := iItemRef."Reference No.";
                        extDescription := iItemRef.Description;
                    end;
                end;
                //Dynalogic, srn 06112014 End

            end;

            trigger OnPreDataItem()
            begin
                ProdOrderFilter := GetFilters;

                NoOfRecords := Count;

                Print := not CurrReport.Preview;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
        ProdOrderCompDueDateCapt = 'Due Date';
    }

    var
        compBefore: Record "Prod. Order Component";
        compAfter: Record "Prod. Order Component";
        ReservationEntry: Record "Reservation Entry";
        ReservationEntry2: Record "Reservation Entry";
        ProdOrderFilter: Text[250];
        RemainingQtyReserved: Decimal;
        ProdOrderMaterialRqstnCaptLbl: label 'Prod. Order - Material Requisition';
        CurrReportPageNoCaptLbl: label 'Page';
        prodBom: Text[20];
        commentTxt: Text[1024];
        commentTxt1: Text[250];
        commentTxt2: Text[250];
        commentTxt3: Text[250];
        commentTxt4: Text[250];
        commentTxt5: Text[250];
        shelf: Text[20];
        qtyInv: Decimal;
        serialNos: Text[30];
        firstSerialNo: Text[20];
        lastSerialNo: Text[20];
        naviNo: Text[20];
        naviNo2: Text[20];
        pos: Text[30];
        shelfNoItem: Text[20];
        pickQty: Decimal;
        qtyInvItem: Decimal;
        short: Text[20];
        c: Integer;
        NoOfRecords: Integer;
        Print: Boolean;
        "***dynalogic": Integer;
        iItemRef: Record "Item Reference";
        extItem: Code[20];
        extDescription: Text[50];
}

