pageextension 50001 DynItemListeExt extends "Item List"
{
    layout
    {
        addafter("No.")
        {
            field(NaviNo; Rec.NaviNo)
            {
                ApplicationArea = All;

            }
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All;

            }

        }
        modify("Description 2")
        {
            Visible = true;
        }

        addafter("Vendor No.")
        {
            field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Prod. Order"; Rec."Qty. on Prod. Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Component Lines"; Rec."Qty. on Component Lines")
            {
                ApplicationArea = All;
            }
        }
        addfirst(factboxes)
        {
            // BC 23.4 and after
            // part(DocumentAttacmentDetails; DynDocAttachmentList)
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "No." = field("No.");

            // }
            // BC 23.3 and before
            part(DocumentAttacmentDetails; DynDocAttachmentList233)
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");

            }
        }
    }
    actions
    {
        addlast(Reports)
        {
            action(VareLabel)
            {
                Caption = 'Vare - label';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                Image = "1099Form";
                RunObject = Report 50111;
            }
        }

    }

}


