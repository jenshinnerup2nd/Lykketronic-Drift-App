codeunit 50016 DynItem
{
    [EventSubscriber(ObjectType::Table, Database::Item, OnAfterModifyEvent, '', false, false)]

    procedure NAL_onUpdateItem(var Rec: Record Item; var xRec: Record Item)

    var
        ProdBomLine: Record "Production BOM Line";
        prodbomHeader: Record "Production BOM Header";
    begin

        IF (Rec.Description <> xRec.Description) OR (Rec."Base Unit of Measure" <> xRec."Base Unit of Measure") THEN BEGIN
            ProdBOMLine.SETCURRENTKEY(Type, "No.");
            ProdBOMLine.SETRANGE(Type, ProdBOMLine.Type::Item);
            ProdBOMLine.SETRANGE("No.", Rec."No.");
            IF ProdBOMLine.FINDSET THEN
                REPEAT
                    ProdBOMHeader.GET(ProdBOMLine."Production BOM No.");
                    IF (ProdBOMHeader.Status <> ProdBOMHeader.Status::Closed) THEN BEGIN
                        //IF CONFIRM('RETTER stykliste:\ %1     %2\fra:\%3    %4\til:\%5   %6', TRUE,
                        //  prodBomLine."Production BOM No.", prodBomHeader.Description, prodBomLine."Unit of Measure Code", prodBomLine.Description,
                        //      Rec."Base Unit of Measure", Rec.Description) THEN;
                        ProdBOMLine.Description := Rec.Description;
                        ProdBOMLine."Unit of Measure Code" := Rec."Base Unit of Measure";
                        ProdBOMLine.MODIFY;
                    END;
                UNTIL ProdBOMLine.NEXT = 0;

        END;
    end;


    [EventSubscriber(ObjectType::Page, Page::"Item Ledger Entries", OnAfterGetRecordEvent, '', false, false)]

    Procedure DYN_ShowItemName(var Rec: Record "Item Ledger Entry")
    var
        iItem: Record Item;
    begin
        //Dynalogic, SRN 05022015 Begin
        if iItem.Get(Rec."Item No.") then begin
            Rec.Description := iItem.Description;
        end else begin

        end;
        //Dynalogic, SRN 05022015 End
    end;                                                                               // :110314
}
