tableextension 50001 DynTrackingSpecification extends "Tracking Specification"
{
    fields
    {
        field(50000; DynItemDescription; Text[100])
        {
            Caption = 'DynItemDescription';
            DataClassification = CustomerContent;
        }
        field(50001; DynExtDescription; Text[100])
        {
            Caption = 'DynExtDescription';
            DataClassification = CustomerContent;
        }
        field(50002; DynExtItem; Text[50])
        {
            Caption = 'DynExtItem';
            DataClassification = CustomerContent;
        }
    }
}
