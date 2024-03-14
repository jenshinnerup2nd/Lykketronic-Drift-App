query 50017 BIProduction_BOM_Line
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Production_BOM_Line';
    EntitySetName = 'PowerBIProduction_BOM_Lines';
    QueryType = API;

    elements
    {
        dataitem(productionBOMLine; "Production BOM Line")
        {
            column(productionBOMNo; "Production BOM No.")
            {
            }
            column(lineNo; "Line No.")
            {
            }
            column(versionCode; "Version Code")
            {
            }
            column("type"; "Type")
            {
            }
            column(no; "No.")
            {
            }
            column(description; Description)
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(quantity; Quantity)
            {
            }
            column(position; Position)
            {
            }
            column(position2; "Position 2")
            {
            }
            column(position3; "Position 3")
            {
            }
            column(leadTimeOffset; "Lead-Time Offset")
            {
            }
            column(routingLinkCode; "Routing Link Code")
            {
            }
            column(scrap; "Scrap %")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(comment; Comment)
            {
            }
            column(startingDate; "Starting Date")
            {
            }
            column(endingDate; "Ending Date")
            {
            }
            column(length; Length)
            {
            }
            column(width; Width)
            {
            }
            column(weight; Weight)
            {
            }
            column(depth; Depth)
            {
            }
            column(calculationFormula; "Calculation Formula")
            {
            }
            column(quantityPer; "Quantity per")
            {
            }
            column(pos30; pos30)
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
