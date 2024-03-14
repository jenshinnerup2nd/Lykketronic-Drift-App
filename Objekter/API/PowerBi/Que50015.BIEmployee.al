query 50015 BIEmployee
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Employee';
    EntitySetName = 'PowerBIEmployee';
    QueryType = API;

    elements
    {
        dataitem(employee; Employee)
        {
            column(no; "No.")
            {
            }
            column(firstName; "First Name")
            {
            }
            column(middleName; "Middle Name")
            {
            }
            column(lastName; "Last Name")
            {
            }
            column(initials; Initials)
            {
            }
            column(jobTitle; "Job Title")
            {
            }
            column(searchName; "Search Name")
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
            column(postCode; "Post Code")
            {
            }
            column(county; County)
            {
            }
            column(phoneNo; "Phone No.")
            {
            }
            column(mobilePhoneNo; "Mobile Phone No.")
            {
            }
            column(eMail; "E-Mail")
            {
            }
            column(altAddressCode; "Alt. Address Code")
            {
            }
            column(altAddressStartDate; "Alt. Address Start Date")
            {
            }
            column(altAddressEndDate; "Alt. Address End Date")
            {
            }
            column(birthDate; "Birth Date")
            {
            }
            column(socialSecurityNo; "Social Security No.")
            {
            }
            column(unionCode; "Union Code")
            {
            }
            column(unionMembershipNo; "Union Membership No.")
            {
            }
            column(gender; Gender)
            {
            }
            column(countryRegionCode; "Country/Region Code")
            {
            }
            column(managerNo; "Manager No.")
            {
            }
            column(emplymtContractCode; "Emplymt. Contract Code")
            {
            }
            column(statisticsGroupCode; "Statistics Group Code")
            {
            }
            column(employmentDate; "Employment Date")
            {
            }
            column(status; Status)
            {
            }
            column(inactiveDate; "Inactive Date")
            {
            }
            column(causeOfInactivityCode; "Cause of Inactivity Code")
            {
            }
            column(terminationDate; "Termination Date")
            {
            }
            column(groundsForTermCode; "Grounds for Term. Code")
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(globalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(resourceNo; "Resource No.")
            {
            }
            column(lastDateModified; "Last Date Modified")
            {
            }
            column(extension; Extension)
            {
            }
            column(pager; Pager)
            {
            }
            column(faxNo; "Fax No.")
            {
            }
            column(companyEMail; "Company E-Mail")
            {
            }
            column(title; Title)
            {
            }
            column(salespersPurchCode; "Salespers./Purch. Code")
            {
            }
            column(noSeries; "No. Series")
            {
            }
            column(lastModifiedDateTime; "Last Modified Date Time")
            {
            }
            column(employeePostingGroup; "Employee Posting Group")
            {
            }
            column(bankBranchNo; "Bank Branch No.")
            {
            }
            column(bankAccountNo; "Bank Account No.")
            {
            }
            column(iban; IBAN)
            {
            }
            column(swiftCode; "SWIFT Code")
            {
            }
            column(applicationMethod; "Application Method")
            {
            }
            column(image; Image)
            {
            }
            column(privacyBlocked; "Privacy Blocked")
            {
            }
            column(costCenterCode; "Cost Center Code")
            {
            }
            column(costObjectCode; "Cost Object Code")
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
