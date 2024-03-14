//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50001 "ProdBom Axapta"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Search Name"; Text[50])
        {
        }
        field(4; "Approved By"; Text[10])
        {
        }
        field(5; "From Date"; Date)
        {
        }
        field(6; "Last Date Modified"; Date)
        {
        }
        field(7; "To Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

