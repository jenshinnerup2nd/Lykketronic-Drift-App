tableextension 50002 DynPlanningWorkSheet extends "Requisition Line"
{
    fields
    {
        field(50000; DynUnPlannedWarning; Text[250])
        {
            Caption = 'DynUnPlannedWarning';
            DataClassification = CustomerContent;
        }
    }
}
