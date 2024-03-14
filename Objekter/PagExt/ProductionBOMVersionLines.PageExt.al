PageExtension 73035 pageextension73035 extends "Production BOM Version Lines"
{
    layout
    {
        addfirst(Control1)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Routing Link Code")
        {
            field(pos30; Rec.pos30)
            {
                ApplicationArea = all;
                Caption = 'Position (lykketronic)';
            }

        }
        modify(Position)
        {
            Visible = true;
        }
        modify("Position 2")
        {
            Visible = true;
        }
        modify("Position 3")
        {
            Visible = true;
        }
        modify("Routing Link Code")
        {
            Visible = true;
        }
    }
}

