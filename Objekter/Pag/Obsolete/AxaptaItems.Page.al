//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50010 "Axapta Items"
{
    PageType = List;
    SourceTable = "Axapta Items";



    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(NaviNo; Rec.NaviNo)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(ItemGroup; Rec.ItemGroup)
                {
                    ApplicationArea = Basic;
                }
                field(BomUOM; Rec.BomUOM)
                {
                    ApplicationArea = Basic;
                }
                field(note; Rec.note)
                {
                    ApplicationArea = Basic;
                }
                field(RecId; Rec.RecId)
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

