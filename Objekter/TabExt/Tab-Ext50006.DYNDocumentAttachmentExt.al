tableextension 50006 DYNDocumentAttachmentExt extends "Document Attachment"
{
    fields
    {
        field(50000; DynBruger; Text[250])
        {
            Caption = 'DynBruger';
            DataClassification = CustomerContent;
        }
        field(50001; DynParth; Text[250])
        {
            Caption = 'Orignal sti';
            DataClassification = CustomerContent;
        }

    }
}
