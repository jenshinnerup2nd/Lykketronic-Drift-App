//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59042 BetalingsKladde
{

    fields
    {
        field(1; KladdeNavn; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(2; "LøbeNr"; Integer)
        {
            BlankZero = true;
            Editable = false;
        }
        field(3; KontoArt; Option)
        {
            BlankZero = true;
            InitValue = Debitor;
            OptionMembers = Finans,Debitor,Kreditor;
        }
        field(4; KontoNr; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = if (KontoArt = const(Finans)) "G/L Account"
            else
            if (KontoArt = const(Debitor)) Customer
            else
            if (KontoArt = const(Kreditor)) Vendor;
        }
        field(5; Dato; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            ClosingDates = true;
        }
        field(6; Art; Option)
        {
            BlankZero = true;
            InitValue = Betaling;
            OptionMembers = " ",Betaling,Faktura,Kreditnota,Rentebilag;
        }
        field(7; BilagsNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(8; Tekst; Text[50])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(9; MomsKode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "ProdBomLine Axapta";
        }
        field(10; "Moms%"; Decimal)
        {
            BlankZero = true;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(11; "ModKonto(Kode)"; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(12; ValutaKode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Currency;
        }
        field(13; "Beløb"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(14; Debet; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(15; Kredit; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(16; DKK; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(17; Balance; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(18; ValutaKurs; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 4 : 4;
            MinValue = 0;
        }
        field(19; "Salg(DKK)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(20; DB; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(21; "Fak.RabatBeløb"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(22; KundeNr; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
            TableRelation = if (KontoArt = const(Debitor)) Customer
            else
            if (KontoArt = const(Kreditor)) Vendor;
        }
        field(23; "Bogf.Gr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
            TableRelation = if (KontoArt = const(Debitor)) "Customer Posting Group"
            else
            if (KontoArt = const(Kreditor)) "Vendor Posting Group";
        }
        field(24; AfdelingsKode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            //TableRelation = Table11;
        }
        field(25; ProjektKode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            //TableRelation = Table12;
        }
        field(26; "SælgerKode"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Salesperson/Purchaser";
        }
        field(29; Spor; Code[3])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(30; AutoPost; Boolean)
        {
            BlankZero = true;
            Editable = false;
        }
        field(34; Afvent; Code[3])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(35; UdlignArt; Option)
        {
            BlankZero = true;
            Editable = false;
            OptionMembers = " ",Betaling,Faktura,Kreditnota,Rentebilag;
        }
        field(36; UdlignNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(38; ForfaldsDato; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(39; "Kont.RabatDato"; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(40; "Kont.Rabat%"; Decimal)
        {
            BlankZero = true;
            MaxValue = 100;
            MinValue = 0;
        }
        field(42; SagsNr; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
            TableRelation = Job;
        }
        field(43; Antal; Decimal)
        {
            BlankZero = true;
        }
        field(44; "MomsBel¢b"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(45; "MomsBogf¢ring"; Option)
        {
            BlankZero = true;
            Editable = false;
            OptionMembers = Automatisk,Manuel;
        }
        field(47; "BetalingsBet.Kode"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Payment Terms";
        }
        field(48; UdligningsID; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(49; MomsFritaget; Boolean)
        {
            BlankZero = true;
        }
        field(50; KoncernVirksomhed; Text[15])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            //TableRelation = Table50220;
        }
        field(151; "Udlæst"; Boolean)
        {
            BlankZero = true;
            Editable = false;
        }
        field(152; AdvisType; Option)
        {
            BlankZero = true;
            Editable = false;
            OptionMembers = " ",Kort,Lang,Manuel;
        }
        field(153; "Kont.rabatBel¢b"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(155; SamleNr; Integer)
        {
            BlankZero = true;
            Editable = false;
        }
        field(157; Respitdage; Integer)
        {
            BlankZero = true;
            MinValue = 0;
        }
        field(160; BetalingsType; Option)
        {
            BlankZero = true;
            OptionMembers = " ",Indland,Udland;
        }
        field(161; BankFormat; Option)
        {
            BlankZero = true;
            Editable = false;
            OptionMembers = DBT,Unitel,KaSel,Bankdata,"PC-Giro","Total-Betaling",BEC;
        }
        field(164; KortArt; Code[2])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(166; BetalingsID; Code[19])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; KladdeNavn, "LøbeNr")
        {
            Clustered = true;
            SumIndexFields = Balance, "Beløb";
        }
        key(Key2; KladdeNavn, "ModKonto(Kode)", "LøbeNr")
        {
        }
        key(Key3; KladdeNavn, Dato, BilagsNr)
        {
        }
        key(Key4; KladdeNavn, KontoArt, Art, KontoNr, SamleNr, UdlignArt)
        {
        }
        key(Key5; KladdeNavn, Art, BetalingsType, "ModKonto(Kode)")
        {
            SumIndexFields = "Beløb";
        }
        key(Key6; KontoArt, KontoNr)
        {
        }
    }

    fieldgroups
    {
    }
}

