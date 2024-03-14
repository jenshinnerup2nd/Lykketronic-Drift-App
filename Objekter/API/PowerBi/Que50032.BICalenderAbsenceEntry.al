query 50032 BICalenderAbsenceEntry
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Calender_Absence_Entry';
    EntitySetName = 'PowerBI_Calender_Absence_Entry';
    QueryType = API;

    elements
    {
        dataitem(calendarAbsenceEntry; "Calendar Absence Entry")
        {
            column(capacityType; "Capacity Type")
            {
            }
            column(no; "No.")
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
            column(workCenterNo; "Work Center No.")
            {
            }
            column(workCenterGroupCode; "Work Center Group Code")
            {
            }
            column(capacity; Capacity)
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
            column(updated; Updated)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
