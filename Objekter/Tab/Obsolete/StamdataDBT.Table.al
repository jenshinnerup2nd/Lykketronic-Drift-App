//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59000 "Stamdata DBT"
{

    fields
    {
        field(1; KladdeNavn; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
            TableRelation = "Gen. Journal Template";
        }
        field(2; "KladdeLøbeNr"; Integer)
        {
            BlankZero = true;
            Editable = false;
        }
        field(6; BetalingsType; Option)
        {
            BlankZero = true;
            Editable = false;
            OptionMembers = Indland,Udland;
        }
        field(8; BetalingsForm; Option)
        {
            BlankZero = true;
            OptionMembers = Bank,Giro,Check,PBS,IK;
        }
        field(10; "Modtager-RegNr"; Code[4])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(11; "Modtager-KontoNr"; Code[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(14; "Modtager-Nummer"; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
            TableRelation = Vendor;
        }
        field(16; Navn; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(17; "Navn 2"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(18; Adresse; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(22; "PostNr+By"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(24; "Adviser Modtager"; Boolean)
        {
            BlankZero = true;
        }
        field(42; Kortart; Code[2])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(44; BetalingsID; Code[19])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(50; "Afsender ref"; Text[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(52; "Bemærkning"; Text[24])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(54; "Modtager ref"; Text[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(56; Afsenderid; Text[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(58; "Ref.til.pr.dok"; Text[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(60; "Meddel Bank"; Text[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(61; "Meddel Bank 2"; Text[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(62; "Meddel Bank 3"; Text[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(80; "Beløb"; Decimal)
        {
            BlankZero = true;
            CalcFormula = sum(BetalingsKladde."Beløb" where(KladdeNavn = field(KladdeNavn),
                                                             "LøbeNr" = field("KladdeLøbeNr")));
            DecimalPlaces = 2 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(100; MaxAdvisLinier; Integer)
        {
            Editable = false;
        }
        field(101; KortAdvis; Boolean)
        {
            Editable = false;
        }
        field(102; AdvisLinier; Integer)
        {
            Editable = false;
        }
        field(103; AdvisType; Option)
        {
            BlankZero = true;
            Editable = false;
            OptionMembers = " ",Kort,Lang,Manuel;
        }
        field(104; "Udlæst"; Boolean)
        {
            BlankZero = true;
            Editable = false;
        }
        field(150; "Udlandsk Bank"; Text[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(151; "Udlandsk Bank 2"; Text[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(152; "Udlandsk Bank 3"; Text[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(153; "Udlandsk Bank 4"; Text[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(162; "Indf¢rsel (MMÅÅ)"; Code[4])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(165; "Modværdi"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(166; TerminskontraktNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(167; Aftalekurs; Decimal)
        {
            BlankZero = true;
        }
        field(180; Vareart; Text[50])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(181; "Vareart 2"; Text[50])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(184; "Modtagers Hjemland"; Text[16])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(200; "Overf¢rselsType"; Option)
        {
            BlankZero = true;
            OptionMembers = " ","Almindelig overf¢rsel","Tele-overf¢rsel","Ekspres-overf¢rsel","Euro-Overf¢rsel","Koncernoverf¢rsel";
        }
        field(202; Omkostninger; Option)
        {
            BlankZero = true;
            OptionMembers = " ","Afsender & Modtager","Afsender.","Modtager.";
        }
        field(204; Kategori; Option)
        {
            BlankZero = true;
            OptionMembers = "0006","0016","0106","0206","0406","0606","0826","1506","2006","2106","2206","2326","2406","4006";
        }
        field(206; "SE/Moms-nummer"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(208; Transitvarer; Boolean)
        {
            BlankZero = true;
        }
        field(210; "S¢transport"; Boolean)
        {
            BlankZero = true;
        }
        field(212; Provision; Boolean)
        {
            BlankZero = true;
        }
        field(214; "Andre Transaktioner"; Boolean)
        {
            BlankZero = true;
        }
        field(215; "Andre Transakt."; Text[65])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(216; "Andre Transakt. 2"; Text[65])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(220; "Check crosses"; Boolean)
        {
            BlankZero = true;
        }
        field(221; Filial; Code[4])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(222; "Sendes til"; Option)
        {
            BlankZero = true;
            OptionMembers = " ",Afsender,Filial;
        }
        field(224; "Modtagers land"; Code[2])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(226; Landekode; Code[2])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(228; "Bel¢b incl. omk."; Boolean)
        {
        }
        field(229; Kurstype; Option)
        {
            BlankZero = true;
            OptionMembers = Salg,Spot,Termin;
        }
        field(230; "SWIFT Adresse"; Code[11])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(231; BankKode; Option)
        {
            BlankZero = true;
            OptionMembers = " ",BL,AT,SC,CH,CP,FW,CC;
        }
        field(232; Banknr; Code[9])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(233; BankLandeKode; Code[2])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
    }

    keys
    {
        key(Key1; KladdeNavn, "KladdeLøbeNr")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

