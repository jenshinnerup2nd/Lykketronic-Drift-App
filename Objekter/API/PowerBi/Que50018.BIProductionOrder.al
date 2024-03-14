query 50018 BIProduction_Order
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Production_Order';
    EntitySetName = 'PowerBIProductionOrders';
    QueryType = API;

    elements
    {
        dataitem(productionOrder; "Production Order")
        {
            column(status; Status)
            {
            }
            column(no; "No.")
            {
            }
            column(description; Description)
            {
            }
            column(searchDescription; "Search Description")
            {
            }
            column(description2; "Description 2")
            {
            }
            column(creationDate; "Creation Date")
            {
            }
            column(lastDateModified; "Last Date Modified")
            {
            }
            column(sourceType; "Source Type")
            {
            }
            column(sourceNo; "Source No.")
            {
            }
            column(routingNo; "Routing No.")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(inventoryPostingGroup; "Inventory Posting Group")
            {
            }
            column(genProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(genBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column(comment; Comment)
            {
            }
            column(startingTime; "Starting Time")
            {
            }
            column(startingDate; "Starting Date")
            {
            }
            column(endingTime; "Ending Time")
            {
            }
            column(endingDate; "Ending Date")
            {
            }
            column(dueDate; "Due Date")
            {
            }
            column(finishedDate; "Finished Date")
            {
            }
            column(blocked; Blocked)
            {
            }
            column(shortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(shortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(binCode; "Bin Code")
            {
            }
            column(replanRefNo; "Replan Ref. No.")
            {
            }
            column(replanRefStatus; "Replan Ref. Status")
            {
            }
            column(lowLevelCode; "Low-Level Code")
            {
            }
            column(quantity; Quantity)
            {
            }
            column(unitCost; "Unit Cost")
            {
            }
            column(costAmount; "Cost Amount")
            {
            }
            column(noSeries; "No. Series")
            {
            }
            column(plannedOrderNo; "Planned Order No.")
            {
            }
            column(firmPlannedOrderNo; "Firm Planned Order No.")
            {
            }
            column(simulatedOrderNo; "Simulated Order No.")
            {
            }
            column(startingDateTime; "Starting Date-Time")
            {
            }
            column(endingDateTime; "Ending Date-Time")
            {
            }
            column(dimensionSetID; "Dimension Set ID")
            {
            }
            column(assignedUserID; "Assigned User ID")
            {
            }
            column(noPrinted; "No. Printed")
            {
            }
            column(customerNo; CustomerNo)
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
