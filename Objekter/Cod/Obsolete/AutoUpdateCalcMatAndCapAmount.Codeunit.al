//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50003 AutoUpdateCalcMatAndCapAmount
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        CalculateStdCost: Codeunit "Calculate Standard Cost";
    begin
        //Cleaning up Job Queue
        JobQueueEntry.SetRange("Object Type to Run", JobQueueEntry."object type to run"::Codeunit);
        JobQueueEntry.SetRange("Object ID to Run", Codeunit::UpdateCalcMatAndCapAmount);
        JobQueueEntry.DeleteAll(false);


        //Setting filter on Items with Production BOM
        DynItem.SetFilter("Production BOM No.", '<>%1', '');
        DynItem.SetFilter("Assembly BOM", '%1', false);
        DynItem.SetFilter(Blocked, '=%1', false);

        //Temp
        //DynItem.SETFILTER("No.",'%1|%2|%3|%4','100384*','100428*','100911*','100422*');


        if DynItem.FindSet(true, false) then
            repeat
                Clear(JobQueueEntry);
                JobQueueEntry.Init;
                JobQueueEntry."User ID" := UserId;
                JobQueueEntry."Parameter String" := DynItem."No.";
                JobQueueEntry."Object Type to Run" := JobQueueEntry."object type to run"::Codeunit;
                JobQueueEntry."Object ID to Run" := Codeunit::UpdateCalcMatAndCapAmount;
                JobQueueEntry.Description := StrSubstNo('Kostprisberegning Vare %1 dato %2', DynItem."No.", Today);
                JobQueueEntry.Status := JobQueueEntry.Status::"On Hold";
                JobQueueEntry."Recurring Job" := true;
                JobQueueEntry.Insert(true);
                JobQueueEntry.SetStatus(JobQueueEntry.Status::Ready);
                Commit;
            until DynItem.Next = 0;
    end;

    var
        DynItem: Record Item;
        UpdateCalcMatAndCapAmount: Codeunit UpdateCalcMatAndCapAmount;
        JobQueueEntry: Record "Job Queue Entry";
}

