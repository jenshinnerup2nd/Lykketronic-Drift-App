//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50001 "Item List Edit"
{
    PageType = List;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("No. 2"; Rec."No. 2")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                // field("Product Group Code";Rec."Product Group Code")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Statistics Group"; Rec."Statistics Group")
                {
                    ApplicationArea = Basic;
                }
                field("Production BOM No."; Rec."Production BOM No.")
                {
                    ApplicationArea = Basic;
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                    ApplicationArea = Basic;
                }
                field("Flushing Method"; Rec."Flushing Method")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    ApplicationArea = Basic;
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = Basic;
                }
                field("Tariff No."; Rec."Tariff No.")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = Basic;
                }
                field("Low-Level Code"; Rec."Low-Level Code")
                {
                    ApplicationArea = Basic;
                }
                field("Serial Nos."; Rec."Serial Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Replenishment System"; Rec."Replenishment System")
                {
                    ApplicationArea = Basic;
                }
                field("Reordering Policy"; Rec."Reordering Policy")
                {
                    ApplicationArea = Basic;
                }
                field("Manufacturing Policy"; Rec."Manufacturing Policy")
                {
                    ApplicationArea = Basic;
                }
                field("Rescheduling Period"; Rec."Rescheduling Period")
                {
                    ApplicationArea = Basic;
                }
                field("Safety Lead Time"; Rec."Safety Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ApplicationArea = Basic;
                }
                field("Reorder Point"; Rec."Reorder Point")
                {
                    ApplicationArea = Basic;
                }
                field("Reorder Quantity"; Rec."Reorder Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Discrete Order Quantity"; Rec."Discrete Order Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Order Multiple"; Rec."Order Multiple")
                {
                    ApplicationArea = Basic;
                }
                field("Manufacturer Code"; Rec."Manufacturer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Stockout Warning"; Rec."Stockout Warning")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Cost is Posted to G/L"; Rec."Cost is Posted to G/L")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Prevent Negative Inventory"; Rec."Prevent Negative Inventory")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

