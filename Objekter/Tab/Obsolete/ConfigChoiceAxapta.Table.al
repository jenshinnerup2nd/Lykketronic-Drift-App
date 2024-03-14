//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50000 "ConfigChoice Axapta"
{
    // jan2014 VD/age: used by CU 50000 - do not delete!


    fields
    {
        field(1; group; Code[10])
        {
        }
        field(2; item; Code[20])
        {
        }
        field(3; configId; Code[10])
        {
        }
        field(4; chosenItem; Code[20])
        {
        }
        field(5; chosenConfig; Code[10])
        {
        }
        field(6; recId; Integer)
        {
        }
    }

    keys
    {
        key(Key1; recId)
        {
            Clustered = true;
            SQLIndex = recId;
        }
        key(Key2; group, item, configId, recId)
        {
            SQLIndex = group, item, configId, recId;
        }
    }

    fieldgroups
    {
    }
}

