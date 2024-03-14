codeunit 50009 DynUpdateUserAndDate
{
    trigger OnRun()
    begin
        UpdateUserAndDate();
    end;

    procedure UpdateUserAndDate()
    var
        DynDocumentAttachment: Record "Document Attachment";
        DynRecordLinks: Record "Record Link";
        DynItems: Record "Item";

    begin
        // Update User and Date
        DynDocumentAttachment.RESET;
        DynDocumentAttachment.SetFilter("Table ID", '=%1', 27);
        IF DynDocumentAttachment.FindFirst() then
            repeat
                IF DynItems.GET(DynDocumentAttachment."No.") then begin
                    DynRecordLinks.RESET;
                    DynRecordLinks.SetFilter("Record ID", '=%1', DynItems.RecordId);
                    DynRecordLinks.SetFilter(Description, '=%1', DynDocumentAttachment."File Name");
                    if DynRecordLinks.FindFirst() then begin
                        DynDocumentAttachment.DynBruger := DynRecordLinks."User ID";
                        DynDocumentAttachment."Attached Date" := DynRecordLinks.Created;
                        DynDocumentAttachment.DynParth := DynRecordLinks.URL1;  // URL1 is the URL of the file
                        DynDocumentAttachment.MODIFY;
                    end;
                end;
                ;
            until DynDocumentAttachment.Next() = 0;

        Message('Update User and Date Completed');

    end;

}
