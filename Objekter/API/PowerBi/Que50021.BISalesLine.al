query 50021 BISales_Line
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Sales_Line';
    EntitySetName = 'PowerBI_Sales_Line';
    QueryType = API;

    elements
    {
        dataitem(salesLine; "Sales Line")
        {
            column(documentType; "Document Type")
            {
            }
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
            column(workTypeCode; "Work Type Code")
            {
            }
            column(recalculateInvoiceDisc; "Recalculate Invoice Disc.")
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
            column(profit; "Profit %")
            {
            }
            column(billToCustomerNo; "Bill-to Customer No.")
            {
            }
            column(invDiscountAmount; "Inv. Discount Amount")
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
            column(taxCategory; "Tax Category")
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
            column(shippedNotInvLCYNoVAT; "Shipped Not Inv. (LCY) No VAT")
            {
            }
            column(reserve; Reserve)
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
            column(icPartnerRefType; "IC Partner Ref. Type")
            {
            }
            column(icPartnerReference; "IC Partner Reference")
            {
            }
            column(prepayment; "Prepayment %")
            {
            }
            column(prepmtLineAmount; "Prepmt. Line Amount")
            {
            }
            column(prepmtAmtInv; "Prepmt. Amt. Inv.")
            {
            }
            column(prepmtAmtInclVAT; "Prepmt. Amt. Incl. VAT")
            {
            }
            column(prepaymentAmount; "Prepayment Amount")
            {
            }
            column(prepmtVATBaseAmt; "Prepmt. VAT Base Amt.")
            {
            }
            column(prepaymentVAT; "Prepayment VAT %")
            {
            }
            column(prepmtVATCalcType; "Prepmt. VAT Calc. Type")
            {
            }
            column(prepaymentVATIdentifier; "Prepayment VAT Identifier")
            {
            }
            column(prepaymentTaxAreaCode; "Prepayment Tax Area Code")
            {
            }
            column(prepaymentTaxLiable; "Prepayment Tax Liable")
            {
            }
            column(prepaymentTaxGroupCode; "Prepayment Tax Group Code")
            {
            }
            column(prepmtAmtToDeduct; "Prepmt Amt to Deduct")
            {
            }
            column(prepmtAmtDeducted; "Prepmt Amt Deducted")
            {
            }
            column(prepaymentLine; "Prepayment Line")
            {
            }
            column(prepmtAmountInvInclVAT; "Prepmt. Amount Inv. Incl. VAT")
            {
            }
            column(prepmtAmountInvLCY; "Prepmt. Amount Inv. (LCY)")
            {
            }
            column(icPartnerCode; "IC Partner Code")
            {
            }
            column(prepmtVATAmountInvLCY; "Prepmt. VAT Amount Inv. (LCY)")
            {
            }
            column(prepaymentVATDifference; "Prepayment VAT Difference")
            {
            }
            column(prepmtVATDiffToDeduct; "Prepmt VAT Diff. to Deduct")
            {
            }
            column(prepmtVATDiffDeducted; "Prepmt VAT Diff. Deducted")
            {
            }
            column(icItemReferenceNo; "IC Item Reference No.")
            {
            }
            column(pmtDiscountAmount; "Pmt. Discount Amount")
            {
            }
            column(prepmtPmtDiscountAmount; "Prepmt. Pmt. Discount Amount")
            {
            }
            column(lineDiscountCalculation; "Line Discount Calculation")
            {
            }
            column(dimensionSetID; "Dimension Set ID")
            {
            }
            column(qtyToAssembleToOrder; "Qty. to Assemble to Order")
            {
            }
            column(qtyToAsmToOrderBase; "Qty. to Asm. to Order (Base)")
            {
            }
            column(jobTaskNo; "Job Task No.")
            {
            }
            column(jobContractEntryNo; "Job Contract Entry No.")
            {
            }
            column(deferralCode; "Deferral Code")
            {
            }
            column(returnsDeferralStartDate; "Returns Deferral Start Date")
            {
            }
            column(selectedAllocAccountNo; "Selected Alloc. Account No.")
            {
            }
            column(allocationAccountNo; "Allocation Account No.")
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
            column(qtyRoundingPrecision; "Qty. Rounding Precision")
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
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
            column(outOfStockSubstitution; "Out-of-Stock Substitution")
            {
            }
            column(originallyOrderedNo; "Originally Ordered No.")
            {
            }
            column(originallyOrderedVarCode; "Originally Ordered Var. Code")
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
            column(specialOrder; "Special Order")
            {
            }
            column(specialOrderPurchaseNo; "Special Order Purchase No.")
            {
            }
            column(specialOrderPurchLineNo; "Special Order Purch. Line No.")
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
            column(whseOutstandingQty; "Whse. Outstanding Qty.")
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
            column(outboundWhseHandlingTime; "Outbound Whse. Handling Time")
            {
            }
            column(plannedDeliveryDate; "Planned Delivery Date")
            {
            }
            column(plannedShipmentDate; "Planned Shipment Date")
            {
            }
            column(shippingAgentCode; "Shipping Agent Code")
            {
            }
            column(shippingAgentServiceCode; "Shipping Agent Service Code")
            {
            }
            column(allowItemChargeAssignment; "Allow Item Charge Assignment")
            {
            }
            column(qtyToAssign; "Qty. to Assign")
            {
            }
            column(qtyAssigned; "Qty. Assigned")
            {
            }
            column(returnQtyToReceive; "Return Qty. to Receive")
            {
            }
            column(returnQtyToReceiveBase; "Return Qty. to Receive (Base)")
            {
            }
            column(returnQtyRcdNotInvd; "Return Qty. Rcd. Not Invd.")
            {
            }
            column(retQtyRcdNotInvdBase; "Ret. Qty. Rcd. Not Invd.(Base)")
            {
            }
            column(returnRcdNotInvd; "Return Rcd. Not Invd.")
            {
            }
            column(returnRcdNotInvdLCY; "Return Rcd. Not Invd. (LCY)")
            {
            }
            column(returnQtyReceived; "Return Qty. Received")
            {
            }
            column(returnQtyReceivedBase; "Return Qty. Received (Base)")
            {
            }
            column(applFromItemEntry; "Appl.-from Item Entry")
            {
            }
            column(itemChargeQtyToHandle; "Item Charge Qty. to Handle")
            {
            }
            column(bomItemNo; "BOM Item No.")
            {
            }
            column(returnReceiptNo; "Return Receipt No.")
            {
            }
            column(returnReceiptLineNo; "Return Receipt Line No.")
            {
            }
            column(returnReasonCode; "Return Reason Code")
            {
            }
            column(copiedFromPostedDoc; "Copied From Posted Doc.")
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
            column(subtype; Subtype)
            {
            }
            column(priceDescription; "Price description")
            {
            }
            column(attachedDocCount; "Attached Doc Count")
            {
            }
            column(attachedLinesCount; "Attached Lines Count")
            {
            }
            column(dynInventory; DynInventory)
            {
            }
            column(dynProduction; DynProduction)
            {
            }
            column(dynPurchase; DynPurchase)
            {
            }
            column(dynItemDescription; DynItemDescription)
            {
            }
            column(dynCustomerName; DynCustomerName)
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
