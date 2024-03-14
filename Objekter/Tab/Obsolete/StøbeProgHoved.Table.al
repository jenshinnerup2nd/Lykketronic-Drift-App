//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51004 "StøbeProgHoved"
{

    fields
    {
        field(150; "StøbeProgNr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(151; "CyklusTid (Sek.)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            MinValue = 0;
        }
        field(152; FormNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(153; "Opstil.Tid (Time)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            InitValue = 15;
            MinValue = 0;
        }
        field(154; FilStatus; Option)
        {
            BlankZero = true;
            OptionMembers = "IKKE oprettet",Oprettet,"Kræver tilpasning pga. form ændring";
        }
        field(155; "Bemærk1"; Text[70])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(156; "Bemærk2"; Text[70])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(157; PlastForbrug; Text[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(158; "Skudvægt (gr.)"; Decimal)
        {
            BlankZero = true;
        }
        field(159; "Spærret"; Boolean)
        {
            BlankZero = true;
        }
        field(160; Dato; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
    }

    keys
    {
        key(Key1; "StøbeProgNr")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

