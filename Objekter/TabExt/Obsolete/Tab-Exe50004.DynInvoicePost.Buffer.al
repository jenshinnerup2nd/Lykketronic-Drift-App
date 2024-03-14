tableextension 52004 DynInvoicePostBufferExt extends "Invoice Post. Buffer"
{
    fields
    {
        field(50000; Description; Text[50])
        {
            Caption = 'Description';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
    }
}
