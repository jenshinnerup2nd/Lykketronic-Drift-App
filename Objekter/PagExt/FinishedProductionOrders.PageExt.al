PageExtension 73032 pageextension73032 extends "Finished Production Orders"
{
    actions
    {
        addfirst(Reporting)
        {
            action(Serienumre)
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;

                trigger OnAction()
                var
                    SerieNummer: Codeunit 50006;
                begin
                    //Dynalogic, srn 07042015 Begin
                    SerieNummer.KaldSerieNrStyringNew(Rec."No.");
                    //Dynalogic, srn 07042015 End
                end;
            }
        }
    }
}

