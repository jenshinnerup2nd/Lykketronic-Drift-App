pageextension 50010 DynO365ActivitiesPageExt extends "O365 Activities"
{
    layout
    {
        addafter("Ongoing Sales Orders")
        {

            field(DynOpenSalesOrders; Rec.DynOpenSalesOrders)
            {
                ApplicationArea = All;
                Caption = 'Åbne Salgsordrer';
                DrillDownPageID = "Sales Order List";
                ToolTip = 'Alle åbne salgsordrer';
            }
            field(DynReleasedSalesOrders; Rec.DynReleasedSalesOrders)
            {
                ApplicationArea = All;
                Caption = 'Frigivne Salgsordrer';
                DrillDownPageID = "Sales Order List";
                ToolTip = 'Alle frigivne salgsordrer';
            }
            field(DynPlanedProdOrders; Rec.DynPlanedProdOrders)
            {
                ApplicationArea = All;
                Caption = 'Planlagte Prod.ordrer';
                DrillDownPageID = "Production Order List";
                ToolTip = 'Alle planlagte prod.ordrer';
            }
            field(DynReleasedProdOrders; Rec.DynReleasedProdOrders)
            {
                ApplicationArea = All;
                Caption = 'Frigivne Prod.ordrer';
                DrillDownPageID = "Production Order List";
                ToolTip = 'Alle frigivne prod.ordrer';
            }
        }
    }
}