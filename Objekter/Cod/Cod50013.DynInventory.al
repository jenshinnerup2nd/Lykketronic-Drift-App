codeunit 50013 DynInventory
{
    [EventSubscriber(ObjectType::Report, report::"Calculate Inventory", OnBeforeInsertItemJnlLine, '', false, false)]
    procedure CalculateInventory_OnBeforeInsertItemJnlLine(var ItemJournalLine: Record "Item Journal Line")
    var
        Dynitem: Record Item;
    begin
        if Dynitem.Get(ItemJournalLine."Item No.") then begin
            ItemJournalLine.NaviNo := Dynitem.NaviNo;
            ItemJournalLine."Bin Code" := Dynitem."Shelf No.";
        end;
    end;
}
