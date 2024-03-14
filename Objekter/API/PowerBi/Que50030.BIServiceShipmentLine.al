query 50030 BIService_Shipment_Line
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Service_Shipment_Line';
    EntitySetName = 'PowerBI_Service_Shipment_Line';
    QueryType = API;

    elements
    {
        dataitem(serviceShipmentLine; "Service Shipment Line")
        {
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
            column(itemShptEntryNo; "Item Shpt. Entry No.")
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
            column(workTypeCode; "Work Type Code")
            {
            }
            column(qtyShippedNotInvoiced; "Qty. Shipped Not Invoiced")
            {
            }
            column(quantityInvoiced; "Quantity Invoiced")
            {
            }
            column(orderNo; "Order No.")
            {
            }
            column(orderLineNo; "Order Line No.")
            {
            }
            column(billToCustomerNo; "Bill-to Customer No.")
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
            column(vatBusPostingGroup; "VAT Bus. Posting Group")
            {
            }
            column(vatProdPostingGroup; "VAT Prod. Posting Group")
            {
            }
            column(currencyCode; "Currency Code")
            {
            }
            column(vatBaseAmount; "VAT Base Amount")
            {
            }
            column(unitCost; "Unit Cost")
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
            column(variantCode; "Variant Code")
            {
            }
            column(binCode; "Bin Code")
            {
            }
            column(qtyPerUnitOfMeasure; "Qty. per Unit of Measure")
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(quantityBase; "Quantity (Base)")
            {
            }
            column(qtyShippedNotInvdBase; "Qty. Shipped Not Invd. (Base)")
            {
            }
            column(qtyInvoicedBase; "Qty. Invoiced (Base)")
            {
            }
            column(responsibilityCenter; "Responsibility Center")
            {
            }
            column(itemCategoryCode; "Item Category Code")
            {
            }
            column(nonstock; Nonstock)
            {
            }
            column(correction; Correction)
            {
            }
            column(applToWarrantyEntry; "Appl.-to Warranty Entry")
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
            column(quantityConsumed; "Quantity Consumed")
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
