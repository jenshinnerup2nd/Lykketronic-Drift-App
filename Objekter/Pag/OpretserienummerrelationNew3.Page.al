//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50020 "Opret serienummerrelation New3"
{
    Caption = 'Opret serienummerrelation';
    SourceTable = Serienummerrelaton;
    PageType = Card;

    layout
    {
        area(content)
        {
            group(Control1160520006)
            {
                field(Scanne; ValueRegField)
                {
                    ApplicationArea = Basic;
                    Caption = 'Scan';

                    trigger OnValidate()
                    var
                        FItem: Record Item;
                        CalcBOMTree: Codeunit "Calculate BOM Tree";
                        BOMBuffer: Record "BOM Buffer" temporary;
                        Found: Boolean;
                    begin
                        //Er færdigvare serienummer ?
                        Clear(VarePost);
                        //IF VarePost.Description <> '' THEN BEGIN
                        if GemFærdig = '' then begin   //Færdigvare
                            VarePost.SetRange("Serial No.", ValueRegField);
                            if VarePost.FindFirst then begin
                                GemFærdig := ValueRegField; //VarePost."Serial No.";
                                FiItem := VarePost."Item No.";
                                TempRelation."Færdigvare serienr." := GemFærdig;
                                TempRelation."Råvare serienr." := '';
                                SvarText := '';
                                CurrPage.Serienummerliste.Page.DYNRefreshPage(GemFærdig);
                                CurrPage.Serienummerliste.Page.Update(true);
                            end else begin
                                Error('Varepost ikke fundet til dette serienummer %1', ValueRegField);
                            end;
                        end else begin
                            //så er det råvareserienummer
                            if GemFærdig <> '' then begin
                                Clear(VarePost);
                                VarePost.SetRange("Serial No.", ValueRegField);
                                if VarePost.FindFirst then begin
                                    Found := false;
                                    BOMBuffer.DeleteAll;
                                    FItem.SetFilter("No.", FiItem);
                                    if FItem.FindFirst then begin
                                        if (FItem.HasBOM) then begin
                                            CalcBOMTree.GenerateTreeForItems(FItem, BOMBuffer, 0);
                                            if BOMBuffer.FindSet then
                                                repeat
                                                    if (BOMBuffer."No." = VarePost."Item No.") and (BOMBuffer.Indentation <> 0) then begin
                                                        Found := true;
                                                    end;
                                                until (BOMBuffer.Next = 0) or (Found = true);
                                        end;
                                        if Found = true then begin
                                            SvarText := StrSubstNo('Serienr %1 på %2 fundet', VarePost."Serial No.", VarePost."Item No.");
                                            TempRelation."Råvare serienr." := ValueRegField;
                                            OpdaterRelationer;
                                        end else begin   //Hvis ikke fundet så er det nyt FV nummer
                                                         //ERROR('Råvarenummer %1 ikke fundet i stykliste %2',VarePost."Item No.",FItem."Production BOM No.");
                                            Clear(VarePost);
                                            VarePost.SetRange("Serial No.", ValueRegField);
                                            if VarePost.FindFirst then begin
                                                GemFærdig := ValueRegField;
                                                FiItem := VarePost."Item No.";
                                                TempRelation."Færdigvare serienr." := GemFærdig;
                                                TempRelation."Råvare serienr." := '';
                                                SvarText := '';
                                                CurrPage.Serienummerliste.Page.DYNRefreshPage(GemFærdig);
                                                CurrPage.Serienummerliste.Page.Update(true);
                                            end;
                                        end;
                                    end else begin
                                        Error('Fejl i færdigvarenummer %1', FiItem);
                                    end;
                                end else begin
                                    Error('Varepost til råvare Serienummer %1 ikke fundet', ValueRegField);
                                end;
                            end;
                        end;
                    end;
                }
                field("Færdigvare"; TempRelation."Færdigvare serienr.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Færdigvare';
                    Editable = false;
                    Importance = Standard;
                }
                field("Råvare"; TempRelation."Råvare serienr.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Råvare';
                    Editable = false;
                }
                field(SvarText; SvarText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Svar';
                    Editable = false;
                    QuickEntry = false;
                }
            }
            part(Serienummerliste; "Serienummer - liste")
            {
                ApplicationArea = Custom;
                Caption = 'Serienummer - liste';
                Editable = false;
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
        Rec.SetRange("Prod. Order No.", ProdNr);
        iFærdigVare := true;
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
        "//Dyn": Integer;
        ValueRegField: Code[20];
        ItemBom: Record "Production BOM Line";
        "iFærdigVare": Boolean;
        "iNumberOfRåvare": Integer;
        "GemFærdig": Code[20];
        FiItem: Code[20];
        VareTjek: Record "Item Ledger Entry";
        "Dyn//": Integer;


    procedure ProdOrdre(LokNr: Code[20])
    begin
        ProdNr := LokNr;
    end;


    procedure OpdaterRelationer()
    var
        Item: Record Item;
    begin
        if (TempRelation."Færdigvare serienr." <> '') and
           (TempRelation."Råvare serienr." <> '') then //AND
                                                       //(ProdNr <> '') THEN
        begin
            OpdaterSerieNr.Init;
            Clear(VarePost);
            VarePost.SetRange("Serial No.", TempRelation."Råvare serienr.");
            if VarePost.FindFirst then;
            Item.Get(VarePost."Item No.");
            OpdaterSerieNr."Råvare serienr." := TempRelation."Råvare serienr.";//VarePost."Serial No.";
            OpdaterSerieNr."Råvarenr." := VarePost."Item No.";
            OpdaterSerieNr."Registration Date" := Today;
            OpdaterSerieNr."Posting Date" := VarePost."Posting Date";
            //OpdaterSerieNr."Prod. Order No." := VarePost."Order No.";
            OpdaterSerieNr.Råvarebeskrivelse := Item.Description;

            Clear(VarePost);
            VarePost.SetRange("Serial No.", TempRelation."Færdigvare serienr.");
            if VarePost.FindFirst then;
            Item.Get(VarePost."Item No.");
            OpdaterSerieNr."Færdigvare serienr." := TempRelation."Færdigvare serienr.";//VarePost."Serial No.";
            OpdaterSerieNr."Færdigvarenr." := VarePost."Item No.";
            OpdaterSerieNr.Færdigvarebeskrivelse := Item.Description;

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

