//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50451 xTransaktionsArt
{

    fields
    {
        field(1; Kode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(2; Tekst; Text[50])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
    }

    keys
    {
        key(Key1; Kode)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

