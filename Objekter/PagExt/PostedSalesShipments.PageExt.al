PageExtension 73014 pageextension73014 extends "Posted Sales Shipments"
{
    layout
    {
        addafter("Shipment Date")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = Basic;
            }

            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

