query 50003 BIPurch_inv_Line
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'PurchInvLine';
    EntitySetName = 'PowerBI_PurchInvLine';
    QueryType = API;

    elements
    {
        dataitem(purchInvLine; "Purch. Inv. Line")
        {
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
            column(payToVendorNo; "Pay-to Vendor No.")
            {
            }
            column(invDiscountAmount; "Inv. Discount Amount")
            {
            }
            column(vendorItemNo; "Vendor Item No.")
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
            column(vatIdentifier; "VAT Identifier")
            {
            }
            column(icPartnerRefType; "IC Partner Ref. Type")
            {
            }
            column(icPartnerReference; "IC Partner Reference")
            {
            }
            column(prepaymentLine; "Prepayment Line")
            {
            }
            column(icPartnerCode; "IC Partner Code")
            {
            }
            column(postingDate; "Posting Date")
            {
            }
            column(icCrossReferenceNo; "IC Cross-Reference No.")
            {
            }
            column(pmtDiscountAmount; "Pmt. Discount Amount")
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
            column(deferralCode; "Deferral Code")
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
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(quantityBase; "Quantity (Base)")
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
            column(returnReasonCode; "Return Reason Code")
            {
            }
            column(priceCalculationMethod; "Price Calculation Method")
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
            column(prodOrderLineNo; "Prod. Order Line No.")
            {
            }
            column(overheadRate; "Overhead Rate")
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
