//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50006 Serienummerrelaton
{

    fields
    {
        field(3; "Færdigvare serienr."; Code[20])
        {
            Caption = 'Serial No.';
            TableRelation = Serienummerrelaton."Færdigvare serienr." where("Færdigvare serienr." = field("Færdigvare serienr."));

            trigger OnLookup()
            begin
                //ItemTrackingMgt.LookupLotSerialNoInfo("Item No.","Variant Code",0,"Serial No.");
            end;
        }
        field(5; "Råvare serienr."; Code[20])
        {
            Caption = 'Serial No.';

            trigger OnLookup()
            begin
                //ItemTrackingMgt.LookupLotSerialNoInfo("Item No.","Variant Code",0,"Serial No.");
            end;
        }
        field(8; "Færdigvarenr."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(10; "Råvarenr."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(12; "Registration Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(14; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(16; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
        }
        field(30; "Færdigvarebeskrivelse"; Text[50])
        {
            Caption = 'Description';
        }
        field(32; "Råvarebeskrivelse"; Text[50])
        {
            Caption = 'Description';
        }
        field(34; FakturaNr; Code[20])
        {
            Caption = 'Faktura Nr.';
            TableRelation = "Sales Invoice Header"."No.";
        }
    }

    keys
    {
        key(Key1; "Færdigvare serienr.", "Råvare serienr.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ItemTrackingMgt: Codeunit "Item Tracking Management";
}

