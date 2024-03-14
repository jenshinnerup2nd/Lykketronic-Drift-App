PageExtension 73021 pageextension73021 extends "Posted Service Invoices"
{
    layout
    {
        addafter("Due Date")
        {
            field("No. Printed"; Rec."No. Printed")
            {
                ApplicationArea = Basic;
            }
        }
    }

}

