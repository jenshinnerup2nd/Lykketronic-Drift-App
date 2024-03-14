PageExtension 73015 pageextension73015 extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Shipment Date")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = Basic;
            }

        }
    }
    actions
    {
        addfirst(Processing)
        {

        }
    }
}

