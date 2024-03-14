//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70002 "Company Copy Field"
{
    // CC1.0, Company Copy, Emiel Romein eromein@home.nl
    // CC1.5.1 Company Copy, Updateed to Nav 2013 , Itthy 06-10-2013 by jhh@ithy.dk

    Caption = 'Company Copy Field';
    DataPerCompany = false;
    DrillDownPageID = "Company Copy Fields";

    fields
    {
        field(1; "Template Name"; Code[10])
        {
            Caption = 'Template Name';
            NotBlank = true;
            TableRelation = "Company Copy Template";
        }
        field(2; "Table No."; Integer)
        {
            Caption = 'Table No.';
            NotBlank = true;
            TableRelation = "Company Copy Table"."Table No.";
        }
        field(3; "Field No."; Integer)
        {
            Caption = 'Field No.';
            NotBlank = true;
            TableRelation = Field."No." where(TableNo = field("Table No."),
                                               Class = const(Normal),
                                               Type = filter(<> BLOB),
                                               Enabled = const(true));

            trigger OnValidate()
            begin
                CalcFields(Name);

                if Field.Get("Table No.", "Field No.") then
                    //VALIDATE("Table Relation",Field.RelationTableNo);
                    "Table Relation" := Field.RelationTableNo;
            end;
        }
        field(4; Name; Text[30])
        {
            CalcFormula = lookup(Field.FieldName where(TableNo = field("Table No."),
                                                        "No." = field("Field No.")));
            Caption = 'Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Validate Field"; Boolean)
        {
            Caption = 'Validate Field';
        }
        field(6; "Table Relation"; Integer)
        {
            Caption = 'Table Relation';
            Editable = false;
            TableRelation = AllObj."Object ID" where("Object Type" = const(Table));

            trigger OnValidate()
            begin
                CalcFields("Table Relation Name");
            end;
        }
        field(7; "Table Relation Name"; Text[30])
        {
            CalcFormula = lookup(AllObj."Object Name" where("Object Type" = const(Table),
                                                    "Object ID" = field("Table Relation")));
            Caption = 'Table Relation Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Template Name", "Table No.", "Field No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        "Field": Record "Field";
}

