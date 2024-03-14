query 50024 BIShop_Calender_Working_Days
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Shop_Calendar_Working_Days';
    EntitySetName = 'PowerBI_Shop_Calendar_Working_Days';
    QueryType = API;

    elements
    {
        dataitem(shopCalendarWorkingDays; "Shop Calendar Working Days")
        {
            column(shopCalendarCode; "Shop Calendar Code")
            {
            }
            column(day; Day)
            {
            }
            column(workShiftCode; "Work Shift Code")
            {
            }
            column(startingTime; "Starting Time")
            {
            }
            column(endingTime; "Ending Time")
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
