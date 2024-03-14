tableextension 52006 DynItemJournalLineExt extends "Item Journal Line"
{
    fields
    {
        field(50000; NaviNo; Code[20])
        {
            Caption = 'Navision varenr.';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
    }
}
