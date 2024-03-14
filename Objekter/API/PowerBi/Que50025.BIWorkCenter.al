query 50025 BIWork_Center
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Work_Center';
    EntitySetName = 'PowerBIWork_Centers';
    QueryType = API;

    elements
    {
        dataitem(workCenter; "Work Center")
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
            column(postCode; "Post Code")
            {
            }
            column(alternateWorkCenter; "Alternate Work Center")
            {
            }
            column(workCenterGroupCode; "Work Center Group Code")
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(globalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(subcontractorNo; "Subcontractor No.")
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
            column(queueTime; "Queue Time")
            {
            }
            column(queueTimeUnitOfMeasCode; "Queue Time Unit of Meas. Code")
            {
            }
            column(lastDateModified; "Last Date Modified")
            {
            }
            column(comment; Comment)
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(capacity; Capacity)
            {
            }
            column(efficiency; Efficiency)
            {
            }
            column(maximumEfficiency; "Maximum Efficiency")
            {
            }
            column(minimumEfficiency; "Minimum Efficiency")
            {
            }
            column(calendarRoundingPrecision; "Calendar Rounding Precision")
            {
            }
            column(simulationType; "Simulation Type")
            {
            }
            column(shopCalendarCode; "Shop Calendar Code")
            {
            }
            column(blocked; Blocked)
            {
            }
            column(unitCostCalculation; "Unit Cost Calculation")
            {
            }
            column(specificUnitCost; "Specific Unit Cost")
            {
            }
            column(consolidatedCalendar; "Consolidated Calendar")
            {
            }
            column(flushingMethod; "Flushing Method")
            {
            }
            column(noSeries; "No. Series")
            {
            }
            column(overheadRate; "Overhead Rate")
            {
            }
            column(genProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(county; County)
            {
            }
            column(countryRegionCode; "Country/Region Code")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(openShopFloorBinCode; "Open Shop Floor Bin Code")
            {
            }
            column(toProductionBinCode; "To-Production Bin Code")
            {
            }
            column(fromProductionBinCode; "From-Production Bin Code")
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
