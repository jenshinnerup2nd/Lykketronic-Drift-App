PageExtension 73005 pageextension73005 extends "Purchase Order"
{
    layout
    {
        addafter(Status)
        {
            field("No. Printed"; Rec."No. Printed")
            {
                ApplicationArea = Basic;
            }
        }

    }
    actions
    {

    }
}

