pageextension 50002 DynItemCard extends "Item Card"
{
    layout
    {
        addafter("No.")
        {
            field(NaviNo; Rec.NaviNo)
            {
                ApplicationArea = All;
            }
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All;
            }

        }
        addafter("Shelf No.")
        {
            field(AltShelfNo; Rec.AltShelfNo)
            {
                ApplicationArea = All;

            }
        }

        modify("Description 2")
        {
            Visible = true;
        }
    }
}

