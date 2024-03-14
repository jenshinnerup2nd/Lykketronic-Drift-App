//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51032 "VarePost statistik"
{

    fields
    {
        field(1; "LøbeNr"; Integer)
        {
            BlankZero = true;
        }
        field(2; VareNr; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Item;
        }
        field(3; Dato; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(4; Art; Option)
        {
            BlankZero = true;
            OptionMembers = "Køb",Salg,Tilgang,Afgang;
        }
        field(5; KildeNr; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = if (KildeArt = const(Debitor)) Customer
            else
            if (KildeArt = const(Kreditor)) Vendor
            else
            if (KildeArt = const(Vare)) Item;
        }
        field(6; BilagsNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(7; Tekst; Text[50])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(8; LokationsKode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Location;
        }
        field(9; "Bogf.Gr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Inventory Posting Group";
        }
        field(10; "KildeBogf.Gr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = if (KildeArt = const(Debitor)) "Customer Posting Group"
            else
            if (KildeArt = const(Kreditor)) "Vendor Posting Group"
            else
            if (KildeArt = const(Vare)) "Inventory Posting Group";
        }
        field(12; Antal; Decimal)
        {
            BlankZero = true;
        }
        field(13; RestAntal; Decimal)
        {
            BlankZero = true;
        }
        field(14; "VærdiAntal"; Decimal)
        {
            BlankZero = true;
        }
        field(15; Apris; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 5;
        }
        field(16; KostPris; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 5;
        }
        field(17; "Beløb"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(21; "RabatBeløb"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(22; "SælgerKode"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Salesperson/Purchaser";
        }
        field(24; BrugerID; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(25; Spor; Code[3])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(28; "UdlignLøbeNr"; Integer)
        {
            BlankZero = true;
        }
        field(29; "Åben"; Boolean)
        {
            BlankZero = true;
        }
        field(30; Reguleret; Boolean)
        {
            BlankZero = true;
        }
        field(33; AfdelingsKode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(34; ProjektKode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            //TableRelation = Table12;
        }
        field(36; Positiv; Boolean)
        {
            BlankZero = true;
        }
        field(37; "Lukket af LøbeNr"; Integer)
        {
            BlankZero = true;
            TableRelation = "Item Ledger Entry";
        }
        field(38; "Lukket d."; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(39; "Lukket med Antal"; Decimal)
        {
            BlankZero = true;
        }
        field(40; SerieNr; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(41; KildeArt; Option)
        {
            BlankZero = true;
            OptionMembers = " ",Debitor,Kreditor,Vare,Produktion;
        }
        field(42; "LagerVærdi(antal)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(43; "LagerVærdi(v.antal)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(44; "Bogf.LagerVærdi"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(100; TransaktionsArt; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = xTransaktionsArt;
        }
        field(101; "TransportMåde"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = xTransportMåde;
        }
        field(102; LandeKode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Country/Region";
        }
    }

    keys
    {
        key(Key1; "LøbeNr")
        {
            Clustered = true;
        }
        key(Key2; VareNr, Dato)
        {
            SumIndexFields = Antal, "VærdiAntal";
        }
        key(Key3; Art, VareNr, Dato)
        {
            Enabled = false;
            SumIndexFields = "VærdiAntal", "Beløb", "LagerVærdi(v.antal)";
        }
        key(Key4; Art, VareNr, KildeArt, KildeNr, Dato)
        {
            Enabled = false;
        }
        key(Key5; KildeNr, KildeArt, Art, VareNr, Dato)
        {
            Enabled = false;
        }
        key(Key6; VareNr, "Åben", Positiv, Dato)
        {
            Enabled = false;
        }
        key(Key7; SerieNr)
        {
            Enabled = false;
        }
        key(Key8; LandeKode, Art, Dato)
        {
            Enabled = false;
        }
        key(Key9; BilagsNr, Dato)
        {
            Enabled = false;
        }
    }

    fieldgroups
    {
    }
}

