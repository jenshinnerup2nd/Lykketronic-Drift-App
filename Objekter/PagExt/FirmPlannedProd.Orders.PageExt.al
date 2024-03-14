PageExtension 73030 pageextension73030 extends "Firm Planned Prod. Orders"
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
        addfirst(Reporting)
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

