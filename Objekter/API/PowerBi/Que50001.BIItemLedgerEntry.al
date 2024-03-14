query 50001 BI_ItemLedgerEntry
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'ItemLedgerEntry';
    EntitySetName = 'PowerBIItemLedgerEntry';
    QueryType = API;

    elements
    {
        dataitem(itemLedgerEntry; "Item Ledger Entry")
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
            column(entryType; "Entry Type")
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
            column(quantity; Quantity)
            {
            }
            column(remainingQuantity; "Remaining Quantity")
            {
            }
            column(invoicedQuantity; "Invoiced Quantity")
            {
            }
            column(appliesToEntry; "Applies-to Entry")
            {
            }
            column(open; Open)
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(globalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(positive; Positive)
            {
            }
            column(shptMethodCode; "Shpt. Method Code")
            {
            }
            column(sourceType; "Source Type")
            {
            }
            column(dropShipment; "Drop Shipment")
            {
            }
            column("transactionType"; "Transaction Type")
            {
            }
            column(transportMethod; "Transport Method")
            {
            }
            column(countryRegionCode; "Country/Region Code")
            {
            }
            column(entryExitPoint; "Entry/Exit Point")
            {
            }
            column(documentDate; "Document Date")
            {
            }
            column(externalDocumentNo; "External Document No.")
            {
            }
            column("area"; "Area")
            {
            }
            column(transactionSpecification; "Transaction Specification")
            {
            }
            column(noSeries; "No. Series")
            {
            }
            column(documentType; "Document Type")
            {
            }
            column(documentLineNo; "Document Line No.")
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
            column(dimensionSetID; "Dimension Set ID")
            {
            }
            column(assembleToOrder; "Assemble to Order")
            {
            }
            column(jobNo; "Job No.")
            {
            }
            column(jobTaskNo; "Job Task No.")
            {
            }
            column(jobPurchase; "Job Purchase")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(qtyPerUnitOfMeasure; "Qty. per Unit of Measure")
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(derivedFromBlanketOrder; "Derived from Blanket Order")
            {
            }
            column(originallyOrderedNo; "Originally Ordered No.")
            {
            }
            column(originallyOrderedVarCode; "Originally Ordered Var. Code")
            {
            }
            column(outOfStockSubstitution; "Out-of-Stock Substitution")
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
            column(completelyInvoiced; "Completely Invoiced")
            {
            }
            column(lastInvoiceDate; "Last Invoice Date")
            {
            }
            column(appliedEntryToAdjust; "Applied Entry to Adjust")
            {
            }
            column(correction; Correction)
            {
            }
            column(shippedQtyNotReturned; "Shipped Qty. Not Returned")
            {
            }
            column(prodOrderCompLineNo; "Prod. Order Comp. Line No.")
            {
            }
            column(serialNo; "Serial No.")
            {
            }
            column(lotNo; "Lot No.")
            {
            }
            column(warrantyDate; "Warranty Date")
            {
            }
            column(expirationDate; "Expiration Date")
            {
            }
            column(itemTracking; "Item Tracking")
            {
            }
            column(packageNo; "Package No.")
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
