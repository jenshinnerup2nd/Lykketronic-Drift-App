tableextension 50010 DynSalesInvoiceLineExt extends "Sales Invoice Line"
{
    fields
    {
        field(50160; "xMod.BlanketNr"; Code[10])
        {
            Caption = 'xMod.BlanketNr';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50161; xKode; Code[10])
        {
            Caption = 'xKode';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
    }
}
