PageExtension 73036 pageextension73036 extends "Planned Production Order" 
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
                    ManuPrintReport.PrintProductionOrder(Rec,0);
                end;
            }
        }
    }

    var
        ManuPrintReport: Codeunit "Manu. Print Report";
}

