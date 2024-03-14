//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50000 "split prodBom"
{
    // jan2014 VD/age: "udfoldning" af styklister fra Axapta variant-struktur til ikke-variant
    //                  ingen regel for "basis-stykliste eller ej" har kunnet defineres, derfor to funktioner
    // 110314 VD/age: tilf¢jet stempling af nr. på tilh¢rende vare


    trigger OnRun()
    begin
        dlg.Open('#1######################  #2######################');
        prodBom.SetRange(Status, 0, 1);
        //prodBom.SETRANGE("Search Name", '100811');
        prodBom.SetRange("Search Name", '910052');
        prodBom.FindFirst;
        // splitBOM(prodBom."No.");   // one or two levels? cannot be decided ->  RUN FROM PAGE 99000786 !!
    end;

    var
        pt: Record "Payment Terms";
        item: Record Item;
        itemVar: Record "Item Variant";
        axItem: Record "Axapta Items";
        configChoice: Record "ConfigChoice Axapta";
        uom: Record "Item Unit of Measure";
        naviPost: Record "VarePost statistik";
        itemJnlLine: Record "Item Journal Line";
        prodBom: Record "Production BOM Header";
        prodBomINS: Record "Production BOM Header";
        prodBomBase: Record "Production BOM Header";
        prodBomLine: Record "Production BOM Line";
        prodBomLineINS: Record "Production BOM Line";
        streamInTest: InStream;
        c: Integer;
        l: Integer;
        p: Integer;
        baseFound: Integer;
        qty: Decimal;
        txt: Text[1024];
        myfile: File;
        dlg: Dialog;


    procedure baseBOM(bomNo: Code[20])
    begin
        if not prodBom.Get(bomNo) then
            Error('Styklistenr skal angives');
        ////IF NOT CONFIRM('Dan basis stykliste %1?', FALSE, prodBom."Search Name") THEN EXIT;

        prodBom."Search Name" := CopyStr(prodBom."Search Name", 1, 6);

        if prodBomINS.Get(prodBom."Search Name") then begin           // searchName = itemNo !
            prodBomINS.Delete;
            prodBomLineINS.SetRange("Production BOM No.", prodBomINS."No.");
            prodBomLineINS.DeleteAll;
        end;

        prodBomINS := prodBom;
        prodBomINS."No." := prodBom."Search Name";
        prodBomINS."Search Name" := prodBom."Search Name" + ' basis';
        prodBomINS."Description 2" := '(auto-basis)  ';
        prodBomINS."Creation Date" := Today();
        prodBomINS."Last Date Modified" := Today();
        prodBomINS.Status := 2;
        prodBomINS.Insert;

        prodBomLine.SetRange("Production BOM No.", bomNo);
        if prodBomLine.FindSet then
            repeat
                // tjek om VariantCode burde ha' været noget ..??
                configChoice.SetRange(item, prodBomINS."No.");
                configChoice.SetRange(chosenItem, CopyStr(prodBomLine."No.", 1, 6));
                configChoice.SetRange(configId, CopyStr(prodBomLine."No.", 8, 4));
                if configChoice.FindFirst then begin
                    prodBomLine."Variant Code" := configChoice.configId;
                    prodBomLine."No." := configChoice.chosenItem + '-' + configChoice.chosenConfig;
                    // if confirm('%1  %2  \s/v: %3', true, prodBomLine."No.", configChoice.configId, configChoice.chosenItem + '-' + configChoice.chosenConfig) then;
                end;
                //

                if prodBomLine."Variant Code" = '' then begin
                    if item.Get(prodBomLine."No.") then begin              // ~ variantgruppe brugt forkert
                        prodBomLineINS := prodBomLine;
                        prodBomLineINS."Production BOM No." := prodBomINS."No.";
                        prodBomLineINS."Scrap %" := 0;
                        prodBomLineINS.Insert;
                    end;
                end;
            until prodBomLine.Next = 0;
    end;


    procedure splitBOM(bomNo: Code[20])
    var
        ownerItem: Record Item;
    begin
        if bomNo = '' then
            Error('Styklistenr skal angives');

        if prodBom.Get(bomNo) then begin
            ////IF NOT CONFIRM('Udfold stykliste %1  %2?   \Vare %3 = ny styklistenr.', TRUE, prodBom."No.", prodBom.Description, prodBom."Search Name")  THEN EXIT;

            baseFound := 0;
            prodBom."Search Name" := CopyStr(prodBom."Search Name", 1, 6);

            if prodBomBase.Get(prodBom."Search Name") then
                baseFound := 1;

            itemVar.SetRange("Item No.", prodBom."Search Name", prodBom."Search Name" + '+');  //pga. dobbelt overf¢rsel af varianter
            if itemVar.FindSet then
                repeat
                    // if confirm('%1  %2', true, itemVar."Item No.", itemVar.Code) then;
                    if prodBomINS.Get(prodBom."Search Name" + '-' + itemVar.Code) then
                        prodBomINS.Delete;

                    prodBomINS := prodBom;
                    prodBomINS."No." := prodBom."Search Name" + '-' + itemVar.Code;
                    prodBomINS."Search Name" := prodBomINS."Search Name" + ' //' + itemVar.Code;
                    prodBomINS."Description 2" := '(auto-split)  ';
                    prodBomINS."Creation Date" := Today();
                    prodBomINS."Last Date Modified" := Today();
                    prodBomINS.Status := 2;
                    //IF NOT CONFIRM('INSERT: %1   %2   %3', TRUE, prodBomINS."No.", prodBomINS.Description, prodBomINS."Search Name")  THEN EXIT;
                    prodBomINS.Insert;
                    // 110314:
                    if ownerItem.Get(prodBomINS."No.") then begin
                        ownerItem."Production BOM No." := prodBomINS."No.";
                        ownerItem.Modify;
                    end;                                                                                      // :110314

                    prodBomLineINS.SetRange("Production BOM No.", prodBomINS."No.");
                    //if not confirm(' lines to delete: %1  %2', true, prodBomLineINS.count) then exit;
                    prodBomLineINS.DeleteAll;

                    if baseFound = 1 then begin
                        //CLEAR(prodBomLineINS);
                        prodBomLineINS."Production BOM No." := prodBomINS."No.";
                        prodBomLineINS."Version Code" := '';
                        prodBomLineINS."Line No." := 130;
                        prodBomLineINS.Type := 2;
                        prodBomLineINS."No." := prodBom."Search Name";
                        prodBomLineINS.Description := prodBom.Description;
                        prodBomLineINS.Position := '';
                        prodBomLineINS."Position 2" := '';
                        prodBomLineINS."Position 3" := '';
                        prodBomLineINS.Quantity := 1;
                        prodBomLineINS."Quantity per" := 1;
                        prodBomLineINS."Scrap %" := 0;
                        prodBomLineINS.Insert;
                    end;

                    prodBomLine.SetRange("Production BOM No.", bomNo);
                    if prodBomLine.FindSet then
                        repeat
                            //  checkVariant not reliably transformed:
                            if prodBomLine.Type = 1 then begin
                                p := StrPos(prodBomLine."No.", '-');
                                if p > 0 then begin
                                    configChoice.SetRange(item, CopyStr(prodBomINS."No.", 1, 6));
                                    configChoice.SetRange(chosenItem, CopyStr(prodBomLine."No.", 1, p - 1));
                                    configChoice.SetRange(configId, CopyStr(prodBomLine."No.", p + 1, StrLen(prodBomLine."No.")));
                                    if configChoice.FindFirst then begin
                                        prodBomLine."Variant Code" := configChoice.configId;
                                        prodBomLine."No." := configChoice.chosenItem + '-' + configChoice.chosenConfig;
                                        if item.Get(prodBomLine."No.") then
                                            prodBomLine.Description := item.Description;
                                        //if confirm('itemNo: %1  configId: %2  \s/v: %3', true,
                                        //   prodBomLine."No.", configChoice.configId, configChoice.chosenItem + '-' + configChoice.chosenConfig) then;
                                    end;
                                end;
                            end;

                            if (prodBomLine."Variant Code" = itemVar.Code)
                              or ((prodBomLine."Variant Code" = '') and (baseFound = 0)) then begin
                                prodBomLineINS := prodBomLine;
                                prodBomLineINS."Production BOM No." := prodBomINS."No.";
                                prodBomLineINS."Variant Code" := '';
                                prodBomLineINS."Scrap %" := 0;
                                //IF NOT CONFIRM('line: %1   %2   %3\var: %4', TRUE,
                                //  prodBomLineINS."Production BOM No.", prodBomLine.Type, prodBomLineINS."No.", prodBomLineINS."Variant Code")  THEN EXIT;
                                prodBomLineINS.Insert;
                            end;
                        until prodBomLine.Next = 0;

                until itemVar.Next = 0;
        end;
    end;


    procedure findVariant()
    begin
    end;
}

