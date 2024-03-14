//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50007 Serienummeruffer
{

    fields
    {
        field(3; VareNr; Code[20])
        {
        }
        field(4; Beskrivelse; Text[50])
        {
        }
        field(5; SerieNumre; Text[250])
        {
        }
        field(6; DynSerialNum; Blob)
        {
        }
    }

    keys
    {
        key(Key1; VareNr)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

