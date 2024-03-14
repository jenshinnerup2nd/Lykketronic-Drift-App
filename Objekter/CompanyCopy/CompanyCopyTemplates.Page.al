//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70000 "Company Copy Templates"
{
    // CC1.5,  Company Copy, Emiel Romein eromein@home.nl
    // CC1.5.1 Company Copy, Updateed to Nav 2013 , Itthy 06-10-2013 by jhh@ithy.dk

    Caption = 'Company Copy Templates';
    PageType = List;
    SourceTable = "Company Copy Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("From Company"; Rec."From Company")
                {
                    ApplicationArea = Basic;
                }
                field("To Company"; Rec."To Company")
                {
                    ApplicationArea = Basic;
                }
                field("Commit After Table Copy"; Rec."Commit After Table Copy")
                {
                    ApplicationArea = Basic;
                }
                field("Only Intercompany"; Rec."Only Intercompany")
                {
                    ApplicationArea = Basic;
                }
                field("Special Order"; Rec."Special Order")
                {
                    ApplicationArea = Basic;
                }
                field("Use this Codeunit from Company"; Rec."Use this Codeunit from Company")
                {
                    ApplicationArea = Basic;
                }
                field("Use this Codeunit to Company"; Rec."Use this Codeunit to Company")
                {
                    ApplicationArea = Basic;
                }
            }
        }

    }

    actions
    {
        area(creation)
        {
            action(Setup)
            {
                ApplicationArea = Basic;
                Caption = 'Setup';
                Description = 'Create / Edit Company Copy Setup';
                Image = Setup;
                Promoted = true;
                PromotedCategory = New;
                RunObject = Page "Company Copy Tables";
                RunPageLink = "Template Name" = field(Name);
                ToolTip = 'Create / Edit Company Copy Setup';
            }
            action("Company Copy")
            {
                ApplicationArea = Basic;
                Caption = 'Company Copy';
                Description = 'Run company copy ';
                Image = Apply;
                Promoted = true;
                ToolTip = 'Run company copy ';

                trigger OnAction()
                begin
                    CopyMgt.CopyData(Rec.Name);
                end;
            }
        }
    }

    var
        CopyMgt: Codeunit "Company Copy Management";
}

