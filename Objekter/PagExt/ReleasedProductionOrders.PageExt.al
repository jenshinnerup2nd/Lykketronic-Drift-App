PageExtension 73031 pageextension73031 extends "Released Production Orders"
{
    layout
    {
        addafter(Quantity)
        {
            field("Finished Quantity"; Rec."Finished Quantity")
            {
                ApplicationArea = Basic;
            }
            field("Remaining Quantity"; Rec."Remaining Quantity")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Bin Code")
        {
            field("No. Printed"; Rec."No. Printed")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addfirst(Reporting)
        {
            action("Item List")
            {
                ApplicationArea = Basic;
                Caption = 'LT job card';
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 50010;
            }
        }
        addafter("Change &Status")
        {
            action(Serienumre)
            {
                ApplicationArea = Basic;
                Caption = 'Scan Serienummer';
                Image = "Action";
                Promoted = true;

                trigger OnAction()
                var
                    SerieNummer: Codeunit 50006;
                begin
                    //Dynalogic, srn 07042015 Begin
                    //SerieNummer.KaldSerieNrStyring("No.");
                    SerieNummer.KaldSerieNrStyringNew(Rec."No.");
                    //Dynalogic, srn 07042015 End
                end;
            }
            action("Serienumre Test")
            {
                ApplicationArea = Basic;
                Caption = 'Serienummer (Test)';

                trigger OnAction()
                var
                    DynTest: Page 50020;
                begin
                    if Rec."No." = '' then exit;

                    Clear(DynTest);
                    DynTest.ProdOrdre(Rec."No.");
                    DynTest.RunModal;
                end;
            }
        }
        addafter("Production Order Statistics")
        {
            action("Item List 2")
            {
                ApplicationArea = Basic;
                Caption = 'Test brug ikke';
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 50011;
                Visible = false;
            }
        }
    }
}

