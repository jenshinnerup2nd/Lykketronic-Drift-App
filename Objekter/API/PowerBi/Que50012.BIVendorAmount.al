query 50012 BIVendor_Amount
{
    APIGroup = 'Lykketronic';
    APIPublisher = 'Dynalogic';
    APIVersion = 'v1.0';
    EntityName = 'Vendor_Amount';
    EntitySetName = 'PowerBI_Vendor_Amount';
    QueryType = API;

    elements
    {
        dataitem(vendorAmount; "Vendor Amount")
        {
            column(vendorNo; "Vendor No.")
            {
            }
            column(amountLCY; "Amount (LCY)")
            {
            }
            column(amount2LCY; "Amount 2 (LCY)")
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
