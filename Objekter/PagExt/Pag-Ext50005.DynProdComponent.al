pageextension 50005 DynProdComponent extends "Prod. Order Components"
{
    layout
    {
        addafter("Remaining Quantity")
        {
            field(pos30; Rec.pos30)
            {
                ApplicationArea = all;
                Caption = 'Position (lykketronic)';
            }
        }
    }
}
