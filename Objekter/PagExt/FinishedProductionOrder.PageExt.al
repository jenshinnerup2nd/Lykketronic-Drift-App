PageExtension 73040 pageextension73040 extends "Finished Production Order"
{
    actions
    {
        addafter("&Warehouse Entries")
        {
            action("Item List")
            {
                ApplicationArea = Basic;
                Caption = 'LT job card';
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ManuPrintReport.PrintProductionOrder(Rec, 0);
                end;
            }
        }
        addafter("<Action2>")
        {
            action(Relation)
            {
                ApplicationArea = Basic;
                Caption = 'Relater serienumre';

                trigger OnAction()
                var
                    SerieNummerRelation: Codeunit 50006;
                begin
                    SerieNummerRelation.KaldSerieNrStyring(Rec."No.");
                end;
            }
            action(test)
            {
                ApplicationArea = Basic;
                Caption = 'Test jobkort';
                RunObject = Report 50011;
                Visible = false;
            }
        }
    }

    var
        ManuPrintReport: Codeunit "Manu. Print Report";
}

