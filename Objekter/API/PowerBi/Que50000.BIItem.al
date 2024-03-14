query 50000 BI_Item
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Item';
    EntitySetName = 'PowerBIItem';
    QueryType = API;

    elements
    {
        dataitem(item; Item)
        {
            column(no; "No.")
            {
            }
            column(no2; "No. 2")
            {
            }
            column(description; Description)
            {
            }
            column(searchDescription; "Search Description")
            {
            }
            column(description2; "Description 2")
            {
            }
            column(baseUnitOfMeasure; "Base Unit of Measure")
            {
            }
            column(priceUnitConversion; "Price Unit Conversion")
            {
            }
            column("type"; "Type")
            {
            }
            column(inventoryPostingGroup; "Inventory Posting Group")
            {
            }
            column(shelfNo; "Shelf No.")
            {
            }
            column(itemDiscGroup; "Item Disc. Group")
            {
            }
            column(allowInvoiceDisc; "Allow Invoice Disc.")
            {
            }
            column(statisticsGroup; "Statistics Group")
            {
            }
            column(commissionGroup; "Commission Group")
            {
            }
            column(unitPrice; "Unit Price")
            {
            }
            column(priceProfitCalculation; "Price/Profit Calculation")
            {
            }
            column(profit; "Profit %")
            {
            }
            column(costingMethod; "Costing Method")
            {
            }
            column(unitCost; "Unit Cost")
            {
            }
            column(standardCost; "Standard Cost")
            {
            }
            column(lastDirectCost; "Last Direct Cost")
            {
            }
            column(indirectCost; "Indirect Cost %")
            {
            }
            column(costIsAdjusted; "Cost is Adjusted")
            {
            }
            column(allowOnlineAdjustment; "Allow Online Adjustment")
            {
            }
            column(vendorNo; "Vendor No.")
            {
            }
            column(vendorItemNo; "Vendor Item No.")
            {
            }
            column(leadTimeCalculation; "Lead Time Calculation")
            {
            }
            column(reorderPoint; "Reorder Point")
            {
            }
            column(maximumInventory; "Maximum Inventory")
            {
            }
            column(reorderQuantity; "Reorder Quantity")
            {
            }
            column(alternativeItemNo; "Alternative Item No.")
            {
            }
            column(unitListPrice; "Unit List Price")
            {
            }
            column(dutyDue; "Duty Due %")
            {
            }
            column(dutyCode; "Duty Code")
            {
            }
            column(grossWeight; "Gross Weight")
            {
            }
            column(netWeight; "Net Weight")
            {
            }
            column(unitsPerParcel; "Units per Parcel")
            {
            }
            column(unitVolume; "Unit Volume")
            {
            }
            column(durability; Durability)
            {
            }
            column(freightType; "Freight Type")
            {
            }
            column(tariffNo; "Tariff No.")
            {
            }
            column(dutyUnitConversion; "Duty Unit Conversion")
            {
            }
            column(countryRegionPurchasedCode; "Country/Region Purchased Code")
            {
            }
            column(budgetQuantity; "Budget Quantity")
            {
            }
            column(budgetedAmount; "Budgeted Amount")
            {
            }
            column(budgetProfit; "Budget Profit")
            {
            }
            column(blocked; Blocked)
            {
            }
            column(costIsPostedToGL; "Cost is Posted to G/L")
            {
            }
            column(blockReason; "Block Reason")
            {
            }
            column(lastDateTimeModified; "Last DateTime Modified")
            {
            }
            column(lastDateModified; "Last Date Modified")
            {
            }
            column(lastTimeModified; "Last Time Modified")
            {
            }
            column(inventory; Inventory)
            {
            }
            column(netChange; "Net Change")
            {
            }
            column(salesQty; "Sales (Qty.)")
            {
            }
            column(salesLCY; "Sales (LCY)")
            {
            }
            column(cogsLCY; "COGS (LCY)")
            {
            }
            column(priceIncludesVAT; "Price Includes VAT")
            {
            }
            column(vatBusPostingGrPrice; "VAT Bus. Posting Gr. (Price)")
            {
            }
            column(genProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(picture; Picture)
            {
            }
            column(countryRegionOfOriginCode; "Country/Region of Origin Code")
            {
            }
            column(automaticExtTexts; "Automatic Ext. Texts")
            {
            }
            column(noSeries; "No. Series")
            {
            }
            column(taxGroupCode; "Tax Group Code")
            {
            }
            column(vatProdPostingGroup; "VAT Prod. Posting Group")
            {
            }
            column(reserve; Reserve)
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(globalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(stockoutWarning; "Stockout Warning")
            {
            }
            column(preventNegativeInventory; "Prevent Negative Inventory")
            {
            }
            column(variantMandatoryIfExists; "Variant Mandatory if Exists")
            {
            }
            column(applicationWkshUserID; "Application Wksh. User ID")
            {
            }
            column(coupledToCRM; "Coupled to CRM")
            {
            }
            column(assemblyPolicy; "Assembly Policy")
            {
            }
            column(gtin; GTIN)
            {
            }
            column(defaultDeferralTemplateCode; "Default Deferral Template Code")
            {
            }
            column(lowLevelCode; "Low-Level Code")
            {
            }
            column(lotSize; "Lot Size")
            {
            }
            column(serialNos; "Serial Nos.")
            {
            }
            column(lastUnitCostCalcDate; "Last Unit Cost Calc. Date")
            {
            }
            column(rolledUpMaterialCost; "Rolled-up Material Cost")
            {
            }
            column(rolledUpCapacityCost; "Rolled-up Capacity Cost")
            {
            }
            column(scrap; "Scrap %")
            {
            }
            column(inventoryValueZero; "Inventory Value Zero")
            {
            }
            column(discreteOrderQuantity; "Discrete Order Quantity")
            {
            }
            column(minimumOrderQuantity; "Minimum Order Quantity")
            {
            }
            column(maximumOrderQuantity; "Maximum Order Quantity")
            {
            }
            column(safetyStockQuantity; "Safety Stock Quantity")
            {
            }
            column(orderMultiple; "Order Multiple")
            {
            }
            column(safetyLeadTime; "Safety Lead Time")
            {
            }
            column(flushingMethod; "Flushing Method")
            {
            }
            column(replenishmentSystem; "Replenishment System")
            {
            }
            column(roundingPrecision; "Rounding Precision")
            {
            }
            column(salesUnitOfMeasure; "Sales Unit of Measure")
            {
            }
            column(purchUnitOfMeasure; "Purch. Unit of Measure")
            {
            }
            column(timeBucket; "Time Bucket")
            {
            }
            column(reorderingPolicy; "Reordering Policy")
            {
            }
            column(includeInventory; "Include Inventory")
            {
            }
            column(manufacturingPolicy; "Manufacturing Policy")
            {
            }
            column(reschedulingPeriod; "Rescheduling Period")
            {
            }
            column(lotAccumulationPeriod; "Lot Accumulation Period")
            {
            }
            column(dampenerPeriod; "Dampener Period")
            {
            }
            column(dampenerQuantity; "Dampener Quantity")
            {
            }
            column(overflowLevel; "Overflow Level")
            {
            }
            column(manufacturerCode; "Manufacturer Code")
            {
            }
            column(itemCategoryCode; "Item Category Code")
            {
            }
            column(createdFromNonstockItem; "Created From Nonstock Item")
            {
            }
            column(purchasingCode; "Purchasing Code")
            {
            }
            column(serviceItemGroup; "Service Item Group")
            {
            }
            column(itemTrackingCode; "Item Tracking Code")
            {
            }
            column(lotNos; "Lot Nos.")
            {
            }
            column(expirationCalculation; "Expiration Calculation")
            {
            }
            column(warehouseClassCode; "Warehouse Class Code")
            {
            }
            column(specialEquipmentCode; "Special Equipment Code")
            {
            }
            column(putAwayTemplateCode; "Put-away Template Code")
            {
            }
            column(putAwayUnitOfMeasureCode; "Put-away Unit of Measure Code")
            {
            }
            column(physInvtCountingPeriodCode; "Phys Invt Counting Period Code")
            {
            }
            column(lastCountingPeriodUpdate; "Last Counting Period Update")
            {
            }
            column(useCrossDocking; "Use Cross-Docking")
            {
            }
            column(nextCountingStartDate; "Next Counting Start Date")
            {
            }
            column(nextCountingEndDate; "Next Counting End Date")
            {
            }
            column(unitOfMeasureId; "Unit of Measure Id")
            {
            }
            column(taxGroupId; "Tax Group Id")
            {
            }
            column(salesBlocked; "Sales Blocked")
            {
            }
            column(purchasingBlocked; "Purchasing Blocked")
            {
            }
            column(itemCategoryId; "Item Category Id")
            {
            }
            column(inventoryPostingGroupId; "Inventory Posting Group Id")
            {
            }
            column(genProdPostingGroupId; "Gen. Prod. Posting Group Id")
            {
            }
            column(overReceiptCode; "Over-Receipt Code")
            {
            }
            column(naviNo; NaviNo)
            {
            }
            column(naviDescription; NaviDescription)
            {
            }
            column(altShelfNo; AltShelfNo)
            {
            }
            column(routingNo; "Routing No.")
            {
            }
            column(productionBOMNo; "Production BOM No.")
            {
            }
            column(singleLevelMaterialCost; "Single-Level Material Cost")
            {
            }
            column(singleLevelCapacityCost; "Single-Level Capacity Cost")
            {
            }
            column(singleLevelSubcontrdCost; "Single-Level Subcontrd. Cost")
            {
            }
            column(singleLevelCapOvhdCost; "Single-Level Cap. Ovhd Cost")
            {
            }
            column(singleLevelMfgOvhdCost; "Single-Level Mfg. Ovhd Cost")
            {
            }
            column(overheadRate; "Overhead Rate")
            {
            }
            column(rolledUpSubcontractedCost; "Rolled-up Subcontracted Cost")
            {
            }
            column(rolledUpMfgOvhdCost; "Rolled-up Mfg. Ovhd Cost")
            {
            }
            column(rolledUpCapOverheadCost; "Rolled-up Cap. Overhead Cost")
            {
            }
            column(planningIssuesQty; "Planning Issues (Qty.)")
            {
            }
            column(planningReceiptQty; "Planning Receipt (Qty.)")
            {
            }
            column(plannedOrderReceiptQty; "Planned Order Receipt (Qty.)")
            {
            }
            column(fpOrderReceiptQty; "FP Order Receipt (Qty.)")
            {
            }
            column(relOrderReceiptQty; "Rel. Order Receipt (Qty.)")
            {
            }
            column(planningReleaseQty; "Planning Release (Qty.)")
            {
            }
            column(plannedOrderReleaseQty; "Planned Order Release (Qty.)")
            {
            }
            column(purchReqReceiptQty; "Purch. Req. Receipt (Qty.)")
            {
            }
            column(purchReqReleaseQty; "Purch. Req. Release (Qty.)")
            {
            }
            column(orderTrackingPolicy; "Order Tracking Policy")
            {
            }
            column(prodForecastQuantityBase; "Prod. Forecast Quantity (Base)")
            {
            }
            column(qtyOnProdOrder; "Qty. on Prod. Order")
            {
            }
            column(qtyOnComponentLines; "Qty. on Component Lines")
            {
            }
            column(critical; Critical)
            {
            }
            column(commonItemNo; "Common Item No.")
            {
            }
            column(systemCreatedAt; SystemCreatedAt)
            {
            }
            column(systemCreatedBy; SystemCreatedBy)
            {
            }
            column(systemId; SystemId)
            {
            }
            column(systemModifiedAt; SystemModifiedAt)
            {
            }
            column(systemModifiedBy; SystemModifiedBy)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
