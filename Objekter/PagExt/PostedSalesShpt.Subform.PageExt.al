PageExtension 73011 pageextension73011 extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter(Correction)
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
    }
}

