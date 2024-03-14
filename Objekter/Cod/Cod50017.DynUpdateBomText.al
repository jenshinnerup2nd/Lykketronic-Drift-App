codeunit 50017 DynUpdateBomText
{
    trigger OnRun()
    var
        NAL_Item: Record Item;
    begin
        if NAL_Item.FindFirst() then
            repeat
                NAL_onUpdateItem(NAL_Item);
            until NAL_Item.next = 0
    end;

    procedure NAL_onUpdateItem(var Rec: Record Item)

    var
        ProdBomLine: Record "Production BOM Line";
        prodbomHeader: Record "Production BOM Header";
    begin

        IF (Rec.Description <> '') OR (Rec."Base Unit of Measure" <> '') THEN BEGIN
            ProdBOMLine.SETCURRENTKEY(Type, "No.");
            ProdBOMLine.SETRANGE(Type, ProdBOMLine.Type::Item);
            ProdBOMLine.SETRANGE("No.", Rec."No.");
            IF ProdBOMLine.FINDSET THEN
                REPEAT
                    ProdBOMHeader.GET(ProdBOMLine."Production BOM No.");
                    IF (ProdBOMHeader.Status <> ProdBOMHeader.Status::Closed) THEN BEGIN
                        ProdBOMLine.Description := Rec.Description;
                        ProdBOMLine."Unit of Measure Code" := Rec."Base Unit of Measure";
                        ProdBOMLine.MODIFY;
                    END;
                UNTIL ProdBOMLine.NEXT = 0;

        END;
    end;                                                                                  // :110314
}
