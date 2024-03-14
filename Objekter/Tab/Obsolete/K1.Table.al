//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51000 K1
{

    fields
    {
        field(12; "Lev.Nr"; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Sales Shipment Header";
        }
        field(13; "Lev.Navn"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Sales Header";
        }
        field(14; "Lev.Navn2"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Sales Header";
        }
        field(15; "Lev.Adr.1"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Sales Header";
        }
        field(16; "Lev.Adr.2"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Sales Header";
        }
        field(17; "Lev.Adr.3"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Sales Header";
        }
        field(18; "Lev.Att."; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Sales Header";
        }
        field(151; VareNummer; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
            NotBlank = true;
            TableRelation = Item;
        }
        field(152; VareTekst; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(153; SerieNummer; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(154; ProduktionsDato; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(155; TilgangsProdNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            //NAL-JHHTableRelation = Table51920;
        }
        field(156; ReserveringsStatus; Option)
        {
            BlankZero = true;
            OptionMembers = Ledig,"Tilg. Prod.","Afg. Prod.",SalgsOrdre,"Afgået v/Prod.","Afgået v/Salg","Reperat.","Udlånt","KarantæneLager",Kasseret,"Anden Afgang","Reservat.";
        }
        field(157; ReserveringsNummer; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            //NAL-JHHTableRelation = if (ReserveringsStatus=const("Tilg. Prod.")) Table51920
            //NAL-JHH                else if (ReserveringsStatus=const("Afg. Prod.")) Table51920;
        }
        field(158; "Indgået I VareNr"; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Item;
        }
        field(159; "Indgået I SerieNr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(160; "Indgået I VareTekst"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(161; "Indgået I ProdNr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            //NAL-JHHTableRelation = Table51920;
        }
        field(162; AfgangsDato; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(163; DebitorNummer; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Customer;
        }
        field(164; DebitorNavn; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(165; "F¢lgeSeddelNr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Sales Shipment Header";
        }
        field(166; PakkeKortNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(167; LeveringsDato; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(168; GarantiPeriodeSalg; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            DateFormula = true;
        }
        field(171; "GarantiUdl¢b"; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(176; "LåstReservation"; Boolean)
        {
        }
        field(177; AntalSerieNumre; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 0;
            Editable = false;
            InitValue = 1;
        }
        field(178; Returneret; Boolean)
        {
        }
        field(179; ReturDato; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(190; "BemærkText"; Text[60])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
    }

    keys
    {
        key(Key1; VareNummer, SerieNummer)
        {
            Clustered = true;
        }
        key(Key2; VareNummer, ReserveringsStatus, ReserveringsNummer)
        {
            SumIndexFields = AntalSerieNumre;
        }
        key(Key3; "Indgået I VareNr", "Indgået I SerieNr")
        {
        }
        key(Key4; ReserveringsStatus, "F¢lgeSeddelNr", VareNummer)
        {
        }
    }

    fieldgroups
    {
    }
}

