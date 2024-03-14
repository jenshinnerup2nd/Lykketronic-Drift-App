tableextension 50003 DynSalesLineExt extends "Sales Line"
{
    fields
    {
        field(50000; DynInventory; Decimal)
        {
            Caption = 'Antal på lager';
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")));

        }
        field(50001; DynProduction; Decimal)
        {
            Caption = 'Antal i Produktion';
            //     // FieldClass = FlowField;
            //     // CalcFormula = sum("Reservation Entry"."Quantity (Base)" where( "Item No." = field("No."),
            //     //                                                                "Source Type" = const(5406),
            //     //                                                                "Source Subtype" = filter("1" .. "3")));
        }
        field(50002; DynPurchase; Decimal)
        {
            Caption = 'Antal i Købsordre';
            //     FieldClass = FlowField;
            //     CalcFormula = sum("Purchase Line"."Outstanding Qty. (Base)" where("Document Type" = const(Order),
            //                                                                        Type = const(Item),
            //                                                                        "No." = field("No.")));
        }
        field(50003; DynItemDescription; Text[100])
        {
            Caption = 'Varebeskrivelse';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field("No.")));
        }
        field(50004; DynCustomerName; Text[100])
        {
            Caption = 'Kunde';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Sell-to Customer Name" where("No." = field("Document No.")));
        }
        field(50005; DynSalesRef; Text[100])
        {
            Caption = 'Salgsreferance';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."External Document No." where("Document Type" = field("Document Type"),
                                                                      "No." = field("Document No.")));
        }

    }
    keys
    {
        key(DynKey1; "Shipment Date", "Document Type", "Document No.")
        {

        }

    }
}
