PageExtension 73039 pageextension73039 extends "Planning Worksheet"
{
    layout
    {
        addafter(ItemDescription)
        {
            field(DynUnPlannedWarning; Rec.DynUnPlannedWarning)
            {
                ApplicationArea = Basic;
                Editable = false;
                Enabled = true;
                Importance = Promoted;
                ShowCaption = false;
                Style = Attention;
                StyleExpr = true;
                Visible = true;
            }

        }
    }

    var
        DynUnPlanElement: Record "Untracked Planning Element";

    trigger OnAfterGetRecord()
    begin
        IF DynUnPlanElement.GET(Rec."Worksheet Template Name", Rec."Journal Batch Name", Rec."Line No.", 1) THEN
            Rec.DynUnPlannedWarning := DynUnPlanElement.Source
        ELSE
            Rec.DynUnPlannedWarning := '';
    end;

}

