table 50009 DynFileShareImportSetup
{
    Caption = 'DynFileShareImportSetup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "key"; Integer)
        {
            Caption = 'key';
        }
        field(2; DynFSGFilePath; Text[250])
        {
            Caption = 'FilePath';
        }
        field(3; DynFSGArchiveFilePath; Text[250])
        {
            Caption = 'ArchiveFilePath';
        }
        field(4; DynFSGFileSetupHeaderCode; Text[10])
        {
            Caption = 'FileSetupHeaderCode';
        }
    }
    keys
    {
        key(PK; "key")
        {
            Clustered = true;
        }
    }
}
