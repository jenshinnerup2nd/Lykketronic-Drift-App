codeunit 50005 NALProduction
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Prod. Order Status Management", OnAfterToProdOrderLineModify, '', false, false)]
    procedure NAL_OnAfterToProdOrderModify(var FromProdOrderLine: Record "Prod. Order Line"; var ToProdOrderLine: Record "Prod. Order Line"; var NewStatus: Option);
    var
    begin
        if NewStatus = ToProdOrderLine.Status::Released then begin
            ToProdOrderLine."Planning Flexibility" := ToProdOrderLine."Planning Flexibility"::None;
            ToProdOrderLine.Modify(true);
        end
    end;

    [EventSubscriber(ObjectType::Page, Page::"Production Journal", OnAfterSetFilterGroup, '', false, false)]

    procedure NAL_OnAfterSetFilterGroup(var ItemJournalLine: Record "Item Journal Line");
    var

    begin
        ItemJournalLine.SetRange("Flushing Method");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Production Journal Mgt", OnInsertOutputItemJnlLineOnAfterAssignTimes, '', false, false)]
    procedure NAL_OnInsertOutputItemJnlLineOnAfterAssignTimes(ProdOrderLine: Record "Prod. Order Line"; ProdOrderRoutingLine: Record "Prod. Order Routing Line"; var QtyToPost: Decimal);
    var
        CostCalcMgt: Codeunit "Cost Calculation Management";
    begin

        IF ProdOrderRoutingLine."Prod. Order No." <> '' THEN BEGIN
            QtyToPost :=
              CostCalcMgt.CalcQtyAdjdForRoutingScrap(
                ProdOrderLine."Quantity (Base)",
                ProdOrderRoutingLine."Scrap Factor % (Accumulated)",
                ProdOrderRoutingLine."Fixed Scrap Qty. (Accum.)") -
              CostCalcMgt.CalcActOutputQtyBase(ProdOrderLine, ProdOrderRoutingLine);
            QtyToPost := QtyToPost / ProdOrderLine."Qty. per Unit of Measure";
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Production Journal Mgt", OnBeforeInsertOutputJnlLine, '', false, false)]
    procedure NAL_OnBeforeInsertOutputItemJnlLine(ProdOrderLine: Record "Prod. Order Line"; ProdOrderRtngLine: Record "Prod. Order Routing Line"; var ItemJournalLine: Record "Item Journal Line");
    var
    begin
        ItemJournalLine.VALIDATE("Setup Time", ProdOrderRtngLine."Setup Time");
        ItemJournalLine.VALIDATE("Run Time", ProdOrderRtngLine."Run Time" * ItemJournalLine."Output Quantity");
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Calculate Prod. Order", OnTransferBOMProcessItemOnBeforeGetPlanningParameters, '', false, false)]

    procedure NAL_OnTransferBOMItemOnBeforeGetPlanning(var ProdOrderComponent: Record "Prod. Order Component"; ProductionBOMLine: Record "Production BOM Line")
    var
    begin
        ProdOrderComponent.pos30 := ProductionBOMLine.pos30
    end;

}

