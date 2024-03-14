codeunit 50001 DynImportFileShare
{
    procedure FindAndCreateFSGPath()
    var
        DynRecordLink: Record "Record Link";
        DynItem: Record Item;
        DynFileshareimportLog: Record DynFileshareimportLog;
        DynDialog: Dialog;
        DynCount: Integer;
        DynCount2: Integer;

    begin
        //DynFileshareimportLog.DeleteAll(true); //Slet alle records
        DynDialog.Open('Fileshare import ##########1 Count ###########2 Insert ###########3', DynItem."No.", DynCount, DynCount2);
        if DynItem.FindSet() then
            repeat
                DynRecordLink.Reset();
                DynRecordLink.SetRange("Record ID", DynItem.RecordId);
                DynRecordLink.SetRange(Type, DynRecordLink.Type::Link);
                DynCount += 1;

                DynDialog.Update(1, DynItem."No.");
                DynDialog.Update(2, DynCount);

                if DynRecordLink.FindSet() then
                    repeat
                        If not DynFileshareimportLog.Get(27, DynItem."No.", DynRecordLink.URL1) then begin
                            DynFileshareimportLog.Reset();
                            DynFileshareimportLog.Init();
                            DynFileshareimportLog.TableId := 27;
                            DynFileshareimportLog.Code := DynItem."No.";
                            DynFileshareimportLog.Path := DynRecordLink.URL1;

                            If (DynFileshareimportLog.Path = '') then begin
                                DynFileshareimportLog.Path := '';
                            end;

                            if DynFileshareimportLog.Path <> '' then begin
                                ;
                                IF GetFileName(DynRecordLink.URL1) <> '' then begin
                                    DynFileshareimportLog.FileName := GetFileName(DynRecordLink.URL1);
                                    DynFileshareimportLog.FileFolder := CopyStr(DynRecordLink.URL1, 1, StrLen(DynRecordLink.URL1) - StrLen(DynFileshareimportLog.FileName) - 1);

                                    //Custom code - til at fjerne overflødige tegn
                                    DynFileshareimportLog.FileFolder := DelChr(DynFileshareimportLog.FileFolder, '=', ' ');

                                    //custom code - til at fjerne overflødige tegn
                                    if StrPos(DynFileshareimportLog.FileFolder, '\\srvsbs\sql_g\') = 1 then begin
                                        DynFileshareimportLog.FileFolder := CopyStr(DynFileshareimportLog.FileFolder, StrLen('\\srvsbs\sql_g\') + 1);
                                    end else begin
                                        ;
                                        DynFileshareimportLog.FileFolder := DynFileshareimportLog.FileFolder;
                                    end;
                                    //custom code - til at fjerne overflødige tegn
                                    if StrPos(DynFileshareimportLog.FileFolder, 'G:\') = 1 then begin
                                        DynFileshareimportLog.FileFolder := CopyStr(DynFileshareimportLog.FileFolder, StrLen('G:\') + 1);
                                    end else begin
                                        ;
                                        DynFileshareimportLog.FileFolder := DynFileshareimportLog.FileFolder;
                                    end;
                                    //custom code - til at fjerne overflødige tegn
                                    if StrPos(DynFileshareimportLog.FileFolder, '\\nas\sql_g\') = 1 then begin
                                        DynFileshareimportLog.FileFolder := CopyStr(DynFileshareimportLog.FileFolder, StrLen('\\nas\sql_g\') + 1);
                                    end else begin
                                        ;
                                        DynFileshareimportLog.FileFolder := DynFileshareimportLog.FileFolder;
                                    end;
                                end;
                            end;
                            //Custom code - indsætter kun hvis der er en sti
                            if DynFileshareimportLog.Path <> '' then begin
                                IF not DynFileshareimportLog.Insert(true) then begin
                                    //DynFileshareimportLog.Modify(true);
                                end else begin
                                    DynCount2 += 1;
                                    DynDialog.Update(3, DynCount2);
                                end;

                            end;
                        end;
                    until DynRecordLink.Next() = 0;
            until (DynItem.Next() = 0);

        Message('Done, %1 records', DynFileshareimportLog.Count);
    end;
    //Import af filer fra filshare  

    local procedure GetFileType(pFilename: Text): Text;
    var
        FilenamePos: Integer;
    begin
        FilenamePos := StrLen(pFilename);
        while (pFilename[FilenamePos] <> '.') or (FilenamePos < 1) do
            FilenamePos -= 1;

        if FilenamePos = 0 then
            exit('');

        exit(CopyStr(pFilename, FilenamePos + 1, StrLen(pFilename)));
    end;

    local procedure GetFileName(pFilename: Text): Text;
    var
        FilenamePos: Integer;
    begin
        FilenamePos := StrLen(pFilename);
        //Message(pFilename);
        while (pFilename[FilenamePos] <> '\') and (FilenamePos > 1) do
            FilenamePos -= 1;

        //Message('FilenamePos: %1', FilenamePos);

        if FilenamePos = 0 then
            exit(pFilename);

        exit(CopyStr(pFilename, FilenamePos + 1, StrLen(pFilename) - FilenamePos));
    end;



}
