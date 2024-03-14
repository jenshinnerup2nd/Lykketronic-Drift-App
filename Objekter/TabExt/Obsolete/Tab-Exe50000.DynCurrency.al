tableextension 52000 DynCurrencyExt extends "Currency"
{

    fields
    {
        field(50151; xValutaText; Text[30])
        {
            Caption = 'xValutaText';
            FieldClass = Normal;
            //NAL-JHHCalcFormula = Missing;
            DataClassification = CustomerContent;
        }
        field(50152; xKasseKurs; Decimal)
        {
            Caption = 'xKasseKurs';
            FieldClass = Normal;
            //NAL-JHHCalcFormula = Missing;
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Obsolete after BC Update';
        }
        field(50153; "xKasseBehold."; Decimal)
        {
            Caption = 'xKasseBehold.';
            FieldClass = Normal;
            //NAL-JHHCalcFormula = Missing;
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Obsolete after BC Update';
        }
        field(50154; "xKasseBehold.(DKK)"; Decimal)
        {
            Caption = 'xKasseBehold.(DKK)';
            FieldClass = Normal;
            //NAL-JHHCalcFormula = Missing;
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Obsolete after BC Update';
        }

    }

}
