//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51005 "StøbeVareLinie"
{

    fields
    {
        field(151; VareNummer; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Item;
        }
        field(152; "StøbeProgNr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
            NotBlank = true;
        }
        field(153; "LøbeNr"; Integer)
        {
            BlankZero = true;
        }
        field(154; VareTekst; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(155; VareTekst2; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(156; CyklusAntal; Decimal)
        {
            BlankZero = true;
            Editable = false;
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
    }

    keys
    {
        key(Key1; "StøbeProgNr", "LøbeNr")
        {
            Clustered = true;
        }
        key(Key2; "StøbeProgNr", VareNummer)
        {
        }
    }

    fieldgroups
    {
    }
}

