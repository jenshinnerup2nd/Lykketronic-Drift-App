//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50006 Serienummerrelation
{

    trigger OnRun()
    begin
        KaldSerieNrStyring('80417');
    end;

    var
        VarePost: Record "Item Ledger Entry";
        Vare: Record Item;
        SerieNrRelation: Record Serienummerrelaton;
        SerieNrOpdatering: Page "Opret serienummerrelation";
        SerieNrOpdateringNew: Page "Opret serienummerrelation New";


    procedure FindSerieNrPost(var LokVarePost: Record "Item Ledger Entry")
    begin
        Clear(VarePost);
        VarePost.SetCurrentkey("Item No.", Open, "Variant Code", Positive, "Expiration Date", "Lot No.", "Serial No.");
        //VarePost.SETRANGE(Open,TRUE);
        VarePost.SetRange(Positive, LokVarePost.Positive);
        VarePost.SetRange("Serial No.", LokVarePost."Serial No.");
        VarePost.SetRange("Order Type", 1);
        VarePost.SetRange("Order No.", LokVarePost."Order No.");
        if VarePost.FindFirst then begin
            Vare.Get(VarePost."Item No.");
            VarePost.Description := Vare.Description;
        end;
        LokVarePost.Copy(VarePost);
    end;


    procedure KaldSerieNrStyring(ProdNr: Code[20])
    begin

        if ProdNr = '' then exit;

        Clear(SerieNrOpdatering);
        SerieNrOpdatering.ProdOrdre(ProdNr);
        SerieNrOpdatering.RunModal;
    end;


    procedure FindFaktura(VareNr: Code[20]; SerieNr: Code[20]) FakNr: Code[20]
    var
        "LokVærdiPost": Record "Value Entry";
    begin
        Clear(FakNr);

        if (VareNr = '') or
           (SerieNr = '') then
            exit(FakNr);

        Clear(VarePost);
        VarePost.SetCurrentkey("Item No.", Open, "Variant Code", Positive, "Expiration Date", "Lot No.", "Serial No.");
        VarePost.SetRange("Item No.", VareNr);
        VarePost.SetRange("Serial No.", SerieNr);
        if VarePost.FindFirst then begin
            Clear(LokVærdiPost);
            LokVærdiPost.SetCurrentkey("Item Ledger Entry No.");
            LokVærdiPost.SetRange("Item Ledger Entry No.", VarePost."Entry No.");
            LokVærdiPost.SetRange("Item Ledger Entry Type", 1);
            LokVærdiPost.SetRange("Document Type", 2);
            LokVærdiPost.SetRange("Entry Type", 0);
            if LokVærdiPost.FindFirst then
                exit(LokVærdiPost."Document No.");
        end;
        exit('');
    end;


    procedure KaldSerieNrStyringNew(ProdNr: Code[20])
    begin

        if ProdNr = '' then exit;

        Clear(SerieNrOpdateringNew);
        SerieNrOpdateringNew.ProdOrdre(ProdNr);
        SerieNrOpdateringNew.RunModal;
    end;


    procedure FindSerieNrPostNew(var LokVarePost: Record "Item Ledger Entry")
    begin
        Clear(VarePost);
        VarePost.SetCurrentkey("Item No.", Open, "Variant Code", Positive, "Expiration Date", "Lot No.", "Serial No.");
        VarePost.SetRange(Positive, LokVarePost.Positive);
        VarePost.SetRange("Serial No.", LokVarePost."Serial No.");
        VarePost.SetRange("Order Type", 1);
        if VarePost.FindFirst then begin
            Vare.Get(VarePost."Item No.");
            VarePost.Description := Vare.Description;
        end;
        LokVarePost.Copy(VarePost);
    end;
}



