tableextension 52011 DynProductionOrderExt extends "Production Order"
{
    fields
    {
        field(50000; "No. Printed"; Integer)
        {
            Caption = 'Udskrevet';
            FieldClass = Normal;
            //NAL-JHHCalcFormula = Missing;
            DataClassification = CustomerContent;
        }
        field(50001; "Finished Quantity"; Decimal)
        {
            Caption = 'Færdigt antal';
            FieldClass = FlowField;
            CalcFormula = Sum("Prod. Order Line"."Finished Quantity" WHERE(Status = FIELD(Status), "Prod. Order No." = FIELD("No."), "Item No." = FIELD("Source No.")));

        }
        field(50002; "Remaining Quantity"; Decimal)
        {
            Caption = 'Restantal';
            FieldClass = FlowField;
            CalcFormula = Sum("Prod. Order Line"."Remaining Quantity" WHERE(Status = FIELD(Status), "Prod. Order No." = FIELD("No."), "Item No." = FIELD("Source No.")));
        }
        field(50003; CustomerNo; Code[20])
        {
            Caption = 'Debitor';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
    }
}
