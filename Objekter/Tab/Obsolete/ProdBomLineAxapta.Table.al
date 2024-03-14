//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50002 "ProdBomLine Axapta"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            TableRelation = "ProdBomVersion Axapta".BomId;
        }
        field(2; Line; Decimal)
        {
        }
        field(4; Type; Integer)
        {
        }
        field(5; ItemNo; Code[20])
        {
        }
        field(6; UOM; Code[10])
        {
        }
        field(7; qty; Decimal)
        {
        }
        field(8; Position; Text[30])
        {
        }
        field(9; ConfigGroupId; Text[30])
        {
            TableRelation = "Standard Task".Code;
        }
        field(10; InventDimId; Text[30])
        {
            TableRelation = Family;
        }
        field(11; ItemBomId; Text[30])
        {
        }
        field(12; level; Integer)
        {
        }
        field(13; seq; Integer)
        {
        }
        field(14; ItemNo2; Text[10])
        {
        }
    }

    keys
    {
        key(Key1; "No.", Line, ItemNo, level, seq, ItemBomId)
        {
            Clustered = true;
            SQLIndex = "No.", Line, ItemNo, level, seq, ItemBomId;
        }
    }

    fieldgroups
    {
    }
}

