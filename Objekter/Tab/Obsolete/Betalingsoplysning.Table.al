//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59040 "Betalings oplysning"
{

    fields
    {
        field(1; Art; Option)
        {
            BlankZero = true;
            Editable = false;
            OptionMembers = Reserveret,Kreditor,Sprog,BetalingsKladdeHoved,Stamdata,Finans;
        }
        field(3; Kode; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = if (Art = const(Kreditor)) Vendor
            else
            if (Art = const(Sprog)) Language;
        }
        field(10; BetalingsType; Option)
        {
            BlankZero = true;
            OptionMembers = " ",Indland,Udland;
        }
        field(11; BetalingsForm; Option)
        {
            BlankZero = true;
            OptionMembers = Bank,Giro,Check,PBS,IK;
        }
        field(12; "Bank-RegNr"; Code[4])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(14; "Bank-KontoNr"; Code[35])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(16; "PBS-Nummer"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(18; "Giro/FIK Nr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(20; "Adviser Modtager"; Boolean)
        {
            BlankZero = true;
        }
        field(22; Tekstkode; Option)
        {
            BlankZero = true;
            OptionMembers = " ","035 Husleje","068 Overf¢rsel","071 Terminsydelse","100 Kort fri advis","156 L¢noverf¢rsel","157 14 dages l¢n","158 Indbetaling";
        }
        field(25; "Afsender ref."; Text[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(27; "Eget KundeNr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(28; "Overf¢rselsType"; Option)
        {
            BlankZero = true;
            OptionMembers = " ","Almindelig overf¢rsel","Tele-overf¢rsel","Ekspres-overf¢rsel","Euro/Eks.(DKK)-overf.","Koncernoverf¢rsel";
        }
        field(29; Omkostninger; Option)
        {
            BlankZero = true;
            OptionMembers = " ","Afsender & Modtager","Afsender.","Modtager.";
        }
        field(30; UdenlandskBank; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(32; "UdenlandskBank 2"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(34; "UdenlandskBank 3"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(36; "UdenlandskBank 4"; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(38; SWIFT; Code[15])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(40; GireringsType; Option)
        {
            BlankZero = true;
            OptionMembers = " ",Brevlig,Nordpay,"Nordpay koncern";
        }
        field(41; "Bankoverf¢rselsType"; Option)
        {
            BlankZero = true;
            OptionMembers = " ","Brevlig (SWIFT)","Telex (SWIFT)","Expres (SWIFT)";
        }
        field(42; UdbetalingskortsType; Option)
        {
            BlankZero = true;
            OptionMembers = " ",Brevlig;
        }
        field(43; CheckType; Option)
        {
            BlankZero = true;
            OptionMembers = " ",Fremsendt,Udstedt;
        }
        field(44; BankKode; Option)
        {
            BlankZero = true;
            OptionMembers = " ",BL,AT,SC,CH,CP,FW,CC;
        }
        field(45; BankNr; Code[9])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(46; BankLandeKode; Code[2])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(47; "Modt.Land Valuta"; Code[3])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            TableRelation = Currency;
        }
        field(50; Beskrivelse; Text[50])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(52; BankFormat; Option)
        {
            BlankZero = true;
            OptionMembers = "DBT 2.0","Unitel 4.01","KaSel 2.0","Bankdata 2.30","PC-Giro 2.30","Total-Bet. 1.11","BEC 3.40";
        }
        field(54; "T¢mmes ved bogf."; Boolean)
        {
            BlankZero = true;
        }
        field(60; "Udl.BetalingsType"; Option)
        {
            BlankZero = true;
            OptionMembers = " ","¥konomi",Standard,Ekspres,"Scan Payment","Scan Payment Ekspres",Koncernbetaling,"Koncernbetaling Ekspres",Unipayment,"Unipayment Koncern";
        }
        field(61; KortArt; Code[2])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(65; SkabelonNavn; Text[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(78; "GIK-Nr"; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(79; "Udlæs til(format)"; Option)
        {
            BlankZero = true;
            OptionMembers = Import,ErhvervsGiro;
        }
        field(80; "FIK-Nr"; Code[8])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Numeric = true;
        }
        field(81; SidsteID; Code[10])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(83; "DBT Sti"; Text[40])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(84; "Unitel Sti"; Text[40])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(85; "KaSel Sti"; Text[40])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(86; "BankData Sti"; Text[40])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(87; "PC-Giro Sti"; Text[40])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(88; "TB Sti"; Text[40])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(89; "BEC Sti"; Text[40])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(90; "Temporær Sti"; Text[40])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(100; Faktura; Text[15])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(101; Rentenota; Text[15])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(102; Kreditnota; Text[15])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(103; Betaling; Text[15])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(106; "Tilh. FinansKonto"; Code[20])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
        }
        field(107; Saldo; Decimal)
        {
            BlankZero = true;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("Tilh. FinansKonto")));
            DecimalPlaces = 2 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; Art, Kode)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

