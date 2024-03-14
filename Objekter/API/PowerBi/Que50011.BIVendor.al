query 50011 BIVendor
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Vendor';
    EntitySetName = 'PowerBIVendor';
    QueryType = API;

    elements
    {
        dataitem(vendor; Vendor)
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
            column(budgetedAmount; "Budgeted Amount")
            {
            }
            column(vendorPostingGroup; "Vendor Posting Group")
            {
            }
            column(currencyCode; "Currency Code")
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
            column(purchaserCode; "Purchaser Code")
            {
            }
            column(shipmentMethodCode; "Shipment Method Code")
            {
            }
            column(shippingAgentCode; "Shipping Agent Code")
            {
            }
            column(invoiceDiscCode; "Invoice Disc. Code")
            {
            }
            column(countryRegionCode; "Country/Region Code")
            {
            }
            column(blocked; Blocked)
            {
            }
            column(payToVendorNo; "Pay-to Vendor No.")
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
            column(faxNo; "Fax No.")
            {
            }
            column(telexAnswerBack; "Telex Answer Back")
            {
            }
            column(vatRegistrationNo; "VAT Registration No.")
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
            column(eMail; "E-Mail")
            {
            }
            column(homePage; "Home Page")
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
            column(blockPaymentTolerance; "Block Payment Tolerance")
            {
            }
            column(icPartnerCode; "IC Partner Code")
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
            column(companySizeCode; "Company Size Code")
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
            column(creditorNo; "Creditor No.")
            {
            }
            column(allowMultiplePostingGroups; "Allow Multiple Posting Groups")
            {
            }
            column(preferredBankAccountCode; "Preferred Bank Account Code")
            {
            }
            column(cashFlowPaymentTermsCode; "Cash Flow Payment Terms Code")
            {
            }
            column(primaryContactNo; "Primary Contact No.")
            {
            }
            column(mobilePhoneNo; "Mobile Phone No.")
            {
            }
            column(responsibilityCenter; "Responsibility Center")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(leadTimeCalculation; "Lead Time Calculation")
            {
            }
            column(priceCalculationMethod; "Price Calculation Method")
            {
            }
            column(baseCalendarCode; "Base Calendar Code")
            {
            }
            column(documentSendingProfile; "Document Sending Profile")
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
            column(paymentMethodId; "Payment Method Id")
            {
            }
            column(overReceiptCode; "Over-Receipt Code")
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
