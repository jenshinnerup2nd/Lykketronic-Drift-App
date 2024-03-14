//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51001 K1
{
    Editable = false;
    PageType = List;
    SourceTable = K2;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(VareNummer; Rec.VareNummer)
                {
                    ApplicationArea = Basic;
                }
                field(VareTekst; Rec.VareTekst)
                {
                    ApplicationArea = Basic;
                }
                field(SerieNr; Rec.SerieNr)
                {
                    ApplicationArea = Basic;
                }
                field("Modtaget d."; Rec."Modtaget d.")
                {
                    ApplicationArea = Basic;
                }
                field("Afsendt d."; Rec."Afsendt d.")
                {
                    ApplicationArea = Basic;
                }
                field(Tekst1; Rec.Tekst1)
                {
                    ApplicationArea = Basic;
                }
                field(Tekst2; Rec.Tekst2)
                {
                    ApplicationArea = Basic;
                }
                field(Pris; Rec.Pris)
                {
                    ApplicationArea = Basic;
                }
                field(ValutaKode; Rec.ValutaKode)
                {
                    ApplicationArea = Basic;
                }
                field("Pris(DKK)"; Rec."Pris(DKK)")
                {
                    ApplicationArea = Basic;
                }
                field(AfsenderNr; Rec.AfsenderNr)
                {
                    ApplicationArea = Basic;
                }
                field(AfsenderNavn; Rec.AfsenderNavn)
                {
                    ApplicationArea = Basic;
                }
                field(DebitorNr; Rec.DebitorNr)
                {
                    ApplicationArea = Basic;
                }
                field(DebitorNavn; Rec.DebitorNavn)
                {
                    ApplicationArea = Basic;
                }
                field(GarantiReparation; Rec.GarantiReparation)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(FejlType; Rec.FejlType)
                {
                    ApplicationArea = Basic;
                }
                field(FabrikationsFejl; Rec.FabrikationsFejl)
                {
                    ApplicationArea = Basic;
                }
                field(ReparationsRapportNr; Rec.ReparationsRapportNr)
                {
                    ApplicationArea = Basic;
                }
                field(ReparationsNummer; Rec.ReparationsNummer)
                {
                    ApplicationArea = Basic;
                }
                field(ReklamationsNummer; Rec.ReklamationsNummer)
                {
                    ApplicationArea = Basic;
                }
                field(KreditNota; Rec.KreditNota)
                {
                    ApplicationArea = Basic;
                }
                field(OmbytterOrdreNr; Rec.OmbytterOrdreNr)
                {
                    ApplicationArea = Basic;
                }
                field(SkadesDato; Rec.SkadesDato)
                {
                    ApplicationArea = Basic;
                }
                field("Reparat¢r"; Rec."Reparatør")
                {
                    ApplicationArea = Basic;
                }
                field("KreditBel¢b"; Rec."KreditBeløb")
                {
                    ApplicationArea = Basic;
                }
                field("KreditBel¢b(DKK)"; Rec."KreditBeløb(DKK)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

