//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50002 UpdateCalcMatAndCapAmount
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        CalculateStdCost: Codeunit CalculateStandardCostAuto;
    begin
        if StrLen(Rec."Parameter String") = 0 then begin exit end;
        Clear(CalculateStdCost);
        CalculateStdCost.CalcItem(Rec."Parameter String", false)
    end;
}

