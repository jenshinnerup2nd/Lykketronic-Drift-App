PageExtension 73029 pageextension73029 extends "Planned Production Orders"
{
    layout
    {
        addafter("Bin Code")
        {
            field("No. Printed"; Rec."No. Printed")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addfirst("F&unctions")
        {
            action("Report Prod. Order - Mat. Req. Lykke")
            {
                ApplicationArea = Basic;
                Caption = 'LT Job Card';
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 50010;
            }
        }
    }
}

