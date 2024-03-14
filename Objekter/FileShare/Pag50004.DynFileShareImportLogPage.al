page 50004 DynFileShareImportLogPage
{
    ApplicationArea = All;
    Caption = 'File Share Import Log';
    PageType = List;
    SourceTable = DynFileShareImportLog;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(TableId; Rec.TableId)
                {
                    ToolTip = 'Specifies the value of the TableId field.';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Path; Rec.Path)
                {
                    ToolTip = 'Specifies the value of the Path field.';
                }
                field(FSGPath; Rec.FSGPath)
                {
                    ToolTip = 'Specifies the value of the FSGPath field.';
                }
                field(Imported; Rec.Imported)
                {
                    ToolTip = 'Specifies the value of the Imported field.';
                }
                field(FileExists; Rec.FileExists)
                {
                    ToolTip = 'Specifies the value of the FileExists field.';
                }
                field(FileFolder; Rec.FileFolder)
                {
                    ToolTip = 'Specifies the value of the FileFolder field.';
                }
                field(FileName; Rec.FileName)
                {
                    ToolTip = 'Specifies the value of the FileName field.';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(Import)
            {
                ApplicationArea = All;
                Caption = 'Import enkelt fil';
                Promoted = true;

                Image = Import;
                trigger OnAction()
                var
                    IsConfirmed: Boolean;
                    ConfirmManagement: Codeunit "Confirm Management";
                    DynImportFileShare: Codeunit DynImportFileShare;
                    DynImportFile: Codeunit DynImportFile;
                begin
                    IsConfirmed := ConfirmManagement.GetResponseOrDefault('Er du sikker på at du ønsker at igangsætte import dette kan tage nogen tid', false);
                    if IsConfirmed then begin
                        DynImportFile.importFiles(Rec.FileFolder, Rec.FileName, Rec);
                        Rec."Imported" := true;
                        Rec.Modify(true);
                    end;
                end;
            }
            action(Bulk_Import)
            {
                ApplicationArea = All;
                Caption = 'Bulk Import';
                ToolTip = 'Importerer alle filer som ikke er importeret';
                Promoted = true;

                Image = Import;
                trigger OnAction()
                var
                    IsConfirmed: Boolean;
                    ConfirmManagement: Codeunit "Confirm Management";
                    DynImportFileShare: Codeunit DynImportFileShare;
                    DynImportFile: Codeunit DynImportFile;
                    DynimportFileBulk: Record DynFileShareImportLog;
                    DynimportFileBulkUpdate: Record DynFileShareImportLog;
                    CountRec: Integer;

                    IsSuccess: Boolean;
                begin
                    IsConfirmed := ConfirmManagement.GetResponseOrDefault('Er du sikker på at du ønsker at igangsætte import dette kan tage nogen tid', false);
                    if IsConfirmed then begin
                        DynimportFileBulk.SetRange("Imported", false);
                        if DynimportFileBulk.FindSet() then
                            repeat

                                IsSuccess := DynImportFile.TryFileAndFolder(DynimportFileBulk.FileFolder, DynimportFileBulk.FileName, DynimportFileBulk);
                                IF IsSuccess = true then begin
                                    DynImportFile.importFiles(DynimportFileBulk.FileFolder, DynimportFileBulk.FileName, DynimportFileBulk);
                                    DynimportFileBulk."Imported" := true;
                                    DynimportFileBulk.Modify();
                                    CountRec += 1;
                                    Commit();
                                end;
                            until (DynimportFileBulk.Next() = 0) Or (CountRec >= 500);

                        Message('Antal filer importeret: %1', CountRec);

                    end;
                end;
            }

            action(Bulk_Update)
            {
                ApplicationArea = All;
                Caption = 'Bulk update af filstier';
                ToolTip = 'Opdaterer filstierne til at være i Azure File Share format';
                Promoted = true;

                Image = Import;
                trigger OnAction()
                var
                    IsConfirmed: Boolean;
                    ConfirmManagement: Codeunit "Confirm Management";
                    i: Integer;
                    CountRec: Integer;
                    DynimportFileBulk: Record DynFileShareImportLog;
                    DynimportFileBulkUpdate: Record DynFileShareImportLog;
                begin
                    //Gennemløber alle records og opdaterer dem
                    //Konverterer \ til / da det er det som bruges i Azure File Share
                    IsConfirmed := ConfirmManagement.GetResponseOrDefault('Er du sikker på at du ønsker at igangsætte import dette kan tage nogen tid', false);
                    if IsConfirmed then begin
                        DynimportFileBulk.SetRange("Imported", false);
                        if DynimportFileBulk.FindSet() then
                            repeat
                                Clear(i);

                                for i := 1 to StrLen(DynimportFileBulk.FileFolder) do
                                    if DynimportFileBulk.FileFolder[i] = '\' then
                                        DynimportFileBulk.FileFolder[i] := '/';
                                DynimportFileBulk.Modify(true);

                                CountRec += 1;
                            until (DynimportFileBulk.Next() = 0);

                    end;
                end;
            }


        }
    }
}
