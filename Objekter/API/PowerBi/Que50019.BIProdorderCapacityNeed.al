query 50019 BIProd_order_Capacity_Need
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Prod_order_Capacity_Need';
    EntitySetName = 'PowerBIProd_order_Capacity_Need';
    QueryType = API;

    elements
    {
        dataitem(prodOrderCapacityNeed; "Prod. Order Capacity Need")
        {
            column(status; Status)
            {
            }
            column(prodOrderNo; "Prod. Order No.")
            {
            }
            column(routingNo; "Routing No.")
            {
            }
            column(lineNo; "Line No.")
            {
            }
            column(operationNo; "Operation No.")
            {
            }
            column("type"; "Type")
            {
            }
            column(no; "No.")
            {
            }
            column(workCenterNo; "Work Center No.")
            {
            }
            column(workCenterGroupCode; "Work Center Group Code")
            {
            }
            column(routingReferenceNo; "Routing Reference No.")
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
            column(allocatedTime; "Allocated Time")
            {
            }
            column(sendAheadType; "Send-Ahead Type")
            {
            }
            column(timeType; "Time Type")
            {
            }
            column(neededTime; "Needed Time")
            {
            }
            column(neededTimeMs; "Needed Time (ms)")
            {
            }
            column(lotSize; "Lot Size")
            {
            }
            column(concurrentCapacities; "Concurrent Capacities")
            {
            }
            column(efficiency; Efficiency)
            {
            }
            column(startingDateTime; "Starting Date-Time")
            {
            }
            column(endingDateTime; "Ending Date-Time")
            {
            }
            column(worksheetTemplateName; "Worksheet Template Name")
            {
            }
            column(worksheetBatchName; "Worksheet Batch Name")
            {
            }
            column(worksheetLineNo; "Worksheet Line No.")
            {
            }
            column(active; Active)
            {
            }
            column(requestedOnly; "Requested Only")
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
