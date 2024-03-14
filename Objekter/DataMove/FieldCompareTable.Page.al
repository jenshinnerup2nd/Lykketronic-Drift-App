//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 72000 "Field Compare Table"
{
    PageType = List;
    SourceTable = "Field Compare Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Table"; Rec.Table)
                {
                    ApplicationArea = Basic;
                }
                field(FieldNo; Rec.FieldNo)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Key Field"; Rec."Primary Key Field")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(TableName; Rec.TableName)
                {
                    ApplicationArea = Basic;
                }
                field("Company Data Common"; Rec."Company Data Common")
                {
                    ApplicationArea = Basic;
                }
                field("Name Prev"; Rec."Name Prev")
                {
                    ApplicationArea = Basic;
                }
                field("Class Prev"; Rec."Class Prev")
                {
                    ApplicationArea = Basic;
                }
                field("Type Prev"; Rec."Type Prev")
                {
                    ApplicationArea = Basic;
                }
                field("Len Prev"; Rec."Len Prev")
                {
                    ApplicationArea = Basic;
                }
                field("Caption Prev"; Rec."Caption Prev")
                {
                    ApplicationArea = Basic;
                }
                field("Byte Prev"; Rec."Byte Prev")
                {
                    ApplicationArea = Basic;
                }
                field("Prev OptionString"; Rec."Prev OptionString")
                {
                    ApplicationArea = Basic;
                }
                field(RelationTabelNo; Rec.RelationTabelNo)
                {
                    ApplicationArea = Basic;
                }
                field(RelatedFieldNo; Rec.RelatedFieldNo)
                {
                    ApplicationArea = Basic;
                }
                field("Name New"; Rec."Name New")
                {
                    ApplicationArea = Basic;
                }
                field("Class New"; Rec."Class New")
                {
                    ApplicationArea = Basic;
                }
                field("Type New"; Rec."Type New")
                {
                    ApplicationArea = Basic;
                }
                field("Len New"; Rec."Len New")
                {
                    ApplicationArea = Basic;
                }
                field("Caption New"; Rec."Caption New")
                {
                    ApplicationArea = Basic;
                }
                field("Byte New"; Rec."Byte New")
                {
                    ApplicationArea = Basic;
                }
                field("Name Conflict"; Rec."Name Conflict")
                {
                    ApplicationArea = Basic;
                }
                field("Class Change"; Rec."Class Change")
                {
                    ApplicationArea = Basic;
                }
                field("Type Change"; Rec."Type Change")
                {
                    ApplicationArea = Basic;
                }
                field("Len Change"; Rec."Len Change")
                {
                    ApplicationArea = Basic;
                }
                field("Field"; Rec.Field)
                {
                    ApplicationArea = Basic;
                }
                field("Caption Conflict"; Rec."Caption Conflict")
                {
                    ApplicationArea = Basic;
                }
                field(UpdateHandle; Rec.UpdateHandle)
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryKeyField; Rec.PrimaryKeyField)
                {
                    ApplicationArea = Basic;
                }
                field(ConflictData; Rec.ConflictData)
                {
                    ApplicationArea = Basic;
                }
                field(ReturnToField; Rec.ReturnToField)
                {
                    ApplicationArea = Basic;
                }
                field(Comment; Rec.Comment)
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
            action("Find Customer Fields")
            {
                ApplicationArea = Basic;
                Image = Import;
                RunObject = Report "Field Compare 2 versions";
            }
            action("Copy/Move")
            {
                ApplicationArea = Basic;
                Image = MoveDown;
                RunObject = Report "CopyMove Data";
            }
            action("Return Data to Fields")
            {
                ApplicationArea = Basic;
                Image = Insert;
                RunObject = Codeunit "Transfer Data Return";
                Visible = false;
            }
            action("Data Store")
            {
                ApplicationArea = Basic;
                Image = Database;
                RunObject = Page "Data Store";
            }
            action(CreateAlFiles)
            {
                ApplicationArea = Basic;
                Image = CreateXMLFile;
                RunObject = Report CreateAlExtCode;
            }
        }
    }
}

