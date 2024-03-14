query 50008 BIPurch_Rcpt_Header
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'PurchRcptHeader';
    EntitySetName = 'PowerBI_PurchRcptHeader';
    QueryType = API;

    elements
    {
        dataitem(purchRcptHeader; "Purch. Rcpt. Header")
        {
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
            column(orderNo; "Order No.")
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
            column(vendorOrderNo; "Vendor Order No.")
            {
            }
            column(vendorShipmentNo; "Vendor Shipment No.")
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
            column(orderNoSeries; "Order No. Series")
            {
            }
            column(userID; "User ID")
            {
            }
            column(sourceCode; "Source Code")
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
            column(vatBaseDiscount; "VAT Base Discount %")
            {
            }
            column(quoteNo; "Quote No.")
            {
            }
            column(dimensionSetID; "Dimension Set ID")
            {
            }
            column(campaignNo; "Campaign No.")
            {
            }
            column(buyFromContactNo; "Buy-from Contact No.")
            {
            }
            column(payToContactNo; "Pay-to Contact no.")
            {
            }
            column(responsibilityCenter; "Responsibility Center")
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
            column(priceCalculationMethod; "Price Calculation Method")
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
