codeunit 50011 DynService
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ServItemManagement, OnBeforeCreateServItemOnSalesLineShpt, '', false, false)]

    procedure NAL_OnBeforeCreateServItemOnSalesLineShpt(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; SalesShipmentLine: Record "Sales Shipment Line"; var TempReservEntry: Record "Reservation Entry"; var TempServiceItem: Record "Service Item" temporary; var TempServiceItemComponent: Record "Service Item Component" temporary; var IsHandled: Boolean)
    var
        TrackingLinesExist: Boolean;
        x: Integer;
        ServItemWithSerialNoExist: Boolean;
        ShouldCreateServiceItem: Boolean;
        Item: Record Item;
        ServItemGr: Record "Service Item Group";
        ServItem: Record "Service Item";
        ServMgtSetup: Record "Service Mgt. Setup";
        ServHeader: Record "Service Header";
        ServInvoiceLine: Record "Service Line";
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        GLSetup: Record "General Ledger Setup";
        TempServiceItemComp: Record "Service Item Component" temporary;
        ResSkillMgt: Codeunit "Resource Skill Mgt.";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ServLogMgt: Codeunit ServLogManagement;
        ServOrderMgt: Codeunit ServOrderManagement;
        NextLineNo: Integer;
        Index: Integer;
        SalesBomRelationer: Record Serienummerrelaton;
        Text000: Label 'Do you want to create a %1?';
        Text001: Label 'Service item %1 was created. This service item does not belong to any service contract.';
        Text002: Label 'You have inserted a %1 on the selected %2.\Would you like to copy this information into the %1 field for the newly created %3?';
        Text003: Label 'Posting cannot be completed successfully. %1 %2  belongs to the %3 that requires creating service items. Check if the %4 field contains a whole number.';
        Text004: Label 'Posting cannot be completed successfully. For the items that are used to replace or create service item components, the %1 field on the %2 must contain a whole number.';
        Text005: Label 'The service item that is linked to the order has been deleted.';

    begin
        if not (SalesHeader."Document Type" in [SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice]) then
            exit;

        if (SalesLine.Type = SalesLine.Type::Item) and (SalesLine."Qty. to Ship (Base)" > 0) then begin
            Item.Get(SalesLine."No.");
            if ServItemGr.Get(Item."Service Item Group") and ServItemGr."Create Service Item" then begin
                if SalesLine."Qty. to Ship (Base)" <> Round(SalesLine."Qty. to Ship (Base)", 1) then
                    Error(
                      Text003,
                      Item.TableCaption(),
                      Item."No.",
                      ServItemGr.TableCaption(),
                      SalesLine.FieldCaption("Qty. to Ship (Base)"));

                TempReservEntry.SetRange("Item No.", SalesLine."No.");
                TempReservEntry.SetRange("Location Code", SalesLine."Location Code");
                TempReservEntry.SetRange("Variant Code", SalesLine."Variant Code");
                TempReservEntry.SetRange("Source Subtype", SalesLine."Document Type");
                TempReservEntry.SetRange("Source ID", SalesLine."Document No.");
                TempReservEntry.SetRange("Source Ref. No.", SalesLine."Line No.");
                TrackingLinesExist := TempReservEntry.FindSet();

                TempServiceItem.DeleteAll();
                TempServiceItemComp.DeleteAll();

                GLSetup.Get();
                ServMgtSetup.Get();
                ServMgtSetup.TestField("Service Item Nos.");
                for x := 1 to SalesLine."Qty. to Ship (Base)" do begin
                    Clear(ServItem);
                    ServItemWithSerialNoExist := false;
                    if TempReservEntry."Serial No." <> '' then begin
                        ServItem.SetRange("Item No.", SalesLine."No.");
                        ServItem.SetRange("Serial No.", TempReservEntry."Serial No.");
                        if ServItem.FindFirst() then
                            ServItemWithSerialNoExist := true;
                    end;
                    ShouldCreateServiceItem := (TempReservEntry."Serial No." = '') or (not ServItemWithSerialNoExist);

                    if ShouldCreateServiceItem then begin
                        ServItem.Init();
                        NoSeriesMgt.InitSeries(
                          ServMgtSetup."Service Item Nos.", ServItem."No. Series", 0D, ServItem."No.", ServItem."No. Series");
                        ServItem.Insert();
                    end;

                    IsHandled := false;

                    if not IsHandled then begin
                        //NALJHHModifyServiceItem(SalesHeader, SalesLine, SalesShipmentLine, ServItem, TrackingLinesExist);

                        Clear(TempServiceItem);
                        TempServiceItem := ServItem;
                        if TempServiceItem.Insert() then;
                        ResSkillMgt.AssignServItemResSkills(ServItem);

                        //NAL-JHHAddServiceItemComponents(SalesHeader, SalesLine, SalesShipmentLine);

                        Clear(ServLogMgt);
                        ServLogMgt.ServItemAutoCreated(ServItem);
                    end;

                    TrackingLinesExist := TempReservEntry.Next() = 1;
                end;
            end;
        end;
    end;
}
