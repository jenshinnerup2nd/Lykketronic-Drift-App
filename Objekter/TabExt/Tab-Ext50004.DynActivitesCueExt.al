tableextension 50004 DynActivitesCueExt extends "Activities Cue"
{
    fields
    {
        field(50000; DynOpenSalesOrders; Integer)
        {
            Caption = 'DynOpenSalesOrders';
            CalcFormula = count("Sales Header" where("Document Type" = filter(Order),
                                "Status" = filter(Open)));
            FieldClass = FlowField;
        }
        field(50001; DynReleasedSalesOrders; Integer)
        {
            Caption = 'DynReleasedSalesOrders';
            CalcFormula = count("Sales Header" where("Document Type" = filter(Order),
                                "Status" = filter(Released)));
            FieldClass = FlowField;

        }
        field(50002; DynPlanedProdOrders; Integer)
        {
            Caption = 'DynPlanedProdOrders';
            CalcFormula = count("Production Order" where("Status" = filter(Planned)));
            FieldClass = FlowField;
        }
        field(50003; DynReleasedProdOrders; Integer)
        {
            Caption = 'DynReleasedProdOrders';
            CalcFormula = count("Production Order" where("Status" = filter(Released)));
            FieldClass = FlowField;
        }
    }
}
