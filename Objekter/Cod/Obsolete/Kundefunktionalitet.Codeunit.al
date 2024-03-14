//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50098 Kundefunktionalitet
{

    trigger OnRun()
    begin
    end;

    var
        VarePost: Record "Item Ledger Entry";
        SerieNrRelation: Record Serienummerrelaton;
        Vare: Record Item;
        SerieNumre: Record Serienummeruffer temporary;
        I: Integer;
        Intervaller: array[50, 2] of Text[20];
        DynSerialNumbers: Record DynSerialNumbers;


    procedure LevLinjeLavStreng(LevNr: Code[20]; LinjeNr: Integer; var LokBuffer: Record Serienummeruffer temporary) Streng: Text[1024]
    var
        OutStream: OutStream;
    begin
        Clear(LokBuffer);
        LokBuffer.DeleteAll;
        //Dynalogic, SRN 27032015 Begin
        SerieNumre.DeleteAll;
        //Dynalogic, SRN 27032015 End
        Clear(Streng);
        Clear(VarePost);
        VarePost.SetCurrentkey("Document No.", "Document Type", "Document Line No.");
        VarePost.SetRange("Document No.", LevNr);
        VarePost.SetRange("Document Type", 1);
        VarePost.SetRange("Document Line No.", LinjeNr);
        VarePost.SetFilter("Serial No.", '<>%1', '');
        if VarePost.FindSet then begin
            Clear(SerieNumre);
            SerieNumre.DeleteAll;
            repeat
                Clear(SerieNumre);
                SerieNumre.VareNr := VarePost."Serial No.";
                if not SerieNumre.Insert then;
                //Streng := Streng + ',' + VarePost."Serial No.";
                SerieNrRelation.SetRange("Færdigvare serienr.", VarePost."Serial No.");
                SerieNrRelation.SetRange("Færdigvarenr.", VarePost."Item No.");
                if SerieNrRelation.FindSet then
                    repeat
                        Clear(LokBuffer);
                        if not LokBuffer.Get(SerieNrRelation."Råvarenr.") then begin
                            Vare.Get(SerieNrRelation."Råvarenr.");
                            LokBuffer.VareNr := SerieNrRelation."Råvarenr.";
                            LokBuffer.Beskrivelse := Vare.Description;

                            // MMU
                            LokBuffer.SerieNumre := CreateSerieNumberString(LokBuffer.SerieNumre, SerieNrRelation."Råvare serienr.", LokBuffer);
                            // ORG LokBuffer.SerieNumre := LokBuffer.SerieNumre + ',' + SerieNrRelation."Råvare serienr.";
                            // MMU

                            LokBuffer.Insert;
                        end else begin

                            // MMU
                            LokBuffer.SerieNumre := CreateSerieNumberString(LokBuffer.SerieNumre, SerieNrRelation."Råvare serienr.", LokBuffer);
                            //SRN
                            DynSerialNumbers.Reset;
                            DynSerialNumbers.SourceId := LevNr;
                            DynSerialNumbers.LineNo := LinjeNr;
                            DynSerialNumbers.SerialNum := SerieNrRelation."Råvare serienr.";
                            if DynSerialNumbers.Insert then begin
                            end;
                            //SRN
                            // ORG LokBuffer.SerieNumre := LokBuffer.SerieNumre + ',' + SerieNrRelation."Råvare serienr.";
                            // MMU

                            LokBuffer.Modify;
                        end;
                    until SerieNrRelation.Next = 0;
            until VarePost.Next = 0;
            Clear(LokBuffer);
            if LokBuffer.FindSet then
                repeat
                    LokBuffer.SerieNumre := DelChr(LokBuffer.SerieNumre, '<', ','); // Slette f¢rste skilletegn i strengen
                    LokBuffer.Modify;
                until LokBuffer.Next = 0;
            //Streng := DELCHR(Streng,'<',','); // Slette første skilletegn i strengen
            //MESSAGE('%1',LokBuffer.SerieNumre);
        end;

        Clear(Intervaller);
        Clear(SerieNumre);
        if SerieNumre.FindSet then begin
            I := 1;
            Intervaller[I] [1] := SerieNumre.VareNr;

            repeat
                if (Intervaller[I] [2] <> '') and
                   (SerieNumre.VareNr <> IncStr(Intervaller[I] [2])) then begin
                    I := I + 1;
                    Intervaller[I] [1] := SerieNumre.VareNr;
                end;
                Intervaller[I] [2] := SerieNumre.VareNr;
            until SerieNumre.Next = 0;
        end;

        for I := 1 to 50 do begin
            if Intervaller[I] [1] <> '' then begin
                if Intervaller[I] [1] = Intervaller[I] [2] then
                    Streng := Streng + Intervaller[I] [1] + ','
                else
                    Streng := Streng + Intervaller[I] [1] + '-' + Intervaller[I] [2] + ',';
            end
            else
                I := 50;
        end;

        Streng := DelChr(Streng, '>', ',');

        exit(Streng);
    end;


    procedure KasseLavStreng(TopVareNr: Code[20]; SerieNrTopVare: Code[20]) Streng: Text[250]
    begin
        Clear(Streng);
        Clear(SerieNrRelation);
        SerieNrRelation.SetRange("Færdigvare serienr.", SerieNrTopVare);
        SerieNrRelation.SetRange("Færdigvarenr.", TopVareNr);
        if SerieNrRelation.FindSet then begin
            repeat
                Streng := Streng + ',' + SerieNrRelation."Råvare serienr.";
            until SerieNrRelation.Next = 0;
            Streng := DelChr(Streng, '<', ','); // Slette første skilletegn i strengen
        end;
        exit(Streng);
    end;


    procedure CreateSerieNumberString(SerieNumberString: Text[1000]; NextSerieNumber: Text[20]; var LokBuf: Record Serienummeruffer) NewSerieString: Text[1000]
    var
        TmpStr: Text[1000];
        Tmpstr2: Text[1000];
        NextStr: Text[1000];
        OutStr: Text[1000];
        I: Integer;
        OrgStr: Text[1000];
        OutStream: OutStream;
    begin

        OrgStr := SerieNumberString;
        NextStr := NextSerieNumber;

        I := StrPos(OrgStr, ',');

        if (I = 0) then begin
            OutStr := OrgStr + ',' + NextStr;
        end else begin
            // Find det sidste serienummer eller interval
            while I > 0 do begin
                OutStr := OutStr + CopyStr(OrgStr, 1, I);
                OrgStr := CopyStr(OrgStr, I + 1, StrLen(OrgStr));
                I := StrPos(OrgStr, ',');
            end;

            //Format kan være '238' eller '234-238'
            TmpStr := OrgStr;

            if TmpStr <> '' then begin
                if StrPos(TmpStr, '-') = 0 then begin // eks. '238'

                    if (NextStr = IncStr(TmpStr)) then begin // serien fortsætter
                        TmpStr := TmpStr + '-' + NextStr;
                    end else begin
                        TmpStr := TmpStr + ',' + NextStr; // der er hul
                    end;
                    OutStr := OutStr + TmpStr;
                end else begin // eks. '234-238'
                               // Split string
                    Tmpstr2 := CopyStr(TmpStr, StrPos(TmpStr, '-') + 1, StrLen(TmpStr));
                    TmpStr := CopyStr(TmpStr, 1, StrPos(TmpStr, '-') - 1);

                    if (NextStr = IncStr(Tmpstr2)) then begin // serien fortsætter
                        Tmpstr2 := NextStr;
                        OutStr := OutStr + TmpStr + '-' + Tmpstr2;
                    end else begin
                        OutStr := OutStr + TmpStr + '-' + Tmpstr2 + ',' + NextStr; // der er hul
                    end;
                end;
            end;
        end;

        //SRN
        LokBuf.DynSerialNum.CreateOutstream(OutStream);
        OutStream.Write(OutStr);
        //SRN

        exit(CopyStr(OutStr, 1, 250));
    end;
}

