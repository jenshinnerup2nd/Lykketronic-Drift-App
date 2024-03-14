//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50019 "Opret serienummerrelation New2"
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
                        VarePost."Serial No." := ValueRegField; //TempRelation."Færdigvare serienr.";
                        //VarePost."Order No." := ProdNr;
                        VarePost.Positive := true;
                        VarePost."Entry Type" := VarePost."entry type"::Output;
                        SerieNrFunktion.FindSerieNrPostNew(VarePost);
                        //er der type Forbrug er det ikke en færdigvare
                        Clear(VareTjek);
                        VareTjek.SetCurrentkey("Item No.", Open, "Variant Code", Positive, "Expiration Date", "Lot No.", "Serial No.");
                        VareTjek.SetFilter(Positive, '=%1', false);
                        VareTjek.SetRange("Serial No.", VarePost."Serial No.");
                        VareTjek.SetRange("Order Type", 1);
                        VareTjek.SetRange("Entry Type", VareTjek."entry type"::Consumption);
                        if VareTjek.FindFirst then begin
                            VarePost.Description := '';
                        end;
                        if VarePost.Description <> '' then begin
                            GemFærdig := VarePost."Serial No.";
                            FiItem := VarePost."Item No.";
                            TempRelation."Færdigvare serienr." := GemFærdig;
                            TempRelation."Råvare serienr." := '';
                            SvarText := '';
                            CurrPage.Serienummerliste.Page.DYNRefreshPage(GemFærdig);
                            CurrPage.Serienummerliste.Page.Update(true);
                        end else begin
                            //så er det råvareserienummer
                            if GemFærdig <> '' then begin
                                Clear(VarePost);
                                VarePost."Serial No." := ValueRegField;
                                //VarePost."Order No." := ProdNr;
                                VarePost.Positive := false;
                                VarePost."Entry Type" := VarePost."entry type"::Consumption;
                                SerieNrFunktion.FindSerieNrPostNew(VarePost);
                                if VarePost.Description <> '' then begin
                                    //SRN findes råvare i stykliste på FV
                                    Found := false;
                                    BOMBuffer.DeleteAll;
                                    FItem.SetFilter("No.", FiItem);
                                    if FItem.FindFirst then begin
                                        if (FItem.HasBOM) then begin
                                            CalcBOMTree.GenerateTreeForItems(FItem, BOMBuffer, 0);
                                            if BOMBuffer.FindSet then
                                                repeat
                                                    if BOMBuffer."No." = VarePost."Item No." then begin
                                                        Found := true;
                                                    end;
                                                until (BOMBuffer.Next = 0) or (Found = true);
                                        end;
                                        if Found = true then begin
                                            SvarText := StrSubstNo('Serienr %1 på %2 fundet', VarePost."Serial No.", VarePost.Description);
                                        end else begin
                                            Error('Råvarenummer %1 ikke fundet i stykliste %2', VarePost."Item No.", FItem."Production BOM No.");
                                        end;
                                    end else begin
                                        Error('Fejl i færdigvarenummer %1', FiItem);
                                    end;
                                end else begin
                                    Error('Serienummer %1 ikke fundet', ValueRegField);
                                end;
                                TempRelation."Råvare serienr." := ValueRegField;
                                OpdaterRelationer;
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
    begin
        if (TempRelation."Færdigvare serienr." <> '') and
           (TempRelation."Råvare serienr." <> '') and
           (ProdNr <> '') then begin
            OpdaterSerieNr.Init;
            Clear(VarePost);
            VarePost."Serial No." := TempRelation."Råvare serienr.";
            SerieNrFunktion.FindSerieNrPostNew(VarePost);
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
            //VarePost."Order No." := ProdNr;
            VarePost.Positive := true;
            //SerieNrFunktion.FindSerieNrPost(VarePost);
            VarePost."Entry Type" := VarePost."entry type"::Output;
            SerieNrFunktion.FindSerieNrPostNew(VarePost);
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

