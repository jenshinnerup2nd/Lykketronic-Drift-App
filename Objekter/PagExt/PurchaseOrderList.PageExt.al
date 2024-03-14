PageExtension 73027 pageextension73027 extends "Purchase Order List"
{
    layout
    {
        addafter("Job Queue Status")
        {
            field("No. Printed"; Rec."No. Printed")
            {
                ApplicationArea = Basic;
            }
            field("Promised Receipt Date"; Rec."Promised Receipt Date")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

    }
}

