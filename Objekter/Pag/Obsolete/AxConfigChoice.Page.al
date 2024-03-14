//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50017 "Ax ConfigChoice"
{
    PageType = List;
    SourceTable = "ConfigChoice Axapta";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(AXgroup; Rec.group)
                {
                    ApplicationArea = Basic;
                }
                field(item; Rec.item)
                {
                    ApplicationArea = Basic;
                }
                field(configId; Rec.configId)
                {
                    ApplicationArea = Basic;
                }
                field(chosenItem; Rec.chosenItem)
                {
                    ApplicationArea = Basic;
                }
                field(chosenConfig; Rec.chosenConfig)
                {
                    ApplicationArea = Basic;
                }
                field(recId; Rec.recId)
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

