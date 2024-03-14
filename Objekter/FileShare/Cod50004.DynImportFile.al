codeunit 50004 DynImportFile
{

    // This codeunit is used to import files from a fileshare to a record in Business Central.
    procedure importFiles(pFoldername: Text; pFilename: Text; pFileshareimportLog: Record DynFileshareimportLog)

    var
        NALBAFFileSetupHeader: Record "NALBAF File Setup Header";
        NALBAFFileSetupHeaderArchive: Record "NALBAF File Setup Header";
        IFile: Interface "NALBAF IFile";
        IFileArchive: Interface "NALBAF IFile";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        OutStream: OutStream;
        FileName: Text;
        Buffer: Text;
        FilesInFolder: Record "NALBAF FileBuffer";
        DocumentAttachment: Record "Document Attachment";
        FileOutStream: OutStream;
        DynSetup_DynGetCDMFilePath: Text[250];
        DynSetup_DynGetCDMArchiveFilePath: Text[250];
        DynSetup_DynGetFileSetupHeaderCode: Code[10];
        DynfileShareImportSetup: Record DynFileShareImportSetup;

    begin

        if (pFoldername <> '') And (pFilename <> '') then begin
            NALBAFFileSetupHeader.Get('bctemp');

            IFile := NALBAFFileSetupHeader."File Destination";
            IFile.Initialize(NALBAFFileSetupHeader, Enum::"NALBA Logger"::ErrorToScreenLogger);
            IFile.GetFile(pFoldername, pFilename, FileInStream);
            Clear(TempBlob);
            TempBlob.CreateOutStream(OutStream);
            CopyStream(OutStream, FileInStream);
            TempBlob.CreateInStream(FileInStream);

            DocumentAttachment.Init();

            DocumentAttachment."Table ID" := pFileshareimportLog.TableId; // Replace with the ID of the table you want to attach the document to
            DocumentAttachment."No." := pFileshareimportLog.Code; // Replace with the number of the record you want to attach the document to
            DocumentAttachment."Document Type" := DocumentAttachment."Document Type"::Quote;
            DocumentAttachment."Line No." := 0; // Replace with the line number of the record you want to attach the document to
            DocumentAttachment."File Name" := pFilename;
            DocumentAttachment."File Extension" := GetFileType(pFilename);
            DocumentAttachment."File Type" := DocumentAttachment."File Type"::Other;
            DocumentAttachment."Document Reference ID".ImportStream(FileInStream, pFileName);
            DocumentAttachment.Insert(true);
            DocumentAttachment.ImportAttachment(FileInStream, pFilename);

        end;
    end;
    // Tjekke om filen er i en mappe
    [TryFunction]
    procedure TryFileAndFolder(pFoldername: Text; pFilename: Text; pFileshareimportLog: Record DynFileshareimportLog)
    var
        NALBAFFileSetupHeader: Record "NALBAF File Setup Header";
        NALBAFFileSetupHeaderArchive: Record "NALBAF File Setup Header";
        IFile: Interface "NALBAF IFile";
        IFileArchive: Interface "NALBAF IFile";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        OutStream: OutStream;
        FilesInFolder: Record "NALBAF FileBuffer";
        DocumentAttachment: Record "Document Attachment";
        FileOutStream: OutStream;
        DynSetup_DynGetCDMFilePath: Text[250];
        DynSetup_DynGetCDMArchiveFilePath: Text[250];
        DynSetup_DynGetFileSetupHeaderCode: Code[10];
    begin
        if (pFoldername <> '') And (pFilename <> '') then begin
            NALBAFFileSetupHeader.Get('bctemp');

            IFile := NALBAFFileSetupHeader."File Destination";
            IFile.Initialize(NALBAFFileSetupHeader, Enum::"NALBA Logger"::ErrorToScreenLogger);
            IFile.GetFile(pFoldername, pFilename, FileInStream);
        end;
    end;

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




}
