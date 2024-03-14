tableextension 52001 DynCustomerExt extends "Customer"
{
    fields
    {
        field(50150; xGarantiPeriodeSalg; Code[10])
        {
            Caption = 'xGarantiPeriodeSalg';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50151; "xE-mail"; Text[50])
        {
            Caption = 'xE-mail';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50152; xwww; Text[50])
        {
            Caption = 'xwww';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50153; postingGroupOLD; Code[10])
        {
            Caption = 'postingGroupOLD';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
    }
}
