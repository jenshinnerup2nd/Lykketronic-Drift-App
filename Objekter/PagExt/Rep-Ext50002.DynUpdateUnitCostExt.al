reportextension 50002 DynUpdateUnitCostExt extends "Update Unit Cost"
{
    dataset
    {
    }
    requestpage
    {
        trigger OnOpenPage()

        Begin
            InitializeRequest(1, true);
        End;
    }

}

