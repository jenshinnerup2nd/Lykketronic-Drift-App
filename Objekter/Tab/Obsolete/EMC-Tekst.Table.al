//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51009 "EMC-Tekst"
{

    fields
    {
        field(10; VareNr; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Item;
        }
        field(15; "LøbeNr"; Integer)
        {
            BlankZero = true;
        }
        field(20; Tekst; Text[80])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(30; Sprog; Option)
        {
            BlankZero = true;
            OptionMembers = Dansk,Engelsk,Tysk,Fransk;
        }
        field(40; Font; Option)
        {
            BlankZero = true;
            OptionMembers = " ",Fed;
        }
    }

    keys
    {
        key(Key1; VareNr, Sprog, "LøbeNr")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

