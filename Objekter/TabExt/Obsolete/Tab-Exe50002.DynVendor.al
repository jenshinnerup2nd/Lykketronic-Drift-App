tableextension 52002 DynVendorExt extends "Vendor"
{
    fields
    {
        field(50001; postingGroupOLD; Code[10])
        {
            Caption = 'postingGroupOLD';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
    }
}
