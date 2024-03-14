PageExtension 73025 pageextension73025 extends "Item Replenishment FactBox"
{
    layout
    {
        //Unsupported feature: Property Modification (Lookup) on ""Vendor No."(Control 5)".
        modify("Vendor No.")
        {
            trigger OnDrillDown();
            var
                vendorRec: Record Vendor;
                VendorPage: page "Vendor Card";
            begin
                vendorRec.GET(Rec."Vendor No.");
                VendorPage.SETRECORD(vendorRec);
                VendorPage.RUNMODAL;
            end;
        }
    }

}

