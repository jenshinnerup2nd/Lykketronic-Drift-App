//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50454 IntraStatPost
{

    fields
    {
        field(1; "LøbeNr"; Integer)
        {
            BlankZero = true;
        }
        field(2; Art; Option)
        {
            BlankZero = true;
            OptionMembers = Modtagelse,Afsendelse;
        }
        field(3; Dato; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(4; ToldPosition; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            NotBlank = true;
            TableRelation = xBrugsTarifNummer;
        }
        field(5; Varebeskrivelse; Text[50])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(6; LandeKode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Country/Region";
        }
        field(7; TransaktionsArt; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = xTransaktionsArt;
        }
        field(8; "TransportMåde"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = xTransportMåde;
        }
        field(9; Kilde; Option)
        {
            BlankZero = true;
            Editable = false;
            OptionMembers = ,VP,SP;
        }
        field(10; "KildeLøbeNr"; Integer)
        {
            BlankZero = true;
            Editable = false;
            TableRelation = if (Kilde = const(VP)) "Item Ledger Entry"
            else
            if (Kilde = const(SP)) "Job Ledger Entry";
        }
        field(11; "NettoVægt"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 5;
        }
        field(12; "Bel¢b"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 0;
        }
        field(13; Antal; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 0;
        }
        field(14; "Omkostnings%"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
            MaxValue = 100;
            MinValue = 0;
        }
        field(15; Omkostning; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 0;
        }
        field(16; "StatistiskVærdi"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(17; BilagsNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(20; Rapporteret; Boolean)
        {
            BlankZero = true;
        }
        field(21; VareNr; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Item;
        }
        field(22; Navn; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(25; StatistikPeriode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(27; "TotalVægt"; Decimal)
        {
            BlankZero = true;
            Editable = false;
        }
        field(30; "SupplerendeMængde"; Boolean)
        {
            BlankZero = true;
            Editable = false;
        }
        field(31; InterntRefNr; Text[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "LøbeNr")
        {
            Clustered = true;
            SumIndexFields = "StatistiskVærdi";
        }
        key(Key2; Kilde, "KildeLøbeNr")
        {
        }
        key(Key3; StatistikPeriode, Art, LandeKode, ToldPosition, TransaktionsArt, "TransportMåde")
        {
        }
        key(Key4; InterntRefNr)
        {
        }
    }

    fieldgroups
    {
    }
}

