query 50027 BIService_Line
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Service_Line';
    EntitySetName = 'PowerBI_Service_Line';
    QueryType = API;

    elements
    {
        dataitem(serviceLine; "Service Line")
        {
            column(documentType; "Document Type")
            {
            }
            column(customerNo; "Customer No.")
            {
            }
            column(documentNo; "Document No.")
            {
            }
            column(lineNo; "Line No.")
            {
            }
            column("type"; "Type")
            {
            }
            column(no; "No.")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(postingGroup; "Posting Group")
            {
            }
            column(description; Description)
            {
            }
            column(description2; "Description 2")
            {
            }
            column(unitOfMeasure; "Unit of Measure")
            {
            }
            column(quantity; Quantity)
            {
            }
            column(outstandingQuantity; "Outstanding Quantity")
            {
            }
            column(qtyToInvoice; "Qty. to Invoice")
            {
            }
            column(qtyToShip; "Qty. to Ship")
            {
            }
            column(unitPrice; "Unit Price")
            {
            }
            column(unitCostLCY; "Unit Cost (LCY)")
            {
            }
            column(vat; "VAT %")
            {
            }
            column(lineDiscount; "Line Discount %")
            {
            }
            column(lineDiscountAmount; "Line Discount Amount")
            {
            }
            column(amount; Amount)
            {
            }
            column(amountIncludingVAT; "Amount Including VAT")
            {
            }
            column(allowInvoiceDisc; "Allow Invoice Disc.")
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
            column(applToItemEntry; "Appl.-to Item Entry")
            {
            }
            column(shortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(shortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(customerPriceGroup; "Customer Price Group")
            {
            }
            column(jobNo; "Job No.")
            {
            }
            column(jobTaskNo; "Job Task No.")
            {
            }
            column(jobLineType; "Job Line Type")
            {
            }
            column(workTypeCode; "Work Type Code")
            {
            }
            column(outstandingAmount; "Outstanding Amount")
            {
            }
            column(qtyShippedNotInvoiced; "Qty. Shipped Not Invoiced")
            {
            }
            column(shippedNotInvoiced; "Shipped Not Invoiced")
            {
            }
            column(quantityShipped; "Quantity Shipped")
            {
            }
            column(quantityInvoiced; "Quantity Invoiced")
            {
            }
            column(shipmentNo; "Shipment No.")
            {
            }
            column(shipmentLineNo; "Shipment Line No.")
            {
            }
            column(orderNo; "Order No.")
            {
            }
            column(billToCustomerNo; "Bill-to Customer No.")
            {
            }
            column(invDiscountAmount; "Inv. Discount Amount")
            {
            }
            column(genBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column(genProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(vatCalculationType; "VAT Calculation Type")
            {
            }
            column("transactionType"; "Transaction Type")
            {
            }
            column(transportMethod; "Transport Method")
            {
            }
            column(attachedToLineNo; "Attached to Line No.")
            {
            }
            column(exitPoint; "Exit Point")
            {
            }
            column("area"; "Area")
            {
            }
            column(transactionSpecification; "Transaction Specification")
            {
            }
            column(taxAreaCode; "Tax Area Code")
            {
            }
            column(taxLiable; "Tax Liable")
            {
            }
            column(taxGroupCode; "Tax Group Code")
            {
            }
            column(vatClauseCode; "VAT Clause Code")
            {
            }
            column(vatBusPostingGroup; "VAT Bus. Posting Group")
            {
            }
            column(vatProdPostingGroup; "VAT Prod. Posting Group")
            {
            }
            column(currencyCode; "Currency Code")
            {
            }
            column(outstandingAmountLCY; "Outstanding Amount (LCY)")
            {
            }
            column(shippedNotInvoicedLCY; "Shipped Not Invoiced (LCY)")
            {
            }
            column(reservedQuantity; "Reserved Quantity")
            {
            }
            column(reserve; Reserve)
            {
            }
            column(vatBaseAmount; "VAT Base Amount")
            {
            }
            column(unitCost; "Unit Cost")
            {
            }
            column(systemCreatedEntry; "System-Created Entry")
            {
            }
            column(lineAmount; "Line Amount")
            {
            }
            column(vatDifference; "VAT Difference")
            {
            }
            column(invDiscAmountToInvoice; "Inv. Disc. Amount to Invoice")
            {
            }
            column(vatIdentifier; "VAT Identifier")
            {
            }
            column(pmtDiscountAmount; "Pmt. Discount Amount")
            {
            }
            column(dimensionSetID; "Dimension Set ID")
            {
            }
            column(timeSheetNo; "Time Sheet No.")
            {
            }
            column(timeSheetLineNo; "Time Sheet Line No.")
            {
            }
            column(timeSheetDate; "Time Sheet Date")
            {
            }
            column(jobPlanningLineNo; "Job Planning Line No.")
            {
            }
            column(jobRemainingQty; "Job Remaining Qty.")
            {
            }
            column(jobRemainingQtyBase; "Job Remaining Qty. (Base)")
            {
            }
            column(jobRemainingTotalCost; "Job Remaining Total Cost")
            {
            }
            column(jobRemainingTotalCostLCY; "Job Remaining Total Cost (LCY)")
            {
            }
            column(jobRemainingLineAmount; "Job Remaining Line Amount")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(binCode; "Bin Code")
            {
            }
            column(qtyPerUnitOfMeasure; "Qty. per Unit of Measure")
            {
            }
            column(planned; Planned)
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(qtyRoundingPrecision; "Qty. Rounding Precision")
            {
            }
            column(qtyRoundingPrecisionBase; "Qty. Rounding Precision (Base)")
            {
            }
            column(quantityBase; "Quantity (Base)")
            {
            }
            column(outstandingQtyBase; "Outstanding Qty. (Base)")
            {
            }
            column(qtyToInvoiceBase; "Qty. to Invoice (Base)")
            {
            }
            column(qtyToShipBase; "Qty. to Ship (Base)")
            {
            }
            column(qtyShippedNotInvdBase; "Qty. Shipped Not Invd. (Base)")
            {
            }
            column(qtyShippedBase; "Qty. Shipped (Base)")
            {
            }
            column(qtyInvoicedBase; "Qty. Invoiced (Base)")
            {
            }
            column(reservedQtyBase; "Reserved Qty. (Base)")
            {
            }
            column(responsibilityCenter; "Responsibility Center")
            {
            }
            column(substitutionAvailable; "Substitution Available")
            {
            }
            column(itemCategoryCode; "Item Category Code")
            {
            }
            column(nonstock; Nonstock)
            {
            }
            column(whseOutstandingQtyBase; "Whse. Outstanding Qty. (Base)")
            {
            }
            column(completelyShipped; "Completely Shipped")
            {
            }
            column(requestedDeliveryDate; "Requested Delivery Date")
            {
            }
            column(promisedDeliveryDate; "Promised Delivery Date")
            {
            }
            column(shippingTime; "Shipping Time")
            {
            }
            column(plannedDeliveryDate; "Planned Delivery Date")
            {
            }
            column(shippingAgentCode; "Shipping Agent Code")
            {
            }
            column(shippingAgentServiceCode; "Shipping Agent Service Code")
            {
            }
            column(applFromItemEntry; "Appl.-from Item Entry")
            {
            }
            column(serviceItemNo; "Service Item No.")
            {
            }
            column(applToServiceEntry; "Appl.-to Service Entry")
            {
            }
            column(serviceItemLineNo; "Service Item Line No.")
            {
            }
            column(serviceItemSerialNo; "Service Item Serial No.")
            {
            }
            column(serviceItemLineDescription; "Service Item Line Description")
            {
            }
            column(servPriceAdjmtGrCode; "Serv. Price Adjmt. Gr. Code")
            {
            }
            column(postingDate; "Posting Date")
            {
            }
            column(orderDate; "Order Date")
            {
            }
            column(neededByDate; "Needed by Date")
            {
            }
            column(shipToCode; "Ship-to Code")
            {
            }
            column(qtyToConsume; "Qty. to Consume")
            {
            }
            column(quantityConsumed; "Quantity Consumed")
            {
            }
            column(qtyToConsumeBase; "Qty. to Consume (Base)")
            {
            }
            column(qtyConsumedBase; "Qty. Consumed (Base)")
            {
            }
            column(servicePriceGroupCode; "Service Price Group Code")
            {
            }
            column(faultAreaCode; "Fault Area Code")
            {
            }
            column(symptomCode; "Symptom Code")
            {
            }
            column(faultCode; "Fault Code")
            {
            }
            column(resolutionCode; "Resolution Code")
            {
            }
            column(excludeWarranty; "Exclude Warranty")
            {
            }
            column(warranty; Warranty)
            {
            }
            column(contractNo; "Contract No.")
            {
            }
            column(contractDisc; "Contract Disc. %")
            {
            }
            column(warrantyDisc; "Warranty Disc. %")
            {
            }
            column(componentLineNo; "Component Line No.")
            {
            }
            column(sparePartAction; "Spare Part Action")
            {
            }
            column(faultReasonCode; "Fault Reason Code")
            {
            }
            column(replacedItemNo; "Replaced Item No.")
            {
            }
            column(excludeContractDiscount; "Exclude Contract Discount")
            {
            }
            column(replacedItemType; "Replaced Item Type")
            {
            }
            column(priceAdjmtStatus; "Price Adjmt. Status")
            {
            }
            column(lineDiscountType; "Line Discount Type")
            {
            }
            column(copyComponentsFrom; "Copy Components From")
            {
            }
            column(returnReasonCode; "Return Reason Code")
            {
            }
            column(priceCalculationMethod; "Price Calculation Method")
            {
            }
            column(allowLineDisc; "Allow Line Disc.")
            {
            }
            column(customerDiscGroup; "Customer Disc. Group")
            {
            }
            column(qtyPicked; "Qty. Picked")
            {
            }
            column(qtyPickedBase; "Qty. Picked (Base)")
            {
            }
            column(completelyPicked; "Completely Picked")
            {
            }
            column(pickQtyBase; "Pick Qty. (Base)")
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
