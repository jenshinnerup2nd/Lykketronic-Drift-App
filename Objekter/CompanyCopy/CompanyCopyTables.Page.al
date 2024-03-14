//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70001 "Company Copy Tables"
{
    // CC1.5,  Company Copy, Emiel Romein eromein@home.nl
    // CC1.5.1 Company Copy, Updateed to Nav 2013 , Itthy 06-10-2013 by jhh@ithy.dk

    Caption = 'Company Copy Tables';
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    ShowFilter = false;
    SourceTable = "Company Copy Table";

    layout
    {
        area(content)
        {
            field(CurrentTemplateName; CurrentTemplateName)
            {
                ApplicationArea = Basic;
                Caption = 'Template Name';
                Lookup = true;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SaveRecord;
                    CopyMgt.LookupName(CurrentTemplateName, Rec);
                    CurrPage.Update(false);
                end;
            }
            repeater(Group)
            {
                field("Table No."; Rec."Table No.")
                {
                    ApplicationArea = Basic;
                }
                field("Order"; Rec.Order)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Exist Action"; Rec."Exist Action")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        EnableValidateOnModifyTrigger;
                    end;
                }
                field("Validate OnModify Trigger"; Rec."Validate OnModify Trigger")
                {
                    ApplicationArea = Basic;
                    Editable = ValidateOnModifyTrigger;
                }
                field("Validate OnInsert Trigger"; Rec."Validate OnInsert Trigger")
                {
                    ApplicationArea = Basic;
                }
                field("Skip if Equal Num. of Records"; Rec."Skip if Equal Num. of Records")
                {
                    ApplicationArea = Basic;
                    Editable = SkipifEqualNumofRecords;
                }
                field(Control1000000019; Rec.Fields)
                {
                    ApplicationArea = Basic;
                }
                field("CopyMgt.GetNumOfRecs(Template.""From Company"",""Table No."")"; CopyMgt.GetNumOfRecs(Template."From Company", Rec."Table No."))
                {
                    ApplicationArea = Basic;
                    Caption = 'Number of Record (From Company)';
                    Editable = false;
                }
                field("CopyMgt.GetNumOfRecs(Template.""To Company"",""Table No."")"; CopyMgt.GetNumOfRecs(Template."To Company", Rec."Table No."))
                {
                    ApplicationArea = Basic;
                    Caption = 'Number of Record (To Company)';
                    Editable = false;
                }
                field("To Company Config Temp Header"; Rec."To Company Config Temp Header")
                {
                    ApplicationArea = Basic;
                }
            }
        }

    }

    actions
    {
        area(processing)
        {
            action("Fields")
            {
                ApplicationArea = Basic;
                Caption = 'Fields';
                Image = Journal;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Company Copy Fields";
                RunPageLink = "Template Name" = field("Template Name"),
                              "Table No." = field("Table No.");
            }
            action(Run)
            {
                ApplicationArea = Basic;
                Caption = 'Run';
                Image = Copy;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    CopyMgt.CopyData(CurrentTemplateName);
                end;
            }
            action("Add Table Range")
            {
                ApplicationArea = Basic;
                Caption = 'Add Table Range';
                Image = CopyWorksheet;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(AddTables);
                    AddTables.SetTemplate(Rec."Template Name");
                    AddTables.RunModal;
                end;
            }
            action("Copy all Fields from all Tables")
            {
                ApplicationArea = Basic;
                Caption = 'Copy all Fields from all Tables';
                Image = CopyItem;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.InsertAllFieldsAllTables;
                end;
            }
            action("Copy all Fields from this Table")
            {
                ApplicationArea = Basic;
                Caption = 'Copy all Fields from this Table';
                Image = CopyDocument;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.InsertAllFields(Rec."Table No.");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        EnableValidateOnModifyTrigger;
    end;

    trigger OnInit()
    begin
        //CC1.5.1
        ValidateOnModifyTrigger := true;
        SkipifEqualNumofRecords := true;
    end;

    trigger OnOpenPage()
    begin
        CurrentTemplateName := Rec.GetFilter("Template Name");
        Rec.SetRange("Template Name");
        CopyMgt.OpenJnl(CurrentTemplateName, Rec);

        GetTemplate;

        EnableValidateOnModifyTrigger;
    end;

    var
        AddTables: Report "Company Copy Add Tables";
        CopyMgt: Codeunit "Company Copy Management";
        Template: Record "Company Copy Template";
        CurrentTemplateName: Code[10];
        ValidateOnModifyTrigger: Boolean;
        SkipifEqualNumofRecords: Boolean;


    procedure EnableValidateOnModifyTrigger()
    begin
        //CC 1.5.1
        ValidateOnModifyTrigger := Rec."Exist Action" = Rec."exist action"::Modify;
        SkipifEqualNumofRecords := Rec."Exist Action" = Rec."exist action"::Skip;
    end;


    procedure GetTemplate()
    begin
        if Template.Name <> CurrentTemplateName then
            Template.Get(CurrentTemplateName);
    end;
}

