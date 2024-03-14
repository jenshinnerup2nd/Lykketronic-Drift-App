PageExtension 73020 pageextension73020 extends "Posted Service Shipments"
{
    layout
    {
        addafter("Service Time (Hours)")
        {
            field("No. Printed"; Rec."No. Printed")
            {
                ApplicationArea = Basic;
            }
        }
    }

}

