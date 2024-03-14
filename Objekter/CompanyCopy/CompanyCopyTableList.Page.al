//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70003 "Company Copy Table List"
{
    // CC1.5,  Company Copy, Emiel Romein eromein@home.nl
    // CC1.5.1 Company Copy, Updateed to Nav 2013 , Itthy 06-10-2013 by jhh@ithy.dk

    Editable = false;
    PageType = ListPart;
    SourceTable = AllObj;
    SourceTableView = where("Object Type" = const(Table));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID; Rec."Object ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec."Object Name")
                {
                    ApplicationArea = Basic;
                }
                field(Caption; Caption)
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

