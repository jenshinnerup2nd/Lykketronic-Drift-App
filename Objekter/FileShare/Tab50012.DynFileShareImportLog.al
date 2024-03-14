table 50012 DynFileShareImportLog
{
    Caption = 'DynFileShareImportLog';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; TableId; Integer)
        {
            Caption = 'TableId';
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(3; Path; Text[250])
        {
            Caption = 'Path';
        }
        field(4; FSGPath; Text[250])
        {
            Caption = 'FSGPath';
        }
        field(5; Imported; Boolean)
        {
            Caption = 'Imported';
        }
        field(6; FileExists; Boolean)
        {
            Caption = 'FileExists';
        }
        field(7; FileFolder; Text[250])
        {
            Caption = 'FileFolder';
        }
        field(8; FileName; Text[250])
        {
            Caption = 'FileName';
        }
    }
    keys
    {
        key(PK; TableId, "Code", Path)
        {
            Clustered = true;
        }

    }
}
