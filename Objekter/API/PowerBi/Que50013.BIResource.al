query 50013 BIResource
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Resource';
    EntitySetName = 'PowerBIResources';
    QueryType = API;

    elements
    {
        dataitem(resource; Resource)
        {
            column(no; "No.")
            {
            }
            column("type"; "Type")
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
            column(socialSecurityNo; "Social Security No.")
            {
            }
            column(jobTitle; "Job Title")
            {
            }
            column(education; Education)
            {
            }
            column(contractClass; "Contract Class")
            {
            }
            column(employmentDate; "Employment Date")
            {
            }
            column(resourceGroupNo; "Resource Group No.")
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(globalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(baseUnitOfMeasure; "Base Unit of Measure")
            {
            }
            column(directUnitCost; "Direct Unit Cost")
            {
            }
            column(indirectCost; "Indirect Cost %")
            {
            }
            column(unitCost; "Unit Cost")
            {
            }
            column(profit; "Profit %")
            {
            }
            column(priceProfitCalculation; "Price/Profit Calculation")
            {
            }
            column(unitPrice; "Unit Price")
            {
            }
            column(vendorNo; "Vendor No.")
            {
            }
            column(lastDateModified; "Last Date Modified")
            {
            }
            column(comment; Comment)
            {
            }
            column(blocked; Blocked)
            {
            }
            column(capacity; Capacity)
            {
            }
            column(qtyOnOrderJob; "Qty. on Order (Job)")
            {
            }
            column(qtyQuotedJob; "Qty. Quoted (Job)")
            {
            }
            column(usageQty; "Usage (Qty.)")
            {
            }
            column(usageCost; "Usage (Cost)")
            {
            }
            column(usagePrice; "Usage (Price)")
            {
            }
            column(salesQty; "Sales (Qty.)")
            {
            }
            column(salesCost; "Sales (Cost)")
            {
            }
            column(salesPrice; "Sales (Price)")
            {
            }
            column(genProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(postCode; "Post Code")
            {
            }
            column(county; County)
            {
            }
            column(automaticExtTexts; "Automatic Ext. Texts")
            {
            }
            column(noSeries; "No. Series")
            {
            }
            column(taxGroupCode; "Tax Group Code")
            {
            }
            column(vatProdPostingGroup; "VAT Prod. Posting Group")
            {
            }
            column(countryRegionCode; "Country/Region Code")
            {
            }
            column(icPartnerPurchGLAccNo; "IC Partner Purch. G/L Acc. No.")
            {
            }
            column(unitGroupExists; "Unit Group Exists")
            {
            }
            column(image; Image)
            {
            }
            column(privacyBlocked; "Privacy Blocked")
            {
            }

            column(useTimeSheet; "Use Time Sheet")
            {
            }
            column(timeSheetOwnerUserID; "Time Sheet Owner User ID")
            {
            }
            column(timeSheetApproverUserID; "Time Sheet Approver User ID")
            {
            }
            column(defaultDeferralTemplateCode; "Default Deferral Template Code")
            {
            }
            column(qtyOnServiceOrder; "Qty. on Service Order")
            {
            }
            column(serviceZoneFilter; "Service Zone Filter")
            {
            }
            column(inCustomerZone; "In Customer Zone")
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
