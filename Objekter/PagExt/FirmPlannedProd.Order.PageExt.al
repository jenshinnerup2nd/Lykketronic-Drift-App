/**
 * This page extension extends the "Firm Planned Prod. Order" page and adds a new action called "LT Jobkort".
 * The "LT Jobkort" action is triggered when the user clicks on it and it prints a production order using the "Manu. Print Report" codeunit.
 */
PageExtension 73037 pageextension73037 extends "Firm Planned Prod. Order"
{
    actions
    {
        addafter("Subcontractor - Dispatch List")
        {
            action("LT Jobkort")
            {
                ApplicationArea = Basic;
                Image = "Report";

                trigger OnAction()
                begin
                    ManuPrintReport.PrintProductionOrder(Rec, 0);
                end;
            }
        }
    }
    var
        ManuPrintReport: Codeunit "Manu. Print Report";
}

