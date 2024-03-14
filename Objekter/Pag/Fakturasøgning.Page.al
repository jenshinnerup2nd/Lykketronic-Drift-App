//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50008 "Fakturasøgning"
{

    Caption = 'Faktura søgning';
    SourceTable = Serienummerrelaton;
    PageType = Card;

    layout
    {
        area(Content)
        {
            group(FindSerienummer)
            {
                field(Serienummer; SerieNummer."Færdigvare serienr.")
                {
                    ApplicationArea = all;
                    Caption = 'Serie Nr.';
                    Editable = true;

                    trigger OnValidate()
                    begin
                        Clear(VarePost);
                        VarePost."Serial No." := SerieNummer."Færdigvare serienr.";
                        VarePost."Order No." := ProdNr;
                        VarePost.Positive := true;
                        SerieNrFunktion.FindSerieNrPost(VarePost);
                        FindFaktura;

                    end;
                }
            }
            part(Serienummerliste; "Serienummer - liste")
            {
                ApplicationArea = Custom;
                Caption = 'Serienummer - liste';
                Editable = false;
                SubPageLink = "Færdigvare serienr." = field("Færdigvare serienr.");
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Serienumre)
            {
                ApplicationArea = All;
                Caption = 'Åben Serinummer liste';
                Image = Link;
                Promoted = true;
                RunObject = Page "Serienummer - liste";
            }
        }
    }


    trigger OnOpenPage()
    begin
        SerieNummer.Reset();
        Rec.Reset();

    end;

    var
        VarePost: Record "Item Ledger Entry";
        SerieNrFunktion: Codeunit Serienummerrelation;
        "SerieNr.": Code[20];
        SerieNummer: Record Serienummerrelaton temporary;
        "Værdiposter": Record "Value Entry";
        FakturaHoved: Record "Sales Invoice Header";
        ProdNr: Code[20];


    procedure ProdOrdre(LokNr: Code[20])
    begin
        ProdNr := LokNr;
    end;


    procedure FindFaktura()
    begin
        if Rec."Færdigvare serienr." <> '' then begin
            Clear(VarePost);
            VarePost."Serial No." := SerieNummer."Færdigvare serienr.";
            VarePost."Order No." := ProdNr;
            SerieNrFunktion.FindSerieNrPost(VarePost);
            if VarePost.FindFirst then
                Værdiposter.SetCurrentkey("Item Ledger Entry No.", "Document No.", "Document Line No.");
            Værdiposter.Get(VarePost."Entry No.");
            Error('%1', Værdiposter."Item Ledger Entry No.");
            if Værdiposter.FindFirst then
                FakturaHoved.SetRange("No.", Værdiposter."Document No.");
            Message('%1', FakturaHoved."No.");
        end;
    end;
}

