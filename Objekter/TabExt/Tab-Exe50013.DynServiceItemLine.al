tableextension 52013 DynServiceItemLineExt extends "Service Item Line"
{
    fields
    {
        field(50000; PostingDate; Date)
        {
            Caption = 'PostingDate';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
    }
}
