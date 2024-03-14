//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50014 "ProdBomVersion Axapta"
{
    PageType = List;
    SourceTable = "ProdBomVersion Axapta";
    ObsoleteState = Pending;
    ObsoleteReason = 'Delete this page when no longer needed. Old customer data';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(BomId; Rec.BomId)
                {
                    ApplicationArea = Basic;
                }
                field(ItemId; Rec.ItemId)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedBy; Rec.ApprovedBy)
                {
                    ApplicationArea = Basic;
                }
                field(ModifiedBy; Rec.ModifiedBy)
                {
                    ApplicationArea = Basic;
                }
                field(RecId; Rec.RecId)
                {
                    ApplicationArea = Basic;
                }
                field(FromDate; Rec.FromDate)
                {
                    ApplicationArea = Basic;
                }
                field(ToDate; Rec.ToDate)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

