//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 72000 "FieldExport Functions"
{

    trigger OnRun()
    begin
        FieldTable.SetRange(TableNo, 1, 1999999999);
        // ExportFile.Create('C:\temp\field_'+DelChr(Cu1.ApplicationVersion,'=','\')+'.txt');
        // ExportFile.TextMode(true);


        FieldTable.FindFirst;
        repeat
            Clear(ExportLine);
            ExportLine := Format(FieldTable.TableNo);
            ExportLine := PadStr(ExportLine, 10);
            ExportLine := ExportLine + Format(FieldTable."No.");
            ExportLine := PadStr(ExportLine, 20);
            ExportLine := ExportLine + FieldTable.FieldName;
            ExportLine := PadStr(ExportLine, 50);
            I := FieldTable.Type;
            ExportLine := ExportLine + Format(I);
            ExportLine := PadStr(ExportLine, 60);
            ExportLine := ExportLine + Format(FieldTable.Len);
            ExportLine := PadStr(ExportLine, 70);
            I := FieldTable.Class;
            ExportLine := ExportLine + Format(I);
            ExportLine := PadStr(ExportLine, 80);
            if FieldTable.Enabled then
                I := 1
            else
                I := 0;
            ExportLine := ExportLine + Format(I);
            ExportLine := PadStr(ExportLine, 81);
            ExportLine := ExportLine + FieldTable.TableName;
            ExportLine := PadStr(ExportLine, 111);
            ExportLine := ExportLine + FieldTable."Field Caption";
        // ExportFile.Write(ExportLine);
        until FieldTable.Next = 0;

        // ExportFile.Close;
    end;

    var
        FieldTable: Record "Field";
        ExportLine: Text[250];
        ExportFile: File;
        I: Integer;
        //Cu1: Codeunit ApplicationManagement;
        "Object": Record AllObj;
        FieldRecord: Record Field;
        TEMPObject: Record AllObj temporary;
        FieldBuffer: Record "Field Compare Table";


    procedure CreatePreviusFromCurrentDB()
    var
        FieldBufferLocal: Record "Field Compare Table";
        FieldTableLocal: Record "Field";
    begin
        if FieldBufferLocal.Count <> 0 then
            Error('Kan kun afvikles når bufferen er tom');

        FieldTableLocal.Reset;
        FieldTableLocal.SetRange(TableNo, 1, 1999999999);

        FieldTableLocal.FindFirst;
        repeat
            Clear(FieldBufferLocal);
            FieldBufferLocal.Table := FieldTableLocal.TableNo;
            FieldBufferLocal.FieldNo := FieldTableLocal."No.";
            FieldBufferLocal."Class Prev" := FieldTableLocal.Class;
            FieldBufferLocal.TableName := FieldTableLocal.TableName;
            case FieldTableLocal.Type of
                4912:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::TableFilter;
                4988:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::RecordID;
                11519, 31488:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Text;
                11775:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Date;
                11776:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Time;
                11797:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::DateFormula;
                12799:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Decimal;
                33791:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Binary;
                33793:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Blob;
                34047:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Boolean;
                34559:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Integer;
                35071, 31489:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Code;
                35583:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Option;
                36095:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::BigInteger;
                36863:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Duration;
                37119:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::Guid;
                37375:
                    FieldBufferLocal."Type Prev" := FieldBufferLocal."type prev"::DateTime;
            end;
            FieldBufferLocal."Name Prev" := FieldTableLocal.FieldName;
            FieldBufferLocal."Len Prev" := FieldTableLocal.Len;
            FieldBufferLocal."Caption Prev" := FieldTableLocal."Field Caption";
            FieldBufferLocal.Insert;
        until FieldTableLocal.Next = 0;
    end;


    procedure "Mark up deleted fields 6.04"()
    begin
        //Dette er listen over de tabeller hvori alle brugerdefinerede felter udgår

        InsertTEMPObject(3);
        InsertTEMPObject(4);
        InsertTEMPObject(6);
        InsertTEMPObject(9);
        InsertTEMPObject(10);

        InsertTEMPObject(17);
        InsertTEMPObject(43);
        InsertTEMPObject(44);
        InsertTEMPObject(77);
        InsertTEMPObject(79);
        InsertTEMPObject(92);
        InsertTEMPObject(97);
        InsertTEMPObject(98);
        InsertTEMPObject(204);
        InsertTEMPObject(225);
        InsertTEMPObject(233);
        InsertTEMPObject(260);
        InsertTEMPObject(270);
        InsertTEMPObject(291);
        InsertTEMPObject(311);
        InsertTEMPObject(312);
        InsertTEMPObject(313);
        InsertTEMPObject(330);
        InsertTEMPObject(349);

        InsertTEMPObject(5055);
        InsertTEMPObject(5061);
        InsertTEMPObject(5065);
        InsertTEMPObject(5076);
        InsertTEMPObject(5080);
        InsertTEMPObject(5092);
        InsertTEMPObject(5717);
        InsertTEMPObject(5723);

        InsertTEMPObject(5802);

        InsertTEMPObject(7004);
        InsertTEMPObject(6036473);
        InsertTEMPObject(6036509);
        //InsertTEMPObject(6036510);
        InsertTEMPObject(6036654);
        InsertTEMPObject(6036655);
        InsertTEMPObject(6036657);
        InsertTEMPObject(6036658);
        InsertTEMPObject(6036666);
        InsertTEMPObject(6036678);
        InsertTEMPObject(6036687);
        InsertTEMPObject(6036912);
        InsertTEMPObject(6037023);
        InsertTEMPObject(6037061);
        InsertTEMPObject(6037063);
        //InsertTEMPObject(6037100);
        InsertTEMPObject(6037116);
        InsertTEMPObject(6037119);
        InsertTEMPObject(6037204);
        InsertTEMPObject(6037317);
        InsertTEMPObject(6037319);

        //Genneml¢b objekterne
        Object.Reset;
        Object.SetRange(Object."Object Type", Object."Object Type"::Table);
        //Object.SetRange("Company Name",'');
        //Vi kan ikke ryde op i felter der indgår i portal-tabellerne da de her har flere brugerdefinerede felter
        //end der er i det ¢vrige system.
        Object.SetFilter(Object."Object ID", '%1..%2|%3..%4|%5..%6', 1, 49999, 66500, 68999, 6036500, 6038099);

        Object.FindFirst;
        repeat
            FieldRecord.Reset;
            FieldRecord.SetRange(TableNo, Object."Object ID");
            //Alle brugerdefinerede felter
            if TEMPObject.Get(1, '', Object."Object ID") then begin
                FieldBuffer.Reset;
                FieldBuffer.SetRange(Table, Object."Object ID");
                FieldBuffer.SetFilter(FieldNo, '6038401..6038454');
                if FieldBuffer.FindSet then
                    repeat
                        "Mark up for deletion"(FieldBuffer.Table, FieldBuffer.FieldNo);
                    until FieldBuffer.Next = 0;
            end else begin
                FieldRecord.SetRange(TableNo, Object."Object ID");
                FieldRecord.SetFilter("No.", '%1..%2', 6038401, 6038454);
                if FieldRecord.FindFirst then
                    repeat
                        if FieldBuffer.Get(FieldRecord.TableNo, FieldRecord."No.") then
                            case FieldBuffer.FieldNo of
                                6038401, 6038402, 6038403:
                                    if FieldBuffer.Get(FieldRecord.TableNo, FieldRecord."No.") then begin
                                        FieldBuffer."Type New" := FieldBuffer."type new"::Decimal;
                                        FieldBuffer."Len New" := 12;
                                        FieldBuffer."Byte New" := 0;
                                        FieldBuffer."Class New" := FieldBuffer."class new"::Normal;
                                        FieldBuffer.Field := FieldBuffer.Field::" ";
                                    end;
                                6038411, 6038412, 6038413, 6038414, 6038415:
                                    if FieldBuffer.Get(FieldRecord.TableNo, FieldRecord."No.") then begin
                                        FieldBuffer."Type New" := FieldBuffer."type new"::Code;
                                        FieldBuffer."Len New" := 20;
                                        FieldBuffer."Byte New" := 0;
                                        FieldBuffer."Class New" := FieldBuffer."class new"::Normal;
                                        FieldBuffer.Field := FieldBuffer.Field::" ";
                                    end;
                                6038421:
                                    if FieldBuffer.Get(FieldRecord.TableNo, FieldRecord."No.") then begin
                                        FieldBuffer."Type New" := FieldBuffer."type new"::Text;
                                        FieldBuffer."Len New" := 50;
                                        FieldBuffer."Byte New" := 0;
                                        FieldBuffer."Class New" := FieldBuffer."class new"::Normal;
                                        FieldBuffer.Field := FieldBuffer.Field::" ";
                                    end;
                                6038431, 6038432, 6038433, 6038434, 6038435:
                                    if FieldBuffer.Get(FieldRecord.TableNo, FieldRecord."No.") then begin
                                        FieldBuffer."Type New" := FieldBuffer."type new"::Boolean;
                                        FieldBuffer."Len New" := 4;
                                        FieldBuffer."Byte New" := 0;
                                        FieldBuffer."Class New" := FieldBuffer."class new"::Normal;
                                        FieldBuffer.Field := FieldBuffer.Field::" ";
                                    end;
                                6038444:
                                    if FieldBuffer.Get(FieldRecord.TableNo, FieldRecord."No.") then begin
                                        FieldBuffer."Type New" := FieldBuffer."type new"::Time;
                                        FieldBuffer."Len New" := 4;
                                        FieldBuffer."Byte New" := 0;
                                        FieldBuffer."Class New" := FieldBuffer."class new"::Normal;
                                        FieldBuffer.Field := FieldBuffer.Field::" ";
                                    end;
                                6038450, 6038451, 6038452:
                                    if FieldBuffer.Get(FieldRecord.TableNo, FieldRecord."No.") then begin
                                        FieldBuffer."Type New" := FieldBuffer."type new"::Date;
                                        FieldBuffer."Len New" := 4;
                                        FieldBuffer."Byte New" := 0;
                                        FieldBuffer."Class New" := FieldBuffer."class new"::Normal;
                                        FieldBuffer.Field := FieldBuffer.Field::" ";
                                    end;
                                else begin
                                    FieldBuffer."Name New" := '';
                                    FieldBuffer."Class New" := 0;
                                    FieldBuffer."Type New" := FieldBuffer."type new"::" ";
                                    FieldBuffer."Len New" := 0;
                                    FieldBuffer."Caption New" := '';
                                    FieldBuffer."Byte New" := 0;
                                    FieldBuffer.Field := FieldBuffer.Field::"Deleted Field";
                                end;
                            end;

                        if (FieldBuffer."Name Prev" = '') and (FieldBuffer."Name New" <> '') then
                            FieldBuffer.Field := FieldBuffer.Field::"New Field"
                        else begin
                            if FieldBuffer."Name New" = '' then
                                FieldBuffer.Field := FieldBuffer.Field::"Deleted Field";
                            if FieldBuffer."Name Prev" <> FieldBuffer."Name New" then
                                FieldBuffer."Name Conflict" := true;
                            if FieldBuffer."Caption Prev" <> FieldBuffer."Caption New" then
                                FieldBuffer."Caption Conflict" := true;
                            if FieldBuffer."Class Prev" <> FieldBuffer."Class New" then begin
                                FieldBuffer."Class Change" := true;
                            end;
                            if FieldBuffer."Type Prev" <> FieldBuffer."Type New" then begin
                                FieldBuffer."Type Change" := true;
                            end;
                            if (FieldBuffer."Type Prev" = FieldBuffer."type prev"::Text) or
                              (FieldBuffer."Type Prev" = FieldBuffer."type prev"::Code) or
                              (FieldBuffer."Type New" = FieldBuffer."type new"::Text) or
                              (FieldBuffer."Type New" = FieldBuffer."type new"::Code) then
                                if FieldBuffer."Len Prev" > FieldBuffer."Len New" then
                                    FieldBuffer."Len Change" := true;
                            if (FieldBuffer.Field = FieldBuffer.Field::"Deleted Field") or
                              FieldBuffer."Class Change" or
                              FieldBuffer."Type Change" or
                              FieldBuffer."Len Change" then
                                FieldBuffer.UpdateHandle := true;
                        end;

                        FieldBuffer.Modify;
                    until FieldRecord.Next = 0;
            end;
        until Object.Next = 0;
    end;


    procedure "Mark up CORNATOR fields"()
    begin
        "Mark up for deletion"(38, 6014350);
        "Mark up for deletion"(38, 6014351);
        "Mark up for deletion"(38, 6014352);
        "Mark up for deletion"(38, 6014356);
        "Mark up for deletion"(38, 6014357);
        "Mark up for deletion"(38, 6014358);
        "Mark up for deletion"(38, 6014359);
        "Mark up for deletion"(38, 6014360);
        "Mark up for deletion"(38, 6014361);
        "Mark up for deletion"(38, 6014362);
        "Mark up for deletion"(38, 6016800);
        "Mark up for deletion"(38, 6016801);
        "Mark up for deletion"(5200, 6038401);
        "Mark up for deletion"(5200, 6038402);
        "Mark up for deletion"(5200, 6038403);
        "Mark up for deletion"(5200, 6038411);
        "Mark up for deletion"(5200, 6038412);
        "Mark up for deletion"(5200, 6038413);
        "Mark up for deletion"(5200, 6038414);
        "Mark up for deletion"(5200, 6038415);
        "Mark up for deletion"(5200, 6038421);
        "Mark up for deletion"(5200, 6038431);
        "Mark up for deletion"(5200, 6038432);
        "Mark up for deletion"(5200, 6038433);
        "Mark up for deletion"(5200, 6038434);
        "Mark up for deletion"(5200, 6038435);
        "Mark up for deletion"(5200, 6038444);
        "Mark up for deletion"(5200, 6038450);
        "Mark up for deletion"(5200, 6038451);
        "Mark up for deletion"(5200, 6038452);
        "Mark up for deletion"(6038400, 411);
        "Mark up for deletion"(6038400, 412);
        "Mark up for deletion"(6038400, 501);
        "Mark up for deletion"(6038400, 502);
        "Mark up for deletion"(6038400, 503);
        "Mark up for deletion"(6038400, 504);
        "Mark up for deletion"(6038400, 511);
        "Mark up for deletion"(6038400, 512);
        "Mark up for deletion"(6038400, 513);
        "Mark up for deletion"(6038400, 514);
        "Mark up for deletion"(6038400, 521);
        "Mark up for deletion"(6038400, 522);
        "Mark up for deletion"(6038400, 523);
        "Mark up for deletion"(6038400, 524);
        "Mark up for deletion"(6038400, 531);
        "Mark up for deletion"(6038400, 532);
        "Mark up for deletion"(6038400, 533);
        "Mark up for deletion"(6038400, 534);
        "Mark up for deletion"(6038400, 541);
        "Mark up for deletion"(6038400, 542);
        "Mark up for deletion"(6038400, 543);
        "Mark up for deletion"(6038400, 544);
        "Mark up for deletion"(6038400, 551);
        "Mark up for deletion"(6038400, 552);
        "Mark up for deletion"(6038400, 553);
        "Mark up for deletion"(6038400, 554);
        "Mark up for deletion"(6038400, 555);
        "Mark up for deletion"(6038400, 561);
        "Mark up for deletion"(6038400, 562);
        "Mark up for deletion"(6038400, 563);
        "Mark up for deletion"(6038400, 564);
        "Mark up for deletion"(6038400, 565);
        "Mark up for deletion"(6038400, 571);
        "Mark up for deletion"(6038400, 572);
        "Mark up for deletion"(6038400, 573);
        "Mark up for deletion"(6038400, 574);
        "Mark up for deletion"(6038400, 575);
        "Mark up for deletion"(6038400, 581);
        "Mark up for deletion"(6038400, 582);
        "Mark up for deletion"(6038400, 583);
        "Mark up for deletion"(6038400, 584);
        "Mark up for deletion"(6038400, 585);
        "Mark up for deletion"(6038400, 591);
        "Mark up for deletion"(6038400, 592);
        "Mark up for deletion"(6038400, 593);
        "Mark up for deletion"(6038400, 594);
        "Mark up for deletion"(6038400, 595);
        "Mark up for deletion"(6038400, 601);
        "Mark up for deletion"(6038400, 602);
        "Mark up for deletion"(6038400, 603);
        "Mark up for deletion"(6038400, 611);
        "Mark up for deletion"(6038400, 612);
        "Mark up for deletion"(6038400, 613);
        "Mark up for deletion"(6038400, 621);
        "Mark up for deletion"(6038400, 622);
        "Mark up for deletion"(6038400, 623);
        "Mark up for deletion"(6038400, 631);
        "Mark up for deletion"(6038400, 632);
        "Mark up for deletion"(6038400, 633);
        "Mark up for deletion"(6038400, 641);
        "Mark up for deletion"(6038400, 642);
        "Mark up for deletion"(6038400, 651);
        "Mark up for deletion"(6038400, 652);
        "Mark up for deletion"(6038400, 653);
        "Mark up for deletion"(6038400, 654);
        "Mark up for deletion"(6038400, 661);
        "Mark up for deletion"(6038400, 662);
        "Mark up for deletion"(6038400, 663);
        "Mark up for deletion"(6038400, 664);
        "Mark up for deletion"(6038400, 671);
        "Mark up for deletion"(6038400, 672);
        "Mark up for deletion"(6038400, 673);
        "Mark up for deletion"(6038400, 674);
        "Mark up for deletion"(6038400, 681);
        "Mark up for deletion"(6038400, 682);
        "Mark up for deletion"(6038400, 683);
        "Mark up for deletion"(6038400, 684);
        "Mark up for deletion"(6038400, 691);
        "Mark up for deletion"(6038400, 692);
        "Mark up for deletion"(6038400, 693);
        "Mark up for deletion"(6038400, 694);
        "Mark up for deletion"(6038400, 701);
        "Mark up for deletion"(6038400, 702);
        "Mark up for deletion"(6038400, 703);
        "Mark up for deletion"(6038400, 704);
        "Mark up for deletion"(6038400, 705);
        "Mark up for deletion"(6038400, 706);
        "Mark up for deletion"(6038400, 707);
        "Mark up for deletion"(6038400, 708);
        "Mark up for deletion"(6038400, 709);
        "Mark up for deletion"(6038400, 710);
        "Mark up for deletion"(6038400, 711);
        "Mark up for deletion"(6038400, 712);
        "Mark up for deletion"(6038400, 713);
        "Mark up for deletion"(6038400, 714);
        "Mark up for deletion"(6038400, 715);
        "Mark up for deletion"(6038400, 721);
        "Mark up for deletion"(6038400, 722);
        "Mark up for deletion"(6038400, 723);
        "Mark up for deletion"(6038400, 724);
        "Mark up for deletion"(6038400, 725);
        "Mark up for deletion"(6038400, 726);
        "Mark up for deletion"(6038400, 727);
        "Mark up for deletion"(6038400, 728);
        "Mark up for deletion"(6038400, 729);
        "Mark up for deletion"(6038400, 730);
        "Mark up for deletion"(6038400, 731);
        "Mark up for deletion"(6038400, 732);
        "Mark up for deletion"(6038400, 733);
        "Mark up for deletion"(6038400, 734);
        "Mark up for deletion"(6038400, 735);
        "Mark up for deletion"(6038400, 736);
        "Mark up for deletion"(6038400, 737);
        "Mark up for deletion"(6038400, 738);
        "Mark up for deletion"(6038400, 739);
        "Mark up for deletion"(6038400, 740);
        "Mark up for deletion"(6038400, 741);
        "Mark up for deletion"(6038400, 742);
        "Mark up for deletion"(6038400, 743);
        "Mark up for deletion"(6038400, 744);
        "Mark up for deletion"(6038400, 745);
        "Mark up for deletion"(6038400, 751);
        "Mark up for deletion"(6038400, 752);
        "Mark up for deletion"(6038400, 753);
        "Mark up for deletion"(6038400, 754);
        "Mark up for deletion"(6038400, 755);
        "Mark up for deletion"(6038400, 756);
        "Mark up for deletion"(6038400, 757);
        "Mark up for deletion"(6038400, 758);
        "Mark up for deletion"(6038400, 759);
        "Mark up for deletion"(6038400, 760);
        "Mark up for deletion"(6038400, 761);
        "Mark up for deletion"(6038400, 762);
        "Mark up for deletion"(6038400, 763);
        "Mark up for deletion"(6038400, 764);
        "Mark up for deletion"(6038400, 765);
        "Mark up for deletion"(6038400, 766);
        "Mark up for deletion"(6038400, 767);
        "Mark up for deletion"(6038400, 768);
        "Mark up for deletion"(6038400, 769);
        "Mark up for deletion"(6038400, 770);
        "Mark up for deletion"(6038400, 771);
        "Mark up for deletion"(6038400, 772);
        "Mark up for deletion"(6038400, 773);
        "Mark up for deletion"(6038400, 774);
        "Mark up for deletion"(6038400, 781);
        "Mark up for deletion"(6038400, 782);
        "Mark up for deletion"(6038400, 783);
        "Mark up for deletion"(6038400, 784);
        "Mark up for deletion"(6038400, 791);
        "Mark up for deletion"(6038400, 792);
        "Mark up for deletion"(6038400, 793);
        "Mark up for deletion"(6038400, 794);
        "Mark up for deletion"(6038400, 801);
        "Mark up for deletion"(6038400, 802);
        "Mark up for deletion"(6038400, 803);
        "Mark up for deletion"(6038400, 804);
        "Mark up for deletion"(6038400, 811);
        "Mark up for deletion"(6038400, 812);
        "Mark up for deletion"(6038400, 813);
        "Mark up for deletion"(6038400, 814);
        "Mark up for deletion"(6038400, 821);
        "Mark up for deletion"(6038400, 822);
        "Mark up for deletion"(6038400, 823);
        "Mark up for deletion"(6038400, 824);
        "Mark up for deletion"(6038400, 825);
        "Mark up for deletion"(6038400, 826);
        "Mark up for deletion"(6038400, 827);
        "Mark up for deletion"(6038400, 828);
        "Mark up for deletion"(6038400, 829);
        "Mark up for deletion"(6038400, 830);
        "Mark up for deletion"(6038402, 403);
        //"Mark up for deletion"(6038402,415);
        //"Mark up for deletion"(6038402,416);
        "Mark up for deletion"(6038402, 450);
        "Mark up for deletion"(6038402, 451);
        "Mark up for deletion"(6038402, 452);
        "Mark up for deletion"(6038402, 453);
        "Mark up for deletion"(6038402, 454);
        "Mark up for deletion"(6038402, 455);
        "Mark up for deletion"(6038402, 456);
        "Mark up for deletion"(6038402, 457);
        "Mark up for deletion"(6038402, 458);
        "Mark up for deletion"(6038402, 459);
        "Mark up for deletion"(6038402, 460);
        "Mark up for deletion"(6038402, 470);
        "Mark up for deletion"(6038402, 471);
        "Mark up for deletion"(6038402, 472);
        "Mark up for deletion"(6038402, 473);
        "Mark up for deletion"(6038402, 474);
        "Mark up for deletion"(6038403, 405);
        "Mark up for deletion"(6038403, 448);
    end;


    procedure InsertTEMPObject(TableNoPar: Integer)
    begin
        TEMPObject."Object Type" := TEMPObject."Object Type"::Table;
        TEMPObject."Object ID" := TableNoPar;
        TEMPObject."Object Name" := Object."Object Name";
        //TEMPObject."Company Name":=COMPANYNAME;
        TEMPObject.Insert;
    end;


    procedure "Mark up for deletion"(TableParam: Integer; FieldParam: Integer)
    var
        FieldbufferLocal: Record "Field Compare Table";
    begin
        if FieldbufferLocal.Get(TableParam, FieldParam) then begin
            FieldbufferLocal."Name New" := '';
            FieldbufferLocal."Class New" := 0;
            FieldbufferLocal."Type New" := FieldBuffer."type new"::" ";
            FieldbufferLocal."Len New" := 0;
            FieldbufferLocal."Caption New" := '';
            FieldbufferLocal."Byte New" := 0;
            FieldbufferLocal.UpdateHandle := true;
            FieldbufferLocal.Field := FieldBuffer.Field::"Deleted Field";
            FieldbufferLocal.Modify;
        end;
    end;
}

