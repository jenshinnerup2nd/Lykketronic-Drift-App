tableextension 52009 DynGeneralLedgerSetupExt extends "General Ledger Setup"
{
    fields
    {
        field(50162; "x???"; Boolean)
        {
            Caption = 'x???';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50190; "xSidste StøbeKortNr"; Code[10])
        {
            Caption = 'xSidste StøbeKortNr';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50191; "xSidste PakkeKortNr"; Code[10])
        {
            Caption = 'xSidste PakkeKortNr';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50192; "xSidste Rep.RapportNr"; Code[10])
        {
            Caption = 'xSidste Rep.RapportNr';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50193; "xSidste Mod.BlanketNr"; Code[10])
        {
            Caption = 'xSidste Mod.BlanketNr';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50194; "xSidste S/U GodkendNr"; Code[10])
        {
            Caption = 'xSidste S/U GodkendNr';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50200; "xLev.SikkerhedsMargen"; Code[10])
        {
            Caption = 'xLev.SikkerhedsMargen';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50201; "xPlanHorisont(Prod.)"; Code[10])
        {
            Caption = 'xPlanHorisont(Prod.)';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50202; xIndkøbsHorisont; Code[10])
        {
            Caption = 'xIndkøbsHorisont';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(50203; xForecastPlanlægning; Option)
        {
            Caption = 'xForecastPlanlægning';
            FieldClass = Normal;

            DataClassification = CustomerContent;
            OptionMembers = "Ren forecast","Justeret forecast";
            OptionCaption = 'Ren forecast,Justeret forecast';
        }
    }
}
