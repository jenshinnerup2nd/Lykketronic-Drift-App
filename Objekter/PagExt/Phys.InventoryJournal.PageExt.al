PageExtension 73018 pageextension73018 extends "Phys. Inventory Journal"
{
    layout
    {
        addafter("Item No.")
        {
            field(NaviNo; Rec.NaviNo)
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
    }
}

