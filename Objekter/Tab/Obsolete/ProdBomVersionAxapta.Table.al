//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50004 "ProdBomVersion Axapta"
{

    fields
    {
        field(1; BomId; Text[30])
        {
        }
        field(2; ItemId; Text[30])
        {
        }
        field(3; Name; Text[30])
        {
        }
        field(4; ApprovedBy; Text[30])
        {
        }
        field(5; ModifiedBy; Text[30])
        {
        }
        field(6; RecId; Integer)
        {
        }
        field(7; FromDate; Date)
        {
        }
        field(8; ToDate; Date)
        {
        }
    }

    keys
    {
        key(Key1; BomId)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

