query 50014 BICustomer
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Customer';
    EntitySetName = 'PowerBICustomers';
    QueryType = API;

    elements
    {
        dataitem(customer; Customer)
        {
            column(no; "No.")
            {
            }
            column(name; Name)
            {
            }
            column(searchName; "Search Name")
            {
            }
            column(name2; "Name 2")
            {
            }
            column(address; Address)
            {
            }
            column(address2; "Address 2")
            {
            }
            column(city; City)
            {
            }
            column(contact; Contact)
            {
            }
            column(phoneNo; "Phone No.")
            {
            }
            column(telexNo; "Telex No.")
            {
            }
            column(documentSendingProfile; "Document Sending Profile")
            {
            }
            column(shipToCode; "Ship-to Code")
            {
            }
            column(ourAccountNo; "Our Account No.")
            {
            }
            column(territoryCode; "Territory Code")
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(globalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(chainName; "Chain Name")
            {
            }
            column(budgetedAmount; "Budgeted Amount")
            {
            }
            column(creditLimitLCY; "Credit Limit (LCY)")
            {
            }
            column(customerPostingGroup; "Customer Posting Group")
            {
            }
            column(currencyCode; "Currency Code")
            {
            }
            column(customerPriceGroup; "Customer Price Group")
            {
            }
            column(languageCode; "Language Code")
            {
            }
            column(registrationNumber; "Registration Number")
            {
            }
            column(statisticsGroup; "Statistics Group")
            {
            }
            column(paymentTermsCode; "Payment Terms Code")
            {
            }
            column(finChargeTermsCode; "Fin. Charge Terms Code")
            {
            }
            column(salespersonCode; "Salesperson Code")
            {
            }
            column(shipmentMethodCode; "Shipment Method Code")
            {
            }
            column(shippingAgentCode; "Shipping Agent Code")
            {
            }
            column(placeOfExport; "Place of Export")
            {
            }
            column(invoiceDiscCode; "Invoice Disc. Code")
            {
            }
            column(customerDiscGroup; "Customer Disc. Group")
            {
            }
            column(countryRegionCode; "Country/Region Code")
            {
            }
            column(collectionMethod; "Collection Method")
            {
            }
            column(amount; Amount)
            {
            }
            column(comment; Comment)
            {
            }
            column(blocked; Blocked)
            {
            }
            column(invoiceCopies; "Invoice Copies")
            {
            }
            column(lastStatementNo; "Last Statement No.")
            {
            }
            column(printStatements; "Print Statements")
            {
            }
            column(billToCustomerNo; "Bill-to Customer No.")
            {
            }
            column(priority; Priority)
            {
            }
            column(paymentMethodCode; "Payment Method Code")
            {
            }
            column(formatRegion; "Format Region")
            {
            }
            column(lastModifiedDateTime; "Last Modified Date Time")
            {
            }
            column(lastDateModified; "Last Date Modified")
            {
            }
            column(applicationMethod; "Application Method")
            {
            }
            column(pricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(faxNo; "Fax No.")
            {
            }
            column(telexAnswerBack; "Telex Answer Back")
            {
            }
            column(vatRegistrationNo; "VAT Registration No.")
            {
            }
            column(combineShipments; "Combine Shipments")
            {
            }
            column(genBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column(gln; GLN)
            {
            }
            column(postCode; "Post Code")
            {
            }
            column(county; County)
            {
            }
            column(eoriNumber; "EORI Number")
            {
            }
            column(useGLNInElectronicDocument; "Use GLN in Electronic Document")
            {
            }
            column(debitAmount; "Debit Amount")
            {
            }
            column(creditAmount; "Credit Amount")
            {
            }
            column(debitAmountLCY; "Debit Amount (LCY)")
            {
            }
            column(creditAmountLCY; "Credit Amount (LCY)")
            {
            }
            column(eMail; "E-Mail")
            {
            }
            column(homePage; "Home Page")
            {
            }
            column(reminderTermsCode; "Reminder Terms Code")
            {
            }
            column(reminderAmounts; "Reminder Amounts")
            {
            }
            column(reminderAmountsLCY; "Reminder Amounts (LCY)")
            {
            }
            column(noSeries; "No. Series")
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
            column(reserve; Reserve)
            {
            }
            column(blockPaymentTolerance; "Block Payment Tolerance")
            {
            }
            column(icPartnerCode; "IC Partner Code")
            {
            }
            column(refunds; Refunds)
            {
            }
            column(prepayment; "Prepayment %")
            {
            }
            column(partnerType; "Partner Type")
            {
            }
            column(intrastatPartnerType; "Intrastat Partner Type")
            {
            }
            column(excludeFromPmtPractices; "Exclude from Pmt. Practices")
            {
            }
            column(image; Image)
            {
            }
            column(privacyBlocked; "Privacy Blocked")
            {
            }
            column(disableSearchByName; "Disable Search by Name")
            {
            }
            column(allowMultiplePostingGroups; "Allow Multiple Posting Groups")
            {
            }
            column(preferredBankAccountCode; "Preferred Bank Account Code")
            {
            }
            column(coupledToDataverse; "Coupled to Dataverse")
            {
            }
            column(cashFlowPaymentTermsCode; "Cash Flow Payment Terms Code")
            {
            }
            column(primaryContactNo; "Primary Contact No.")
            {
            }
            column(contactType; "Contact Type")
            {
            }
            column(mobilePhoneNo; "Mobile Phone No.")
            {
            }
            column(responsibilityCenter; "Responsibility Center")
            {
            }
            column(shippingAdvice; "Shipping Advice")
            {
            }
            column(shippingTime; "Shipping Time")
            {
            }
            column(shippingAgentServiceCode; "Shipping Agent Service Code")
            {
            }
            column(serviceZoneCode; "Service Zone Code")
            {
            }
            column(priceCalculationMethod; "Price Calculation Method")
            {
            }
            column(allowLineDisc; "Allow Line Disc.")
            {
            }
            column(baseCalendarCode; "Base Calendar Code")
            {
            }
            column(copySellToAddrToQteFrom; "Copy Sell-to Addr. to Qte From")
            {
            }
            column(validateEUVatRegNo; "Validate EU Vat Reg. No.")
            {
            }
            column(currencyId; "Currency Id")
            {
            }
            column(paymentTermsId; "Payment Terms Id")
            {
            }
            column(shipmentMethodId; "Shipment Method Id")
            {
            }
            column(paymentMethodId; "Payment Method Id")
            {
            }
            column(taxAreaID; "Tax Area ID")
            {
            }
            column(contactID; "Contact ID")
            {
            }
            column(contactGraphId; "Contact Graph Id")
            {
            }
            column(xGarantiPeriodeSalg; xGarantiPeriodeSalg)
            {
            }
            column(xEMail; "xE-mail")
            {
            }
            column(xwww; xwww)
            {
            }
            column(postingGroupOLD; postingGroupOLD)
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
