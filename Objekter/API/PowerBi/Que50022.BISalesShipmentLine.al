query 50022 BISales_Shipment_Line
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Sales_Shipment_Line';
    EntitySetName = 'PowerBI_Sales_Shipment_Line';
    QueryType = API;

    elements
    {
        dataitem(salesShipmentLine; "Sales Shipment Line")
        {
            column(sellToCustomerNo; "Sell-to Customer No.")
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
            column(shipmentDate; "Shipment Date")
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
            column(jobNo; "Job No.")
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
            column(purchaseOrderNo; "Purchase Order No.")
            {
            }
            column(purchOrderLineNo; "Purch. Order Line No.")
            {
            }
            column(dropShipment; "Drop Shipment")
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
            column(blanketOrderNo; "Blanket Order No.")
            {
            }
            column(blanketOrderLineNo; "Blanket Order Line No.")
            {
            }
            column(vatBaseAmount; "VAT Base Amount")
            {
            }
            column(unitCost; "Unit Cost")
            {
            }
            column(icPartnerRefType; "IC Partner Ref. Type")
            {
            }
            column(icPartnerReference; "IC Partner Reference")
            {
            }
            column(postingDate; "Posting Date")
            {
            }
            column(icItemReferenceNo; "IC Item Reference No.")
            {
            }
            column(dimensionSetID; "Dimension Set ID")
            {
            }
            column(authorizedForCreditCard; "Authorized for Credit Card")
            {
            }
            column(jobTaskNo; "Job Task No.")
            {
            }
            column(jobContractEntryNo; "Job Contract Entry No.")
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
            column(qtyInvoicedBase; "Qty. Invoiced (Base)")
            {
            }
            column(faPostingDate; "FA Posting Date")
            {
            }
            column(depreciationBookCode; "Depreciation Book Code")
            {
            }
            column(deprUntilFAPostingDate; "Depr. until FA Posting Date")
            {
            }
            column(duplicateInDepreciationBook; "Duplicate in Depreciation Book")
            {
            }
            column(useDuplicationList; "Use Duplication List")
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
            column(purchasingCode; "Purchasing Code")
            {
            }
            column(itemReferenceNo; "Item Reference No.")
            {
            }
            column(itemReferenceUnitOfMeasure; "Item Reference Unit of Measure")
            {
            }
            column(itemReferenceType; "Item Reference Type")
            {
            }
            column(itemReferenceTypeNo; "Item Reference Type No.")
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
            column(outboundWhseHandlingTime; "Outbound Whse. Handling Time")
            {
            }
            column(plannedDeliveryDate; "Planned Delivery Date")
            {
            }
            column(plannedShipmentDate; "Planned Shipment Date")
            {
            }
            column(applFromItemEntry; "Appl.-from Item Entry")
            {
            }
            column(itemChargeBaseAmount; "Item Charge Base Amount")
            {
            }
            column(correction; Correction)
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
            column(documentId; "Document Id")
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
