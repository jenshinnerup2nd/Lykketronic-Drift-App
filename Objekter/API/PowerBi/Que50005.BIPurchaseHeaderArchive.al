query 50005 BIPurchase_Header_Archive
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Purchase_Header_Archive';
    EntitySetName = 'PowerBI_Purchase_Header_Archive';
    QueryType = API;

    elements
    {
        dataitem(purchaseHeaderArchive; "Purchase Header Archive")
        {
            column(documentType; "Document Type")
            {
            }
            column(buyFromVendorNo; "Buy-from Vendor No.")
            {
            }
            column(no; "No.")
            {
            }
            column(payToVendorNo; "Pay-to Vendor No.")
            {
            }
            column(payToName; "Pay-to Name")
            {
            }
            column(payToName2; "Pay-to Name 2")
            {
            }
            column(payToAddress; "Pay-to Address")
            {
            }
            column(payToAddress2; "Pay-to Address 2")
            {
            }
            column(payToCity; "Pay-to City")
            {
            }
            column(payToContact; "Pay-to Contact")
            {
            }
            column(yourReference; "Your Reference")
            {
            }
            column(shipToCode; "Ship-to Code")
            {
            }
            column(shipToName; "Ship-to Name")
            {
            }
            column(shipToName2; "Ship-to Name 2")
            {
            }
            column(shipToAddress; "Ship-to Address")
            {
            }
            column(shipToAddress2; "Ship-to Address 2")
            {
            }
            column(shipToCity; "Ship-to City")
            {
            }
            column(shipToContact; "Ship-to Contact")
            {
            }
            column(orderDate; "Order Date")
            {
            }
            column(postingDate; "Posting Date")
            {
            }
            column(expectedReceiptDate; "Expected Receipt Date")
            {
            }
            column(postingDescription; "Posting Description")
            {
            }
            column(paymentTermsCode; "Payment Terms Code")
            {
            }
            column(dueDate; "Due Date")
            {
            }
            column(paymentDiscount; "Payment Discount %")
            {
            }
            column(pmtDiscountDate; "Pmt. Discount Date")
            {
            }
            column(shipmentMethodCode; "Shipment Method Code")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(shortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(shortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(vendorPostingGroup; "Vendor Posting Group")
            {
            }
            column(currencyCode; "Currency Code")
            {
            }
            column(currencyFactor; "Currency Factor")
            {
            }
            column(pricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(invoiceDiscCode; "Invoice Disc. Code")
            {
            }
            column(languageCode; "Language Code")
            {
            }
            column(formatRegion; "Format Region")
            {
            }
            column(purchaserCode; "Purchaser Code")
            {
            }
            column(orderClass; "Order Class")
            {
            }
            column(comment; Comment)
            {
            }
            column(noPrinted; "No. Printed")
            {
            }
            column(onHold; "On Hold")
            {
            }
            column(appliesToDocType; "Applies-to Doc. Type")
            {
            }
            column(appliesToDocNo; "Applies-to Doc. No.")
            {
            }
            column(balAccountNo; "Bal. Account No.")
            {
            }
            column(receive; Receive)
            {
            }
            column(invoice; Invoice)
            {
            }
            column(amount; Amount)
            {
            }
            column(amountIncludingVAT; "Amount Including VAT")
            {
            }
            column(receivingNo; "Receiving No.")
            {
            }
            column(postingNo; "Posting No.")
            {
            }
            column(lastReceivingNo; "Last Receiving No.")
            {
            }
            column(lastPostingNo; "Last Posting No.")
            {
            }
            column(vendorOrderNo; "Vendor Order No.")
            {
            }
            column(vendorShipmentNo; "Vendor Shipment No.")
            {
            }
            column(vendorInvoiceNo; "Vendor Invoice No.")
            {
            }
            column(vendorCrMemoNo; "Vendor Cr. Memo No.")
            {
            }
            column(vatRegistrationNo; "VAT Registration No.")
            {
            }
            column(sellToCustomerNo; "Sell-to Customer No.")
            {
            }
            column(reasonCode; "Reason Code")
            {
            }
            column(genBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column("transactionType"; "Transaction Type")
            {
            }
            column(transportMethod; "Transport Method")
            {
            }
            column(vatCountryRegionCode; "VAT Country/Region Code")
            {
            }
            column(buyFromVendorName; "Buy-from Vendor Name")
            {
            }
            column(buyFromVendorName2; "Buy-from Vendor Name 2")
            {
            }
            column(buyFromAddress; "Buy-from Address")
            {
            }
            column(buyFromAddress2; "Buy-from Address 2")
            {
            }
            column(buyFromCity; "Buy-from City")
            {
            }
            column(buyFromContact; "Buy-from Contact")
            {
            }
            column(payToPostCode; "Pay-to Post Code")
            {
            }
            column(payToCounty; "Pay-to County")
            {
            }
            column(payToCountryRegionCode; "Pay-to Country/Region Code")
            {
            }
            column(buyFromPostCode; "Buy-from Post Code")
            {
            }
            column(buyFromCounty; "Buy-from County")
            {
            }
            column(buyFromCountryRegionCode; "Buy-from Country/Region Code")
            {
            }
            column(shipToPostCode; "Ship-to Post Code")
            {
            }
            column(shipToCounty; "Ship-to County")
            {
            }
            column(shipToCountryRegionCode; "Ship-to Country/Region Code")
            {
            }
            column(balAccountType; "Bal. Account Type")
            {
            }
            column(orderAddressCode; "Order Address Code")
            {
            }
            column(entryPoint; "Entry Point")
            {
            }
            column(correction; Correction)
            {
            }
            column(documentDate; "Document Date")
            {
            }
            column("area"; "Area")
            {
            }
            column(transactionSpecification; "Transaction Specification")
            {
            }
            column(paymentMethodCode; "Payment Method Code")
            {
            }
            column(noSeries; "No. Series")
            {
            }
            column(postingNoSeries; "Posting No. Series")
            {
            }
            column(receivingNoSeries; "Receiving No. Series")
            {
            }
            column(taxAreaCode; "Tax Area Code")
            {
            }
            column(taxLiable; "Tax Liable")
            {
            }
            column(vatBusPostingGroup; "VAT Bus. Posting Group")
            {
            }
            column(appliesToID; "Applies-to ID")
            {
            }
            column(vatBaseDiscount; "VAT Base Discount %")
            {
            }
            column(status; Status)
            {
            }
            column(invoiceDiscountCalculation; "Invoice Discount Calculation")
            {
            }
            column(invoiceDiscountValue; "Invoice Discount Value")
            {
            }
            column(sendICDocument; "Send IC Document")
            {
            }
            column(icStatus; "IC Status")
            {
            }
            column(buyFromICPartnerCode; "Buy-from IC Partner Code")
            {
            }
            column(payToICPartnerCode; "Pay-to IC Partner Code")
            {
            }
            column(icReferenceDocumentNo; "IC Reference Document No.")
            {
            }
            column(icDirection; "IC Direction")
            {
            }
            column(prepaymentNo; "Prepayment No.")
            {
            }
            column(lastPrepaymentNo; "Last Prepayment No.")
            {
            }
            column(prepmtCrMemoNo; "Prepmt. Cr. Memo No.")
            {
            }
            column(lastPrepmtCrMemoNo; "Last Prepmt. Cr. Memo No.")
            {
            }
            column(prepayment; "Prepayment %")
            {
            }
            column(prepaymentNoSeries; "Prepayment No. Series")
            {
            }
            column(compressPrepayment; "Compress Prepayment")
            {
            }
            column(prepaymentDueDate; "Prepayment Due Date")
            {
            }
            column(prepmtCrMemoNoSeries; "Prepmt. Cr. Memo No. Series")
            {
            }
            column(prepmtPostingDescription; "Prepmt. Posting Description")
            {
            }
            column(prepmtPmtDiscountDate; "Prepmt. Pmt. Discount Date")
            {
            }
            column(prepmtPaymentTermsCode; "Prepmt. Payment Terms Code")
            {
            }
            column(prepmtPaymentDiscount; "Prepmt. Payment Discount %")
            {
            }
            column(noOfArchivedVersions; "No. of Archived Versions")
            {
            }
            column(purchaseQuoteNo; "Purchase Quote No.")
            {
            }
            column(vatReportingDate; "VAT Reporting Date")
            {
            }
            column(dimensionSetID; "Dimension Set ID")
            {
            }
            column(sourceDocExists; "Source Doc. Exists")
            {
            }
            column(lastArchivedDate; "Last Archived Date")
            {
            }
            column(interactionExist; "Interaction Exist")
            {
            }
            column(timeArchived; "Time Archived")
            {
            }
            column(dateArchived; "Date Archived")
            {
            }
            column(archivedBy; "Archived By")
            {
            }
            column(versionNo; "Version No.")
            {
            }
            column(docNoOccurrence; "Doc. No. Occurrence")
            {
            }
            column(campaignNo; "Campaign No.")
            {
            }
            column(buyFromContactNo; "Buy-from Contact No.")
            {
            }
            column(payToContactNo; "Pay-to Contact No.")
            {
            }
            column(responsibilityCenter; "Responsibility Center")
            {
            }
            column(completelyReceived; "Completely Received")
            {
            }
            column(postingFromWhseRef; "Posting from Whse. Ref.")
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
            column(vendorAuthorizationNo; "Vendor Authorization No.")
            {
            }
            column(returnShipmentNo; "Return Shipment No.")
            {
            }
            column(returnShipmentNoSeries; "Return Shipment No. Series")
            {
            }
            column(ship; Ship)
            {
            }
            column(lastReturnShipmentNo; "Last Return Shipment No.")
            {
            }
            column(priceCalculationMethod; "Price Calculation Method")
            {
            }
            column(assignedUserID; "Assigned User ID")
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
