//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50012 "ProdBomLine Axapta"
{
    PageType = List;
    SourceTable = "ProdBomLine Axapta";
    ObsoleteState = Pending;
    ObsoleteReason = 'Delete this page when no longer needed. Old customer data';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Line; Rec.Line)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                }
                field(ItemNo; Rec.ItemNo)
                {
                    ApplicationArea = Basic;
                }
                field(ItemNo2; Rec.ItemNo2)
                {
                    ApplicationArea = Basic;
                }
                field(ItemBomId; Rec.ItemBomId)
                {
                    ApplicationArea = Basic;
                }
                field(ConfigGroupId; Rec.ConfigGroupId)
                {
                    ApplicationArea = Basic;
                }
                field(InventDimId; Rec.InventDimId)
                {
                    ApplicationArea = Basic;
                }
                field(txt; txt)
                {
                    ApplicationArea = Basic;
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = Basic;
                }
                field(qty; Rec.qty)
                {
                    ApplicationArea = Basic;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                }
                field(level; Rec.level)
                {
                    ApplicationArea = Basic;
                }
                field(seq; Rec.seq)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if item.Get(Rec.ItemNo) then
            txt := 'vare: ' + item.Description
        else
            txt := '';

        if item.Get(Rec.ItemNo + '-' + Rec.ItemNo2) then
            txt := '-Vare: ' + item.Description
        else
            txt := '';

        if Rec.ConfigGroupId > '' then begin
            configGrp.Get(Rec.ConfigGroupId);
            txt := 'CONFGRP: ' + configGrp.Description;
        end else
            txt := '';


        //if InventDimId <> 'Axapta'    allerede lagt i ItemNo2
    end;

    var
        invDim: Record Family;
        configTbl: Record "Item Variant";
        configGrp: Record "Standard Task";
        item: Record Item;
        txt: Text[80];
}

