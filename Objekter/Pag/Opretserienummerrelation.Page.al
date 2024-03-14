//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50006 "Opret serienummerrelation"
{
    PageType = Card;
    SourceTable = Serienummerrelaton;

    layout
    {
        area(Content)
        {
            group(Control1160520006)

            {
                Caption = 'Scan serienummer';
                field("TempRelation.""Færdigvare serienr."""; TempRelation."Færdigvare serienr.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Færdigvare';
                    Editable = true;
                    Importance = Standard;
                    QuickEntry = false;

                    trigger OnValidate()
                    begin
                        Clear(VarePost);
                        VarePost."Serial No." := TempRelation."Færdigvare serienr.";
                        VarePost."Order No." := ProdNr;
                        VarePost.Positive := true;
                        SerieNrFunktion.FindSerieNrPost(VarePost);
                        if VarePost.Description <> '' then
                            SvarText := StrSubstNo('Serienr %1 på %2 fundet', VarePost."Serial No.", VarePost.Description)
                        else
                            Error('Serienummer %1 ikke fundet på ordre %2', TempRelation."Færdigvare serienr.", ProdNr);
                        OpdaterRelationer;
                        Rec.SetRange(Rec."Færdigvare serienr.", TempRelation."Færdigvare serienr.");
                    end;
                }
                field("TempRelation.""Råvare serienr."""; TempRelation."Råvare serienr.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Råvare';

                    trigger OnValidate()
                    begin

                        Clear(VarePost);
                        VarePost."Serial No." := TempRelation."Råvare serienr.";
                        VarePost."Order No." := ProdNr;
                        VarePost.Positive := false;
                        SerieNrFunktion.FindSerieNrPost(VarePost);
                        if VarePost.Description <> '' then
                            SvarText := StrSubstNo('Serienr %1 på %2 fundet', VarePost."Serial No.", VarePost.Description)
                        else
                            Error('Serienummer %1 ikke fundet', TempRelation."Råvare serienr.");

                        OpdaterRelationer;
                    end;
                }
                field(SvarText; SvarText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Svar';
                    Editable = false;
                    QuickEntry = false;
                }
            }
            part(Control1160520004; "Serienummer - liste")
            {
                ApplicationArea = Custom;
                Caption = 'Serienummer - liste';
                Editable = false;
                SubPageLink = "Prod. Order No." = field("Prod. Order No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Serienumre)
            {
                ApplicationArea = Basic;
                Image = Link;
                Promoted = true;
                RunObject = Page "Serienummer - liste";
            }
            action("Vis Faktura")
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                begin
                    if BogfFaktura.Get(SerieNrFunktion.FindFaktura(Rec."Færdigvarenr.", TempRelation."Færdigvare serienr."))
                      then
                        Page.RunModal(132, BogfFaktura)
                    else
                        Message('Ingen faktura fundet på serienr. %1', Rec."Færdigvare serienr.");
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange(Rec."Prod. Order No.", ProdNr);
    end;

    var
        VarePost: Record "Item Ledger Entry";
        TempRelation: Record Serienummerrelaton temporary;
        OpdaterSerieNr: Record Serienummerrelaton;
        SvarText: Text[100];
        SerieNrFunktion: Codeunit Serienummerrelation;
        Vare: Record Item;
        ProdNr: Code[20];
        BogfFaktura: Record "Sales Invoice Header";
        "serieNr.": Code[20];


    procedure ProdOrdre(LokNr: Code[20])
    begin
        ProdNr := LokNr;
    end;


    procedure OpdaterRelationer()
    begin
        if (TempRelation."Færdigvare serienr." <> '') and
           (TempRelation."Råvare serienr." <> '') and
           (ProdNr <> '') then begin
            OpdaterSerieNr.Init;
            Clear(VarePost);
            VarePost."Serial No." := TempRelation."Råvare serienr.";
            VarePost."Order No." := ProdNr;
            SerieNrFunktion.FindSerieNrPost(VarePost);
            if VarePost."Entry No." <> 0 then begin
                OpdaterSerieNr."Råvare serienr." := VarePost."Serial No.";
                OpdaterSerieNr."Råvarenr." := VarePost."Item No.";
                OpdaterSerieNr."Registration Date" := Today;
                OpdaterSerieNr."Posting Date" := VarePost."Posting Date";
                OpdaterSerieNr."Prod. Order No." := VarePost."Order No.";
                OpdaterSerieNr.Råvarebeskrivelse := VarePost.Description;
            end;
            Clear(VarePost);
            VarePost."Serial No." := TempRelation."Færdigvare serienr.";
            VarePost."Order No." := ProdNr;
            VarePost.Positive := true;
            SerieNrFunktion.FindSerieNrPost(VarePost);
            if VarePost."Entry No." <> 0 then begin
                OpdaterSerieNr."Færdigvare serienr." := VarePost."Serial No.";
                OpdaterSerieNr."Færdigvarenr." := VarePost."Item No.";
                OpdaterSerieNr.Færdigvarebeskrivelse := VarePost.Description;
            end;
            if (OpdaterSerieNr."Færdigvare serienr." <> '') and
               (OpdaterSerieNr."Råvare serienr." <> '') then begin
                if not OpdaterSerieNr.Insert then OpdaterSerieNr.Modify;
                SvarText := StrSubstNo(CopyStr('Serienr %1 og %2 er bundet sammen', 1, 50),
                                     OpdaterSerieNr."Færdigvare serienr.",
                                     OpdaterSerieNr."Råvare serienr.");
            end;
        end;
    end;
}

