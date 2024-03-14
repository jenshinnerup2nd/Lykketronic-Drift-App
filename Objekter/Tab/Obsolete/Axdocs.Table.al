//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50005 "Ax docs"
{

    fields
    {
        field(1; itemNo; Code[20])
        {
        }
        field(2; name; Text[250])
        {
        }
        field(3; URL; Text[250])
        {
            ExtendedDatatype = URL;
        }
        field(4; modDate; Date)
        {
        }
        field(5; modTime; Integer)
        {
        }
        field(6; modBy; Text[10])
        {
        }
        field(7; notes; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; itemNo, name, modTime)
        {
            Clustered = true;
            SQLIndex = itemNo, name, modTime;
        }
    }

    fieldgroups
    {
    }
}

