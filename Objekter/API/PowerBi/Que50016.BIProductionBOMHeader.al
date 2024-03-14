query 50016 BIProductionBOMHeader
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'ProductionBOMHeader';
    EntitySetName = 'PowerBiProductionBOMHeaders';
    QueryType = API;

    elements
    {
        dataitem(productionBOMHeader; "Production BOM Header")
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
            column(searchName; "Search Name")
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(lowLevelCode; "Low-Level Code")
            {
            }
            column(comment; Comment)
            {
            }
            column(creationDate; "Creation Date")
            {
            }
            column(lastDateModified; "Last Date Modified")
            {
            }
            column(status; Status)
            {
            }
            column(versionNos; "Version Nos.")
            {
            }
            column(noSeries; "No. Series")
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
