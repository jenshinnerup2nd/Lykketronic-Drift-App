query 50020 BIRouting_Line
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Routing_Line';
    EntitySetName = 'PowerBI_Routing_Line';
    QueryType = API;

    elements
    {
        dataitem(routingLine; "Routing Line")
        {
            column(routingNo; "Routing No.")
            {
            }
            column(versionCode; "Version Code")
            {
            }
            column(operationNo; "Operation No.")
            {
            }
            column(nextOperationNo; "Next Operation No.")
            {
            }
            column(previousOperationNo; "Previous Operation No.")
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
            column(description; Description)
            {
            }
            column(setupTime; "Setup Time")
            {
            }
            column(runTime; "Run Time")
            {
            }
            column(waitTime; "Wait Time")
            {
            }
            column(moveTime; "Move Time")
            {
            }
            column(fixedScrapQuantity; "Fixed Scrap Quantity")
            {
            }
            column(lotSize; "Lot Size")
            {
            }
            column(scrapFactor; "Scrap Factor %")
            {
            }
            column(setupTimeUnitOfMeasCode; "Setup Time Unit of Meas. Code")
            {
            }
            column(runTimeUnitOfMeasCode; "Run Time Unit of Meas. Code")
            {
            }
            column(waitTimeUnitOfMeasCode; "Wait Time Unit of Meas. Code")
            {
            }
            column(moveTimeUnitOfMeasCode; "Move Time Unit of Meas. Code")
            {
            }
            column(minimumProcessTime; "Minimum Process Time")
            {
            }
            column(maximumProcessTime; "Maximum Process Time")
            {
            }
            column(concurrentCapacities; "Concurrent Capacities")
            {
            }
            column(sendAheadQuantity; "Send-Ahead Quantity")
            {
            }
            column(routingLinkCode; "Routing Link Code")
            {
            }
            column(standardTaskCode; "Standard Task Code")
            {
            }
            column(unitCostPer; "Unit Cost per")
            {
            }
            column(recalculate; Recalculate)
            {
            }
            column(comment; Comment)
            {
            }
            column(sequenceNoForward; "Sequence No. (Forward)")
            {
            }
            column(sequenceNoBackward; "Sequence No. (Backward)")
            {
            }
            column(fixedScrapQtyAccum; "Fixed Scrap Qty. (Accum.)")
            {
            }
            column(scrapFactorAccumulated; "Scrap Factor % (Accumulated)")
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
