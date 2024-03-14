query 50006 BIPurchase_Line
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Purchase_Line';
    EntitySetName = 'PowerBI_Purchase_Line';
    QueryType = API;

    elements
    {
        dataitem(purchaseLine; "Purchase Line")
        {
            column(documentType; "Document Type")
            {
            }
            column(buyFromVendorNo; "Buy-from Vendor No.")
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
            column(expectedReceiptDate; "Expected Receipt Date")
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
            column(qtyToReceive; "Qty. to Receive")
            {
            }
            column(directUnitCost; "Direct Unit Cost")
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
            column(unitPriceLCY; "Unit Price (LCY)")
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
            column(jobNo; "Job No.")
            {
            }
            column(indirectCost; "Indirect Cost %")
            {
            }
            column(recalculateInvoiceDisc; "Recalculate Invoice Disc.")
            {
            }
            column(outstandingAmount; "Outstanding Amount")
            {
            }
            column(qtyRcdNotInvoiced; "Qty. Rcd. Not Invoiced")
            {
            }
            column(amtRcdNotInvoiced; "Amt. Rcd. Not Invoiced")
            {
            }
            column(quantityReceived; "Quantity Received")
            {
            }
            column(quantityInvoiced; "Quantity Invoiced")
            {
            }
            column(receiptNo; "Receipt No.")
            {
            }
            column(receiptLineNo; "Receipt Line No.")
            {
            }
            column(orderNo; "Order No.")
            {
            }
            column(orderLineNo; "Order Line No.")
            {
            }
            column(profit; "Profit %")
            {
            }
            column(payToVendorNo; "Pay-to Vendor No.")
            {
            }
            column(invDiscountAmount; "Inv. Discount Amount")
            {
            }
            column(vendorItemNo; "Vendor Item No.")
            {
            }
            column(salesOrderNo; "Sales Order No.")
            {
            }
            column(salesOrderLineNo; "Sales Order Line No.")
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
            column(entryPoint; "Entry Point")
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
            column(useTax; "Use Tax")
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
            column(amtRcdNotInvoicedLCY; "Amt. Rcd. Not Invoiced (LCY)")
            {
            }
            column(reservedQuantity; "Reserved Quantity")
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
            column(outstandingAmtExVATLCY; "Outstanding Amt. Ex. VAT (LCY)")
            {
            }
            column(aRcdNotInvExVATLCY; "A. Rcd. Not Inv. Ex. VAT (LCY)")
            {
            }
            column(pmtDiscountAmount; "Pmt. Discount Amount")
            {
            }
            column(prepmtPmtDiscountAmount; "Prepmt. Pmt. Discount Amount")
            {
            }
            column(dimensionSetID; "Dimension Set ID")
            {
            }
            column(jobTaskNo; "Job Task No.")
            {
            }
            column(jobLineType; "Job Line Type")
            {
            }
            column(jobUnitPrice; "Job Unit Price")
            {
            }
            column(jobTotalPrice; "Job Total Price")
            {
            }
            column(jobLineAmount; "Job Line Amount")
            {
            }
            column(jobLineDiscountAmount; "Job Line Discount Amount")
            {
            }
            column(jobLineDiscount; "Job Line Discount %")
            {
            }
            column(jobUnitPriceLCY; "Job Unit Price (LCY)")
            {
            }
            column(jobTotalPriceLCY; "Job Total Price (LCY)")
            {
            }
            column(jobLineAmountLCY; "Job Line Amount (LCY)")
            {
            }
            column(jobLineDiscAmountLCY; "Job Line Disc. Amount (LCY)")
            {
            }
            column(jobCurrencyFactor; "Job Currency Factor")
            {
            }
            column(jobCurrencyCode; "Job Currency Code")
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
            column(deferralCode; "Deferral Code")
            {
            }
            column(returnsDeferralStartDate; "Returns Deferral Start Date")
            {
            }
            column(selectedAllocAccountNo; "Selected Alloc. Account No.")
            {
            }
            column(allocAccModifiedByUser; "Alloc. Acc. Modified by User")
            {
            }
            column(allocationAccountNo; "Allocation Account No.")
            {
            }
            column(prodOrderNo; "Prod. Order No.")
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
            column(qtyRoundingPrecision; "Qty. Rounding Precision")
            {
            }
            column(qtyRoundingPrecisionBase; "Qty. Rounding Precision (Base)")
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
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
            column(qtyToReceiveBase; "Qty. to Receive (Base)")
            {
            }
            column(qtyRcdNotInvoicedBase; "Qty. Rcd. Not Invoiced (Base)")
            {
            }
            column(qtyReceivedBase; "Qty. Received (Base)")
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
            column(faPostingType; "FA Posting Type")
            {
            }
            column(depreciationBookCode; "Depreciation Book Code")
            {
            }
            column(salvageValue; "Salvage Value")
            {
            }
            column(deprUntilFAPostingDate; "Depr. until FA Posting Date")
            {
            }
            column(deprAcquisitionCost; "Depr. Acquisition Cost")
            {
            }
            column(maintenanceCode; "Maintenance Code")
            {
            }
            column(insuranceNo; "Insurance No.")
            {
            }
            column(budgetedFANo; "Budgeted FA No.")
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
            column(specialOrder; "Special Order")
            {
            }
            column(specialOrderSalesNo; "Special Order Sales No.")
            {
            }
            column(specialOrderSalesLineNo; "Special Order Sales Line No.")
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
            column(whseOutstandingQtyBase; "Whse. Outstanding Qty. (Base)")
            {
            }
            column(completelyReceived; "Completely Received")
            {
            }
            column(requestedReceiptDate; "Requested Receipt Date")
            {
            }
            column(promisedReceiptDate; "Promised Receipt Date")
            {
            }
            column(leadTimeCalculation; "Lead Time Calculation")
            {
            }
            column(inboundWhseHandlingTime; "Inbound Whse. Handling Time")
            {
            }
            column(plannedReceiptDate; "Planned Receipt Date")
            {
            }
            column(orderDate; "Order Date")
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
            column(returnQtyToShip; "Return Qty. to Ship")
            {
            }
            column(returnQtyToShipBase; "Return Qty. to Ship (Base)")
            {
            }
            column(returnQtyShippedNotInvd; "Return Qty. Shipped Not Invd.")
            {
            }
            column(retQtyShpdNotInvdBase; "Ret. Qty. Shpd Not Invd.(Base)")
            {
            }
            column(returnShpdNotInvd; "Return Shpd. Not Invd.")
            {
            }
            column(returnShpdNotInvdLCY; "Return Shpd. Not Invd. (LCY)")
            {
            }
            column(returnQtyShipped; "Return Qty. Shipped")
            {
            }
            column(returnQtyShippedBase; "Return Qty. Shipped (Base)")
            {
            }
            column(itemChargeQtyToHandle; "Item Charge Qty. to Handle")
            {
            }
            column(nonDeductibleVAT; "Non-Deductible VAT %")
            {
            }
            column(nonDeductibleVATBase; "Non-Deductible VAT Base")
            {
            }
            column(nonDeductibleVATAmount; "Non-Deductible VAT Amount")
            {
            }
            column(nonDeductibleVATDiff; "Non-Deductible VAT Diff.")
            {
            }
            column(prepmtNonDeductVATBase; "Prepmt. Non-Deduct. VAT Base")
            {
            }
            column(prepmtNonDeductVATAmount; "Prepmt. Non-Deduct. VAT Amount")
            {
            }
            column(returnShipmentNo; "Return Shipment No.")
            {
            }
            column(returnShipmentLineNo; "Return Shipment Line No.")
            {
            }
            column(returnReasonCode; "Return Reason Code")
            {
            }
            column(subtype; Subtype)
            {
            }
            column(copiedFromPostedDoc; "Copied From Posted Doc.")
            {
            }
            column(priceCalculationMethod; "Price Calculation Method")
            {
            }
            column(attachedDocCount; "Attached Doc Count")
            {
            }
            column(attachedLinesCount; "Attached Lines Count")
            {
            }
            column(overReceiptQuantity; "Over-Receipt Quantity")
            {
            }
            column(overReceiptCode; "Over-Receipt Code")
            {
            }
            column(overReceiptApprovalStatus; "Over-Receipt Approval Status")
            {
            }
            column(routingNo; "Routing No.")
            {
            }
            column(operationNo; "Operation No.")
            {
            }
            column(workCenterNo; "Work Center No.")
            {
            }
            column(finished; Finished)
            {
            }
            column(prodOrderLineNo; "Prod. Order Line No.")
            {
            }
            column(overheadRate; "Overhead Rate")
            {
            }
            column(mpsOrder; "MPS Order")
            {
            }
            column(planningFlexibility; "Planning Flexibility")
            {
            }
            column(safetyLeadTime; "Safety Lead Time")
            {
            }
            column(routingReferenceNo; "Routing Reference No.")
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
