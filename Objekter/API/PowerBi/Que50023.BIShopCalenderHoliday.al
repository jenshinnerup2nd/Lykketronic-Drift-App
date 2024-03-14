query 50023 BIShop_Calender_Holiday
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Shop_Calendar_Holiday';
    EntitySetName = 'PowerBI_Shop_Calendar_Holiday';
    QueryType = API;

    elements
    {
        dataitem(shopCalendarHoliday; "Shop Calendar Holiday")
        {
            column(shopCalendarCode; "Shop Calendar Code")
            {
            }
            column("date"; "Date")
            {
            }
            column(startingTime; "Starting Time")
            {
            }
            column(endingTime; "Ending Time")
            {
            }
            column(startingDateTime; "Starting Date-Time")
            {
            }
            column(endingDateTime; "Ending Date-Time")
            {
            }
            column(description; Description)
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
