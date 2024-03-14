codeunit 50007 DynPurchase
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", OnBeforeReleasePurchaseDoc, '', false, false)]
    procedure NAL_OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean)
    var
        PurchaseLine: Record "Purchase Line";
    begin
        If PreviewMode = false then begin
            PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
            PurchaseLine.SETRANGE(Type, PurchaseLine.Type::Item);
            IF PurchaseLine.FIND('-') THEN
                REPEAT
                    PurchaseLine."Planning Flexibility" := PurchaseLine."Planning Flexibility"::None;
                    PurchaseLine.MODIFY(FALSE);
                UNTIL PurchaseLine.NEXT = 0;
        end;
    end;
}
