//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70004 "Company Copy Field List"
{
    // CC1.5,  Company Copy, Emiel Romein eromein@home.nl
    // CC1.5.1 Company Copy, Updateed to Nav 2013 , Itthy 06-10-2013 by jhh@ithy.dk

    PageType = ListPart;
    SourceTable = "Field";

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
                field(FieldName; Rec.FieldName)
                {
                    ApplicationArea = Basic;
                }
                field("Field Caption"; Rec."Field Caption")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }


}

