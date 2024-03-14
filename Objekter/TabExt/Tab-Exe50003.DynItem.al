tableextension 52003 DynItemExt extends "Item"
{
    fields
    {
        field(50000; NaviNo; Code[20])
        {
            Caption = 'Navision varenr.';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50001; NaviDescription; Text[60])
        {
            Caption = 'Navision varetekst';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50012; xPlacering1; Code[15])
        {
            Caption = 'xPlacering1';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50151; "xAlt.VareLev1"; Code[20])
        {
            Caption = 'xAlt.VareLev1';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50152; "xAlt.VareLev1.VareNr"; Text[20])
        {
            Caption = 'xAlt.VareLev1.VareNr';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50154; xPlacering2; Code[15])
        {
            Caption = 'xPlacering2';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50155; xAfmærket; Boolean)
        {
            Caption = 'xAfmærket';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50156; xStøbtEmne; Boolean)
        {
            Caption = 'xStøbtEmne';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50157; xSerieNr; Boolean)
        {
            Caption = 'xSerieNr';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50158; xMaterialeKostPris; Decimal)
        {
            Caption = 'xMaterialeKostPris';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50159; xSerieNrType; Option)
        {
            Caption = 'xSerieNrType';
            FieldClass = Normal;
            DataClassification = CustomerContent;
            OptionMembers = ,Direkte,Overført,SamlingsNr,Manuel;
            OptionCaption = ' ,Direkte,Overført,SamlingsNr,Manuel';
        }
        field(50160; "xProd.Tid/SL+"; Decimal)
        {
            Caption = 'xProd.Tid/SL+';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50161; xSerieNrTekstLabel; Boolean)
        {
            Caption = 'xSerieNrTekstLabel';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50162; xUnderleverandørProd; Boolean)
        {
            Caption = 'xUnderleverandørProd';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50163; "xLedig S.Nr."; Decimal)
        {
            Caption = 'xLedig S.Nr.';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50164; "xS/U Godkendt"; Boolean)
        {
            Caption = 'xS/U Godkendt';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50165; "xS/U Godkender"; Code[10])
        {
            Caption = 'xS/U Godkender';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50166; xProdGodkendt; Boolean)
        {
            Caption = 'xProdGodkendt';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50167; "xS/U GodkendNr"; Code[10])
        {
            Caption = 'xS/U GodkendNr';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50168; xProdGodkendNr; Code[10])
        {
            Caption = 'xProdGodkendNr';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50169; xProdGodkender; Code[10])
        {
            Caption = 'xProdGodkender';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50170; "xEMC Tekst"; Boolean)
        {
            Caption = 'xEMC Tekst';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50171; xLevBufferLager; Decimal)
        {
            Caption = 'xLevBufferLager';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50172; "xProd.Tid/SL"; Decimal)
        {
            Caption = 'xProd.Tid/SL';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50173; xLøsSerieNrType; Boolean)
        {
            Caption = 'xLøsSerieNrType';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50174; xOpstillingsTid; Decimal)
        {
            Caption = 'xOpstillingsTid';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50175; "xStk./Emne"; Decimal)
        {
            Caption = 'xStk./Emne';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50199; xPrisGodkendelse; Date)
        {
            Caption = 'xPrisGodkendelse';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50200; "xProdukt Status"; Option)
        {
            Caption = 'xProdukt Status';
            FieldClass = Normal;
            DataClassification = CustomerContent;
            OptionMembers = ,Prototyp,"Nul Serie",Godkendt,Spærret,"Under Konstruktion";
            OptionCaption = ',Prototyp,Nul Serie,Godkendt,Spærret,Under Konstruktion';
        }
        field(50201; xInitiativTager; Option)
        {
            Caption = 'xInitiativTager';
            FieldClass = Normal;
            DataClassification = CustomerContent;
            OptionMembers = ,Jan,Olaf,Mic,Michael,Ivan,Henrik,Birger,Mogens,Ronnie;
            OptionCaption = ',Jan,Olaf,Mic,Michael,Ivan,Henrik,Birger,Mogens,Ronnie';
        }
        field(50202; "xFra dato"; Date)
        {
            Caption = 'xFra dato';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50203; xAfdeling; Option)
        {
            Caption = 'xAfdeling';
            FieldClass = Normal;
            DataClassification = CustomerContent;
            OptionMembers = ,,Salg,Indkøb,Udvikling,Produktion;
            OptionCaption = ', ,Salg,Indkøb,Udvikling,Produktion';
        }
        field(50204; "xFELT 2"; Code[10])
        {
            Caption = 'xFELT 2';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50205; "xFELT 3"; Code[10])
        {
            Caption = 'xFELT 3';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50210; "xKontroltype"; Option)
        {
            Caption = 'xKontroltype';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = ,"Visual test","Function test","EMC & CE tested","Not tested";
            OptionCaption = ',Visual test,Function test,EMC & CE tested,Not tested';
        }
        field(50211; "xKontrol frekvens"; Option)
        {
            Caption = 'xKontrol frekvens';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = ,"White(100%)","Red(10%)","Yellow(6.5%)","Green(4%)";
            OptionCaption = ',White(100%),Red(10%),Yellow(6.5%),Green(4%)';
        }
        field(50212; "xProcedureNr."; Text[30])
        {
            Caption = 'xProcedureNr.';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50214; "xMontageVærktoj MV1"; Text[14])
        {
            Caption = 'xMontageVærktoj MV1';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50215; "xMontageVærktoj MV2"; Text[14])
        {
            Caption = 'xMontageVærktoj MV2';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50216; "xMontageVærktoj MV3"; Text[14])
        {
            Caption = 'xMontageVærktoj MV3';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50217; "xPrintVærktoj PV1"; Text[10])
        {
            Caption = 'xPrintVærktoj PV1';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50218; "xPrintVærktoj PV2"; Text[10])
        {
            Caption = 'xPrintVærktoj PV2';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50219; "xPrintVærktoj PV3"; Text[10])
        {
            Caption = 'xPrintVærktoj PV3';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50235; "xDok.Status"; Option)
        {
            Caption = 'xDok.Status';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = ,"Produktion Godkendt","Under Godkendelse","Under Kontruktion","Prototype","Nul Serie","Under Ændringer",Spærret,Udgået;
            OptionCaption = ',Produktion Godkendt,Under Godkendelse,Under Kontruktion,Prototype,Nul Serie,Under Ændringer,Spærret,Udgået';
        }
        field(50236; xGyldigFra; Date)
        {
            Caption = 'xGyldigFra';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50237; xxxxxxxx; Option)
        {
            Caption = 'xxxxxxxx';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = ," ";
            OptionCaption = ', ';
        }
        field(50238; "xProduktion(Antal)"; Decimal)
        {
            Caption = 'xProduktion(Antal)';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50239; xAfledteBehov; Decimal)
        {
            Caption = 'xAfledteBehov';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50240; xNiveau; Integer)
        {
            Caption = 'xNiveau';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50241; xForecastAntal; Decimal)
        {
            Caption = 'xForecastAntal';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50242; "xVærktøj MV1"; Option)
        {
            Caption = 'xVærktøj MV1';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = ,,"001","002","003","004";
            OptionCaption = ', ,001,002,003,004';
        }
        field(50243; xReplanlægningsbehov; Option)
        {
            Caption = 'xReplanlægningsbehov';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = ,Ja;
            OptionCaption = ' ,Ja';
        }
        field(50244; xDisponering; Option)
        {
            Caption = 'xDisponering';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = "Salg+Afledte",Forecast,Manuel;
            OptionCaption = 'Salg+Afledte,Forecast,Manuel';
        }
        field(50245; "xLev.Sik.Margen"; Code[10])
        {
            Caption = 'xLev.Sik.Margen';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50246; xProdDagePrStk; Decimal)
        {
            Caption = 'xProdDagePrStk';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50247; "xAltern. leverandør"; Option)
        {
            Caption = 'xAltern. leverandør';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = ,Nej;
            OptionCaption = ' ,Nej';
        }
        field(50248; "xSkudvægt (gr.)"; Decimal)
        {
            Caption = 'xSkudvægt (gr.)';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50249; "xDoc.ændret af"; Option)
        {
            Caption = 'xDoc.ændret af';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = ,Jan,Mic,Hans;
            OptionCaption = ',Jan,Mic,Hans';
        }
        field(50250; xændringsDato; Date)
        {
            Caption = 'xændringsDato';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50251; xændringsStatus; Option)
        {
            Caption = 'xændringsStatus';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = ,Tid,Komponent,Soft,Test,"Komponent+Soft","Soft+Test","Komponent+Test","Komponent+Tid",Dokumentation,"Komponent+Dok.","Test+Dok.",Alle,Værktøj;
            OptionCaption = ',Tid,Komponent,Soft,Test,Komponent+Soft,Soft+Test,Komponent+Test,Komponent+Tid,Dokumentation,Komponent+Dok.,Test+Dok.,Alle,Værktøj';
        }
        field(50255; "xVærktøj MV2"; Option)
        {
            Caption = 'xVærktøj MV2';
            FieldClass = Normal;
            DataClassification = CustomerContent;
            OptionMembers = ,,"001","002","003","004";
            OptionCaption = ', ,001,002,003,004';
        }
        field(50256; AltShelfNo; Text[30])
        {
            Caption = 'Alt. Placering';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }

    }
    fieldgroups
    {
        addlast(DropDown; NaviNo)
        {

        }
    }
}
