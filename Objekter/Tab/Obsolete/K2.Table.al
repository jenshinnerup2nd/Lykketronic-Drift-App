//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51001 K2
{

    fields
    {
        field(151; VareNummer; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Item;
        }
        field(152; VareTekst; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(153; SerieNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(154; "Modtaget d."; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(155; "Afsendt d."; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(156; Tekst1; Text[70])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(157; Tekst2; Text[70])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(158; Pris; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(159; ValutaKode; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
            TableRelation = Currency;
        }
        field(160; "Pris(DKK)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(161; AfsenderNr; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Customer;
        }
        field(162; AfsenderNavn; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(163; DebitorNr; Code[20])
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
        field(165; GarantiReparation; Boolean)
        {
        }
        field(166; Status; Option)
        {
            BlankZero = true;
            OptionMembers = "Under Reperation",Tilbagesendt,Krediteret,Kasseret,Ombyttet,"Retur til lager";
        }
        field(167; FejlType; Option)
        {
            BlankZero = true;
            NotBlank = true;
            OptionMembers = ,DesignFejl,FabrikationsFejl,KomponentFejl,BrugerFejl,Opdatering,Misvedligehold,Slidtage,"Ingen Fejl","Anden Fejl";
        }
        field(168; FabrikationsFejl; Option)
        {
            BlankZero = true;
            OptionMembers = ,DesignFejl,"IndbrændingsFejl",MontageFejl,TestFejl;
        }
        field(169; ReparationsRapportNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Sales Header";
        }
        field(170; ReparationsNummer; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(171; ReklamationsNummer; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(172; KreditNota; Boolean)
        {
        }
        field(173; OmbytterOrdreNr; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(176; SkadesDato; Date)
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(177; "Reparatør"; Code[5])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = "Salesperson/Purchaser";
        }
        field(178; "KreditBeløb"; Decimal)
        {
            BlankZero = true;
        }
        field(179; "KreditBeløb(DKK)"; Decimal)
        {
            BlankZero = true;
        }
        field(180; RepServ; Option)
        {
            BlankZero = true;
            OptionMembers = ,"Peter Bystrup";
            //NAL-JHHTableRelation = Table51002;
        }
    }

    keys
    {
        key(Key1; VareNummer, SerieNr, ReparationsNummer)
        {
            Clustered = true;
        }
        key(Key2; VareNummer, ReparationsNummer)
        {
        }
        key(Key3; "Afsendt d.", AfsenderNavn, FejlType, VareNummer)
        {
        }
        key(Key4; AfsenderNavn, VareNummer, FejlType, "Afsendt d.")
        {
        }
        key(Key5; ReparationsNummer)
        {
        }
        key(Key6; FejlType, AfsenderNavn, "Afsendt d.", VareNummer)
        {
        }
    }

    fieldgroups
    {
    }
}

