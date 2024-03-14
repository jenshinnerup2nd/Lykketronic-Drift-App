#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50210 "ProdOrderCompandRouting (L)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Prod. Order Comp. and Routing.rdl';
    Caption = 'Prod. Order Comp. and Routing';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = sorting(Status, "No.");
            RequestFilterFields = Status, "No.";
            column(ReportForNavId_4824; 4824)
            {
            }
            column(TodayFormatted; Format(Today, 0, 4))
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(Status_ProductionOrder; Status)
            {
                IncludeCaption = true;
            }
            column(No_ProductionOrder; "No.")
            {
                IncludeCaption = true;
            }
            column(CurrReportPageNoCapt; CurrReportPageNoCaptLbl)
            {
            }
            column(PrdOdrCmptsandRtngLinsCpt; PrdOdrCmptsandRtngLinsCptLbl)
            {
            }
            column(ProductionOrderDescCapt; ProductionOrderDescCaptLbl)
            {
            }
            column(Desc_ProdOrder; Description)
            {
            }
            column(SourceNo_ProdOrder; "Source No.")
            {
                IncludeCaption = true;
            }


            dataitem("Prod. Order Line"; "Prod. Order Line")
            {
                DataItemLink = Status = field(Status), "Prod. Order No." = field("No.");
                DataItemTableView = sorting(Status, "Prod. Order No.", "Line No.");
                RequestFilterFields = "Item No.", "Line No.";
                column(ReportForNavId_3581; 3581)
                {
                }
                column(No1_ProductionOrder; "Production Order"."No.")
                {
                }
                column(Desc_ProductionOrder; "Production Order".Description)
                {
                }
                column(Desc_ProdOrderLine; Description)
                {
                }
                column(Quantity_ProdOrderLine; Quantity)
                {
                    IncludeCaption = true;
                }
                column(ItemNo_ProdOrderLine; "Item No.")
                {
                }
                column(StartgDate_ProdOrderLine; Format("Starting Date"))
                {
                }
                column(StartgTime_ProdOrderLine; "Starting Time")
                {
                    IncludeCaption = true;
                }
                column(EndingDate_ProdOrderLine; Format("Ending Date"))
                {
                }
                column(EndingTime_ProdOrderLine; "Ending Time")
                {
                    IncludeCaption = true;
                }
                column(DueDate_ProdOrderLine; Format("Due Date"))
                {
                }
                column(LineNo_ProdOrderLine; "Line No.")
                {
                }
                column(ProdOdrLineStrtngDteCapt; ProdOdrLineStrtngDteCaptLbl)
                {
                }
                column(ProdOrderLineEndgDteCapt; ProdOrderLineEndgDteCaptLbl)
                {
                }
                column(ProdOrderLineDueDateCapt; ProdOrderLineDueDateCaptLbl)
                {
                }
                column(ProdOrderLine_FinishedQuantity; "Prod. Order Line"."Finished Quantity")
                {
                    IncludeCaption = true;
                }
                column(TotalNormTime; TotalNormTime)
                {
                }
                column(TotaltOprTime; TotaltOprTime)
                {
                }
                column(SerialNo; SerialNo)
                {
                }
                column(Comments; Comments)
                {
                }
                column(ItemPlacement; ItemPlacement)
                {
                }
                column(CurrentInventory; CurrentInventory)
                {
                }
                column(FirstSerialNo; FirstSerialNo)
                { }
                column(LastSerialNo; LastSerialNo)
                { }
                dataitem("Prod. Order Component"; "Prod. Order Component")
                {
                    DataItemLink = Status = field(Status), "Prod. Order No." = field("Prod. Order No."), "Prod. Order Line No." = field("Line No.");
                    DataItemTableView = sorting(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.");
                    column(ReportForNavId_7771; 7771)
                    {
                    }
                    column(ItemNo_PrdOrdrComp; "Item No.")
                    {
                    }
                    column(ItemNo_PrdOrdrCompCaption; FieldCaption("Item No."))
                    {
                    }
                    column(Description_ProdOrderComp; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(Quantityper_ProdOrderComp; "Quantity per")
                    {
                        IncludeCaption = true;
                    }
                    column(UntofMesrCode_PrdOrdrComp; "Unit of Measure Code")
                    {
                        IncludeCaption = true;
                    }
                    column(RemainingQty_PrdOrdrComp; "Remaining Quantity")
                    {
                        IncludeCaption = true;
                    }
                    column(DueDate_PrdOrdrComp; Format("Due Date"))
                    {
                    }
                    column(ProdOrdrLinNo_PrdOrdrComp; "Prod. Order Line No.")
                    {
                    }
                    column(LineNo_PrdOrdrComp; "Line No.")
                    {
                    }
                    column(DynShelfNoCaptionLbl; DynShelfNoCaptionLbl)
                    { }
                    column(CompShelfNo; CompShelfNo)
                    { }

                    trigger OnAfterGetRecord()
                    var
                        DynItem: Record Item;
                    begin
                        if ProductionJrnlMgt.RoutingLinkValid("Prod. Order Component", "Prod. Order Line") then
                            CurrReport.Skip;

                        //Dynalogic 060324 JNR - 6401 >>
                        clear(CompShelfNo);
                        DynItem.Reset;
                        DynItem.SetFilter("No.", '=%1', "Prod. Order Component"."Item No.");
                        if DynItem.findset then begin
                            CompShelfNo := Item."Shelf No.";
                        end;
                        //Dynalogic 060324 JNR - 6401 <<
                    end;
                }
                dataitem("Prod. Order Routing Line"; "Prod. Order Routing Line")
                {
                    DataItemLink = "Routing No." = field("Routing No."), "Routing Reference No." = field("Routing Reference No."), "Prod. Order No." = field("Prod. Order No."), Status = field(Status);
                    DataItemTableView = sorting(Status, "Prod. Order No.", "Routing Reference No.", "Routing No.", "Operation No.");
                    column(ReportForNavId_4877; 4877)
                    {
                    }
                    column(OprNo_ProdOrderRtngLine; "Operation No.")
                    {
                    }
                    column(OprNo_ProdOrderRtngLineCaption; FieldCaption("Operation No."))
                    {
                    }
                    column(Type_PrdOrdRtngLin; Type)
                    {
                        IncludeCaption = true;
                    }
                    column(No_ProdOrderRoutingLine; "No.")
                    {
                        IncludeCaption = true;
                    }
                    column(LinDesc_ProdOrderRtngLine; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(StrgDt_ProdOrderRtngLine; Format("Starting Date"))
                    {
                    }
                    column(LinStrgTime_PrdOrdRtngLin; "Starting Time")
                    {
                        IncludeCaption = true;
                    }
                    column(EndgDte_ProdOrdrRtngLine; Format("Ending Date"))
                    {
                    }
                    column(EndgTime_ProdOrdrRtngLin; "Ending Time")
                    {
                        IncludeCaption = true;
                    }
                    column(RoutgNo_ProdOrdrRtngLine; "Routing No.")
                    {
                    }
                    column(ShelfNoCaptionLbl; ShelfNoCaptionLbl)
                    {
                    }
                    column(ItemNoCaptionLbl; ItemNoCaptionLbl)
                    {
                    }
                    column(QtyCaptionLbl; QtyCaptionLbl)
                    {
                    }
                    column(UnitOfMeasureCaptionLbl; UnitOfMeasureCaptionLbl)
                    {
                    }
                    column(PickedCaptionLbl; PickedCaptionLbl)
                    {
                    }
                    column(OperationTimeCaptionLbl; OperationTimeCaptionLbl)
                    {
                    }
                    column(OprTime; OprTime)
                    {
                    }
                    dataitem(CompLink; "Prod. Order Component")
                    {
                        DataItemLink = Status = field(Status), "Prod. Order No." = field("Prod. Order No."), "Prod. Order Line No." = field("Routing Reference No."), "Routing Link Code" = field("Routing Link Code");
                        DataItemTableView = sorting(Status, "Prod. Order No.", "Routing Link Code", "Flushing Method") where("Routing Link Code" = filter(<> ''));
                        column(ReportForNavId_7844; 7844)
                        {
                        }
                        column(ItemNo_CompLink; "Item No.")
                        {
                        }
                        column(Description_CompLink; Description)
                        {
                        }
                        column(Quantityper_CompLink; "Quantity per")
                        {
                        }
                        column(UntofMeasureCode_CompLink; "Unit of Measure Code")
                        {
                        }
                        column(DueDate_CompLink; Format("Due Date"))
                        {
                        }
                        column(RemainingQty_CompLink; "Remaining Quantity") //Dynalogic 210224 JNR Antal - Rest antal med ny nøgle til denne værdi Varenr + position og så kun indsæt værdien i først tilfælde 
                        {
                        }
                        column(LineNo_CompLink; "Line No.")
                        {
                        }
                        column(RoutingLinkCode_CompLink; "Routing Link Code")
                        {
                        }
                        column(DynItemShelfNo; DynItemShelfNo)
                        {
                        }
                        column(Position; PositionText)
                        {
                        }
                        column(DynQuantity; DynQuantity)
                        { }

                        trigger OnAfterGetRecord()
                        var
                            ProdComp: Record "Prod. Order Component";
                        begin
                            //Dynalogic 061123 JNR - 6401 >>
                            Clear(DynItemShelfNo);
                            Item.Reset;
                            Item.SetFilter("No.", '=%1', CompLink."Item No.");
                            if Item.FindSet then begin
                                DynItemShelfNo := Item."Shelf No.";
                                //DynItemShelfNo += Item.AltShelfNo;
                            end;

                            //Dynalogic 151223 JNR >>
                            Clear(PositionText);
                            if (CompLink.pos30 <> '') then begin
                                PositionText := CompLink.pos30;
                            end;

                            if (CompLink."Position 2" <> '') then begin
                                PositionText += ' ' + CompLink."Position 2";
                            end;

                            // if (CompLink."Position 3" <> '') then begin
                            //     PositionText += ' ' + CompLink."Position 3";
                            // end;

                            //Dynalogic 151223 JNR <<

                            //Dynalogic 061123 JNR - 6401 <<

                            //Pluk antal
                            //Skal dannes på Header og så hentes pr linje 
                            //Summeres på nøgle Varenr+Position og udfyldes kun på første instans af denne nøgle
                            /*
                            Clear(DynQuantity);
                            DynQtyHolderLine.Reset;
                            DynQtyHolderLine.SetFilter(Status, '=%1', CompLink.Status);
                            DynQtyHolderLine.SetFilter(ProdOrderNo, '=%1', CompLink."Prod. Order No.");
                            DynQtyHolderLine.SetFilter(FirstLineNo, '=%1', CompLink."Line No.");
                            DynQtyHolderLine.SetFilter(ItemNo, '=%1', CompLink."Item No.");
                            if DynQtyHolderLine.findset then begin
                                DynQuantity := DynQtyHolderLine.Qty;
                            end else begin
                                DynQuantity := 0;
                            end;
                            */
                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin
                        //Dynalogic 061123 JNR - 6401 >>
                        Clear(OprTime);
                        OprTime := "Prod. Order Routing Line"."Expected Capacity Need" / 60000;
                        //Dynalogic 061123 JNR - 6401 <<
                    end;
                }

                dataitem("<Prod. Order Comment Line>"; "Prod. Order Component")
                {
                    DataItemLink = "Prod. Order No." = field("Prod. Order No.");
                    DataItemTableView = sorting(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.");

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

                        column(Comment; "Comment Line".Comment)
                        {
                        }
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    //Dynalogic 171123 JNR - 6401 >>
                    //Routing No.=FIELD(Routing No.),Routing Reference No.=FIELD(Routing Reference No.),Prod. Order No.=FIELD(Prod. Order No.),Status=FIELD(Status)
                    Clear(TotaltOprTime);
                    ProdRoutingLineFilter.Reset;
                    ProdRoutingLineFilter.SetFilter("Routing No.", '=%1', "Prod. Order Line"."Routing No.");
                    ProdRoutingLineFilter.SetFilter("Routing Reference No.", '=%1', "Prod. Order Line"."Routing Reference No.");
                    ProdRoutingLineFilter.SetFilter("Prod. Order No.", '=%1', "Prod. Order Line"."Prod. Order No.");
                    ProdRoutingLineFilter.SetFilter(Status, '=%1', "Prod. Order Line".Status);
                    if ProdRoutingLineFilter.FindSet then
                        repeat
                            TotaltOprTime += ProdRoutingLineFilter."Expected Capacity Need" / 60000;
                        until ProdRoutingLineFilter.Next = 0;

                    Clear(SerialNo);
                    Clear(FirstSerialNo);
                    Clear(LastSerialNo);
                    // ItemTracking.Reset;
                    // ItemTracking.SetFilter("Source ID", '=%1', "Prod. Order Line"."Prod. Order No.");
                    // ItemTracking.SetFilter("Source Prod. Order Line", '=%1', "Prod. Order Line"."Line No.");
                    // ItemTracking.SetFilter("Item No.", '=%1', "Prod. Order Line"."Item No.");
                    // if ItemTracking.FindSet then
                    //     repeat
                    //         if SerialNo = '' then begin
                    //             SerialNo := ItemTracking."Serial No.";
                    //         end else begin
                    //             SerialNo += ', ' + ItemTracking."Serial No.";
                    //         end;
                    //     until ItemTracking.Next = 0;
                    ItemTracking.Reset;
                    ItemTracking.SetFilter("Source ID", '=%1', "Prod. Order Line"."Prod. Order No.");
                    ItemTracking.SetFilter("Source Prod. Order Line", '=%1', "Prod. Order Line"."Line No.");
                    ItemTracking.SetFilter("Item No.", '=%1', "Prod. Order Line"."Item No.");
                    if ItemTracking.FindFirst() then begin
                        FirstSerialNo := ItemTracking."Serial No.";
                    end;

                    ItemTracking.Reset;
                    ItemTracking.SetFilter("Source ID", '=%1', "Prod. Order Line"."Prod. Order No.");
                    ItemTracking.SetFilter("Source Prod. Order Line", '=%1', "Prod. Order Line"."Line No.");
                    ItemTracking.SetFilter("Item No.", '=%1', "Prod. Order Line"."Item No.");
                    if ItemTracking.FindLast() then begin
                        LastSerialNo := ItemTracking."Serial No.";
                    end;


                    Clear(CurrentInventory);
                    Clear(ItemPlacement);
                    Item.Reset;
                    Item.SetFilter("No.", '=%1', "Prod. Order Line"."Item No.");
                    if Item.FindSet then begin
                        Item.CalcFields(Inventory);
                        CurrentInventory := Item.Inventory;
                        ItemPlacement := Item."Shelf No."
                    end;

                    Clear(Comments);
                    // ProdOrderCommentLine.Reset;
                    // ProdOrderCommentLine.SetFilter(Status, '=%1', "Prod. Order Line".Status);
                    // ProdOrderCommentLine.SetFilter("Prod. Order No.", '=%1', "Prod. Order Line"."Prod. Order No.");
                    // ProdOrderCommentLine.SetFilter("Line No.", '=%1', "Prod. Order Line"."Line No.");
                    // if ProdOrderCommentLine.FindSet then
                    //     repeat
                    //         if Comments = '' then begin
                    //             Comments := ProdOrderCommentLine.Comment;
                    //         end else begin
                    //             Comments += ' ' + ProdOrderCommentLine.Comment;
                    //         end;
                    //     until ProdOrderCommentLine.Next = 0;
                    CommentLine.Reset;
                    CommentLine.SetFilter("Table Name", '=%1', CommentLine."Table Name"::Item);
                    CommentLine.SetFilter("No.", '=%1', "Prod. Order Line"."Item No.");
                    if CommentLine.findset then
                        repeat
                            if Comments = '' then begin
                                Comments := CommentLine.Comment;
                            end else begin
                                Comments += ' ' + CommentLine.Comment;
                            end;
                        until CommentLine.Next() = 0;
                    //Dynalogic 171123 JNR - 6401 <<

                    //Dynalogic 050324 JNR >>
                    //Nøgle (Værdier indsættes på første instance)- Status,Prod order No, rute no,
                    /*
                    DynQtyHolder.Reset;
                    DynQtyHolder.SetFilter(Status, '=%1', "Prod. Order Line".Status);
                    DynQtyHolder.SetFilter(ProdOrderNo, '=%1', "Prod. Order Line"."Prod. Order No.");
                    DynQtyHolder.SetFilter(LineNo, '=%1', "Prod. Order Line"."Line No.");
                    if DynQtyHolder.findset then
                        repeat
                            DynQtyHolder.Delete();
                        until DynQtyHolder.Next() = 0;

                    ProdRouting.Reset;
                    ProdRouting.SetFilter("Routing No.", '=%1', "Prod. Order Line"."Routing No.");
                    ProdRouting.SetFilter("Routing Reference No.", '=%1', "Prod. Order Line"."Routing Reference No.");
                    ProdRouting.SetFilter("Prod. Order No.", '=%1', "Prod. Order Line"."Prod. Order No.");
                    ProdRouting.SetFilter(Status, '=%1', "Prod. Order Line".Status);
                    if ProdRouting.findset then
                        repeat
                            ProdComponents.Reset;
                            ProdComponents.SetFilter(Status, '=%1', ProdRouting.Status);
                            ProdComponents.SetFilter("Prod. Order No.", '=%1', ProdRouting."Prod. Order No.");
                            ProdComponents.SetFilter("Prod. Order Line No.", '=%1', ProdRouting."Routing Reference No.");
                            ProdComponents.SetFilter("Routing Link Code", '=%1', ProdRouting."Routing Link Code");
                            if ProdComponents.findfirst then
                                repeat
                                    DynQtyHolder.Reset;
                                    DynQtyHolder.SetFilter(Status, '=%1', ProdComponents.Status);
                                    DynQtyHolder.SetFilter(ProdOrderNo, '=%1', ProdComponents."Prod. Order No.");
                                    DynQtyHolder.SetFilter(RoutingNo, '=%1', ProdComponents."Routing Link Code");
                                    DynQtyHolder.SetFilter(ItemNo, '=%1', ProdComponents."Item No.");
                                    DynQtyHolder.SetFilter(Pos1, '=%1', ProdComponents.pos30); //ProdComponents.Position
                                    DynQtyHolder.SetFilter(Pos2, '=%1', ProdComponents."Position 2");
                                    DynQtyHolder.SetFilter(LineNo, '=%1', ProdComponents."Prod. Order Line No.");
                                    if DynQtyHolder.findset then begin
                                        //Læg antal til
                                        DynQtyHolder.Qty += ProdComponents."Expected Quantity"; //Skal ændres til det korrekte antal
                                        DynQtyHolder.Modify();
                                    end else begin
                                        //Opret linjen 
                                        DynQtyHolder.init;
                                        DynQtyHolder.Status := ProdComponents.Status;
                                        DynQtyHolder.ProdOrderNo := ProdComponents."Prod. Order No.";
                                        DynQtyHolder.RoutingNo := ProdComponents."Routing Link Code";
                                        DynQtyHolder.ItemNo := ProdComponents."Item No.";
                                        DynQtyHolder.FirstLineNo := ProdComponents."Line No.";
                                        DynQtyHolder.Pos1 := ProdComponents.pos30; //ProdComponents.Position
                                        DynQtyHolder.Pos2 := ProdComponents."Position 2";
                                        DynQtyHolder.LineNo := ProdComponents."Prod. Order Line No.";
                                        DynQtyHolder.Qty := ProdComponents."Expected Quantity"; //Skal ændres til det korrekte antal
                                        DynQtyHolder.Insert();
                                    end;
                                until ProdComponents.next = 0;
                        until ProdRouting.next = 0;
                        */
                    //Dynalogic 050324 JNR <<
                end;
            }

            trigger OnAfterGetRecord()
            var
            begin
                //Dynalogic 080324 JNR >>
                if DynPrint then begin
                    "No. Printed" := "No. Printed" + 1;
                    Modify;
                    Commit;
                end;
                //Dynalogic 080324 JNR <<
            end;

            trigger OnPreDataItem()
            var
            begin
                //Dynalogic 080324 JNR >>
                DynPrint := not CurrReport.Preview;
                //Dynalogic 080324 JNR <<
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
    }

    var
        ProductionJrnlMgt: Codeunit "Production Journal Mgt";
        CurrReportPageNoCaptLbl: label 'Side'; //Page
        PrdOdrCmptsandRtngLinsCptLbl: label 'Prod.ordre'; //Prod. Order - Components and Routing Lines
        ProductionOrderDescCaptLbl: label 'Description';
        ProdOdrLineStrtngDteCaptLbl: label 'Starting Date';
        ProdOrderLineEndgDteCaptLbl: label 'Slut Dato'; //Ending Date
        ProdOrderLineDueDateCaptLbl: label 'Forfaldsdato'; //Due Date
        DynItemShelfNo: Code[60];
        ShelfNoCaptionLbl: label 'Placering'; //Shelf No
        ItemNoCaptionLbl: label 'Varenr'; //Item No.
        QtyCaptionLbl: label 'Antal'; //Qty.
        UnitOfMeasureCaptionLbl: label 'Enhed'; //UOM
        PickedCaptionLbl: label 'Picked';
        OperationTimeCaptionLbl: label 'Opr. min.';
        Item: Record Item;
        OprTime: Decimal;
        TotaltOprTime: Decimal;
        TotalNormTime: label 'Samlet normtid:';
        ProdRoutingLineFilter: Record "Prod. Order Routing Line";
        ItemTracking: Record "Reservation Entry";
        SerialNo: Text;
        CurrentInventory: Decimal;
        ItemPlacement: Code[20];
        ProdOrderCommentLine: Record "Prod. Order Comment Line";
        Comments: Text;
        PositionText: Text;
        CommentLine: Record "Comment Line";
        FirstSerialNo: Text;
        LastSerialNo: Text;
        PickQty: Decimal;
        ProdComponents: Record "Prod. Order Component";
        ProdRouting: Record "Prod. Order Routing Line";
        DynQtyHolder: Record DynProdCompQtyHolder;
        CompShelfNo: Code[60];
        DynShelfNoCaptionLbl: label 'Placering';
        DynQtyHolderLine: Record DynProdCompQtyHolder;
        DynQuantity: Decimal;
        DynPrint: Boolean;
}

