query 50010 BIValue_Entry
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Value_Entry';
    EntitySetName = 'PowerBIValue_Entry';
    QueryType = API;

    elements
    {
        dataitem(valueEntry; "Value Entry")
        {
            column(entryNo; "Entry No.")
            {
            }
            column(itemNo; "Item No.")
            {
            }
            column(postingDate; "Posting Date")
            {
            }
            column(itemLedgerEntryType; "Item Ledger Entry Type")
            {
            }
            column(sourceNo; "Source No.")
            {
            }
            column(documentNo; "Document No.")
            {
            }
            column(description; Description)
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(inventoryPostingGroup; "Inventory Posting Group")
            {
            }
            column(sourcePostingGroup; "Source Posting Group")
            {
            }
            column(itemLedgerEntryNo; "Item Ledger Entry No.")
            {
            }
            column(valuedQuantity; "Valued Quantity")
            {
            }
            column(itemLedgerEntryQuantity; "Item Ledger Entry Quantity")
            {
            }
            column(invoicedQuantity; "Invoiced Quantity")
            {
            }
            column(costPerUnit; "Cost per Unit")
            {
            }
            column(salesAmountActual; "Sales Amount (Actual)")
            {
            }
            column(salespersPurchCode; "Salespers./Purch. Code")
            {
            }
            column(discountAmount; "Discount Amount")
            {
            }
            column(userID; "User ID")
            {
            }
            column(sourceCode; "Source Code")
            {
            }
            column(appliesToEntry; "Applies-to Entry")
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(globalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(sourceType; "Source Type")
            {
            }
            column(costAmountActual; "Cost Amount (Actual)")
            {
            }
            column(costPostedToGL; "Cost Posted to G/L")
            {
            }
            column(reasonCode; "Reason Code")
            {
            }
            column(dropShipment; "Drop Shipment")
            {
            }
            column(journalBatchName; "Journal Batch Name")
            {
            }
            column(genBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column(genProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(documentDate; "Document Date")
            {
            }
            column(externalDocumentNo; "External Document No.")
            {
            }
            column(costAmountActualACY; "Cost Amount (Actual) (ACY)")
            {
            }
            column(costPostedToGLACY; "Cost Posted to G/L (ACY)")
            {
            }
            column(costPerUnitACY; "Cost per Unit (ACY)")
            {
            }
            column(documentType; "Document Type")
            {
            }
            column(documentLineNo; "Document Line No.")
            {
            }
            column(vatReportingDate; "VAT Reporting Date")
            {
            }
            column(orderType; "Order Type")
            {
            }
            column(orderNo; "Order No.")
            {
            }
            column(orderLineNo; "Order Line No.")
            {
            }
            column(expectedCost; "Expected Cost")
            {
            }
            column(itemChargeNo; "Item Charge No.")
            {
            }
            column(valuedByAverageCost; "Valued By Average Cost")
            {
            }
            column(partialRevaluation; "Partial Revaluation")
            {
            }
            column(inventoriable; Inventoriable)
            {
            }
            column(valuationDate; "Valuation Date")
            {
            }
            column(entryType; "Entry Type")
            {
            }
            column(varianceType; "Variance Type")
            {
            }
            column(purchaseAmountActual; "Purchase Amount (Actual)")
            {
            }
            column(purchaseAmountExpected; "Purchase Amount (Expected)")
            {
            }
            column(salesAmountExpected; "Sales Amount (Expected)")
            {
            }
            column(costAmountExpected; "Cost Amount (Expected)")
            {
            }
            column(costAmountNonInvtbl; "Cost Amount (Non-Invtbl.)")
            {
            }
            column(costAmountExpectedACY; "Cost Amount (Expected) (ACY)")
            {
            }
            column(costAmountNonInvtblACY; "Cost Amount (Non-Invtbl.)(ACY)")
            {
            }
            column(expectedCostPostedToGL; "Expected Cost Posted to G/L")
            {
            }
            column(expCostPostedToGLACY; "Exp. Cost Posted to G/L (ACY)")
            {
            }
            column(dimensionSetID; "Dimension Set ID")
            {
            }
            column(shortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(shortcutDimension4Code; "Shortcut Dimension 4 Code")
            {
            }
            column(shortcutDimension5Code; "Shortcut Dimension 5 Code")
            {
            }
            column(shortcutDimension6Code; "Shortcut Dimension 6 Code")
            {
            }
            column(shortcutDimension7Code; "Shortcut Dimension 7 Code")
            {
            }
            column(shortcutDimension8Code; "Shortcut Dimension 8 Code")
            {
            }
            column(jobNo; "Job No.")
            {
            }
            column(jobTaskNo; "Job Task No.")
            {
            }
            column(jobLedgerEntryNo; "Job Ledger Entry No.")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(adjustment; Adjustment)
            {
            }
            column(averageCostException; "Average Cost Exception")
            {
            }
            column(capacityLedgerEntryNo; "Capacity Ledger Entry No.")
            {
            }
            column("type"; "Type")
            {
            }
            column(no; "No.")
            {
            }
            column(returnReasonCode; "Return Reason Code")
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
