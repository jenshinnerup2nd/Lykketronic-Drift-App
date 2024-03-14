table 50013 DynProdCompQtyHolder
{
    Caption = 'DynProdCompQtyHolder';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Status; Enum "Production Order Status")
        {
            Caption = 'Status';
        }
        field(2; ProdOrderNo; Code[20])
        {
            Caption = 'ProdOrderNo';
        }
        field(3; RoutingNo; Code[20])
        {
            Caption = 'RoutingNo';
        }
        field(4; ItemNo; Code[20])
        {
            Caption = 'ItemNo';
        }
        field(5; FirstLineNo; Integer)
        {
            Caption = 'FirstLineNo';
        }
        field(6; Pos1; Text[50])
        {
            Caption = 'Pos1';
        }
        field(7; Pos2; Text[50])
        {
            Caption = 'Pos2';
        }
        field(8; LineNo; Integer)
        {
            Caption = 'Line No';
        }
        field(9; Qty; Decimal)
        {
            Caption = 'qty';
        }
    }
    keys
    {
        key(PK; Status, ProdOrderNo, RoutingNo, ItemNo, FirstLineNo, Pos1, Pos2, LineNo)
        {
            Clustered = true;
        }
    }
}
