PageExtension 73038 pageextension73038 extends "Released Production Order"
{
    layout
    {
        addafter("Last Date Modified")
        {
            field(CustomerNo; Rec.CustomerNo)
            {
                ApplicationArea = Basic;
            }
        }
    }
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


