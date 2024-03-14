query 50031 BIRoutingHeader
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Routing_Header';
    EntitySetName = 'PowerBI_Routing_Header';
    QueryType = API;

    elements
    {
        dataitem(routingHeader; "Routing Header")
        {
            column(no; "No.")
            {
            }
            column(description; Description)
            {
            }
            column(description2; "Description 2")
            {
            }
            column(searchDescription; "Search Description")
            {
            }
            column(lastDateModified; "Last Date Modified")
            {
            }
            column(comment; Comment)
            {
            }
            column(status; Status)
            {
            }
            column("type"; "Type")
            {
            }
            column(versionNos; "Version Nos.")
            {
            }
            column(noSeries; "No. Series")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
