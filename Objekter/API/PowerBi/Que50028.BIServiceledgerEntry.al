query 50028 BIService_ledger_Entry
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Service_ledger_Entry';
    EntitySetName = 'PowerBI_Service_ledger_Entry';
    QueryType = API;

    elements
    {
        dataitem(serviceLedgerEntry; "Service Ledger Entry")
        {
            column(entryNo; "Entry No.")
            {
            }
            column(serviceContractNo; "Service Contract No.")
            {
            }
            column(documentType; "Document Type")
            {
            }
            column(documentNo; "Document No.")
            {
            }
            column(servContractAccGrCode; "Serv. Contract Acc. Gr. Code")
            {
            }
            column(documentLineNo; "Document Line No.")
            {
            }
            column(movedFromPrepaidAcc; "Moved from Prepaid Acc.")
            {
            }
            column(postingDate; "Posting Date")
            {
            }
            column(amountLCY; "Amount (LCY)")
            {
            }
            column(customerNo; "Customer No.")
            {
            }
            column(shipToCode; "Ship-to Code")
            {
            }
            column(itemNoServiced; "Item No. (Serviced)")
            {
            }
            column(serialNoServiced; "Serial No. (Serviced)")
            {
            }
            column(userID; "User ID")
            {
            }
            column(contractInvoicePeriod; "Contract Invoice Period")
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(globalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(serviceItemNoServiced; "Service Item No. (Serviced)")
            {
            }
            column(variantCodeServiced; "Variant Code (Serviced)")
            {
            }
            column(contractGroupCode; "Contract Group Code")
            {
            }
            column("type"; "Type")
            {
            }
            column(no; "No.")
            {
            }
            column(costAmount; "Cost Amount")
            {
            }
            column(discountAmount; "Discount Amount")
            {
            }
            column(unitCost; "Unit Cost")
            {
            }
            column(quantity; Quantity)
            {
            }
            column(chargedQty; "Charged Qty.")
            {
            }
            column(unitPrice; "Unit Price")
            {
            }
            column(discount; "Discount %")
            {
            }
            column(contractDiscAmount; "Contract Disc. Amount")
            {
            }
            column(billToCustomerNo; "Bill-to Customer No.")
            {
            }
            column(faultReasonCode; "Fault Reason Code")
            {
            }
            column(description; Description)
            {
            }
            column(serviceOrderType; "Service Order Type")
            {
            }
            column(serviceOrderNo; "Service Order No.")
            {
            }
            column(jobNo; "Job No.")
            {
            }
            column(genBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column(genProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(workTypeCode; "Work Type Code")
            {
            }
            column(binCode; "Bin Code")
            {
            }
            column(responsibilityCenter; "Responsibility Center")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(entryType; "Entry Type")
            {
            }
            column(open; Open)
            {
            }
            column(servPriceAdjmtGrCode; "Serv. Price Adjmt. Gr. Code")
            {
            }
            column(servicePriceGroupCode; "Service Price Group Code")
            {
            }
            column(prepaid; Prepaid)
            {
            }
            column(applyUntilEntryNo; "Apply Until Entry No.")
            {
            }
            column(appliesToEntryNo; "Applies-to Entry No.")
            {
            }
            column(amount; Amount)
            {
            }
            column(jobTaskNo; "Job Task No.")
            {
            }
            column(jobLineType; "Job Line Type")
            {
            }
            column(jobPosted; "Job Posted")
            {
            }
            column(dimensionSetID; "Dimension Set ID")
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
