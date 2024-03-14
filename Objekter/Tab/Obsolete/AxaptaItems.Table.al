//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50003 "Axapta Items"
{
    // jan2014 VD/age: used by CU 50000 - do not delete!
    fields
    {
        field(1; No; Text[30])
        {
        }
        field(2; NaviNo; Text[30])
        {
        }
        field(3; Description; Text[50])
        {
        }
        field(4; ItemGroup; Text[30])
        {
        }
        field(5; BomUOM; Text[30])
        {
        }
        field(6; RecId; Integer)
        {
        }
        field(7; note; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; NaviNo)
        {
        }
    }

    fieldgroups
    {
    }
}

