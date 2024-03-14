//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51006 "StøbeIndlægLinie"
{

    fields
    {
        field(150; "StøbeProgNr"; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(151; "IndlægNr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = StøbeIndlæg;
        }
        field(152; "IndlægTekst"; Text[50])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(153; "LøbeNr"; Integer)
        {
            BlankZero = true;
        }
        field(155; Placering; Option)
        {
            BlankZero = true;
            OptionMembers = "Bevægelig del","Fast del";
        }
        field(156; PlastForbrug; Text[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(158; "Skudvægt (gr.)"; Decimal)
        {
            BlankZero = true;
        }
    }

    keys
    {
        key(Key1; "StøbeProgNr", "LøbeNr")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

