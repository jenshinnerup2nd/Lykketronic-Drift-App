//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70001 "Company Copy Table"
{
    // CC1.5, Company Copy, Emiel Romein eromein@home.nl
    // CC1.5.1 Company Copy, Updateed to Nav 2013 , Itthy 06-10-2013 by jhh@ithy.dk

    Caption = 'Company Copy Table';
    DataPerCompany = false;

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
            TableRelation = AllObj."Object ID" where("Object Type" = const(Table));

            trigger OnValidate()
            begin
                CalcFields(Name);
            end;
        }
        field(3; Name; Text[30])
        {
            CalcFormula = lookup(AllObj."Object Name" where("Object Type" = const(Table),
                                                    "Object ID" = field("Table No.")));
            Caption = 'Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Fields"; Integer)
        {
            CalcFormula = count("Company Copy Field" where("Template Name" = field("Template Name"),
                                                            "Table No." = field("Table No.")));
            Caption = 'Fields';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Order"; Integer)
        {
            Caption = 'Order';
        }
        field(6; "Exist Action"; Option)
        {
            Caption = 'Exist Action';
            OptionCaption = 'Skip,Modify';
            OptionMembers = Skip,Modify;

            trigger OnValidate()
            begin
                if "Exist Action" = "exist action"::Skip then
                    "Validate OnModify Trigger" := false;

                if "Exist Action" = "exist action"::Modify then
                    "Skip if Equal Num. of Records" := false;
            end;
        }
        field(7; "Validate OnModify Trigger"; Boolean)
        {
            Caption = 'Validate OnModify Trigger';
        }
        field(8; "Validate OnInsert Trigger"; Boolean)
        {
            Caption = 'Validate OnInsert Trigger';
        }
        field(9; "Skip if Equal Num. of Records"; Boolean)
        {
            Caption = 'Skip if Equal Num. of Records';
        }
        field(10; "To Company Config Temp Header"; Code[10])
        {
            Caption = 'To Company Template';
            TableRelation = "Config. Template Header".Code where("Table ID" = field("Table No."));
        }
    }

    keys
    {
        key(Key1; "Template Name", "Table No.")
        {
            Clustered = true;
        }
        key(Key2; "Order")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Field.SetRange("Template Name", "Template Name");
        Field.SetRange("Table No.", "Table No.");
        Field.DeleteAll;
    end;

    var
        "Table": Record "Company Copy Table";
        "Field": Record "Company Copy Field";
        CopyMgt: Codeunit "Company Copy Management";
        Text000: label 'Are you sure you want to add all fields from all tables?';


    procedure InsertAllFieldsAllTables()
    begin
        if not Confirm(Text000, false) then
            exit;

        Table.SetRange(Table."Template Name", "Template Name");
        Table.Find('-');
        repeat
            InsertAllFields(Table."Table No.");
        until Table.Next = 0;
    end;


    procedure InsertAllFields(TableNo: Integer)
    begin
        Field.SetRange("Template Name", "Template Name");
        Field.SetRange("Table No.", TableNo);
        Field."Template Name" := "Template Name";
        Field."Table No." := TableNo;
        CopyMgt.InsertAllFields(Field);
    end;


    procedure InitNewRecord()
    begin
        Table.Copy(Rec);
        if Table.Find('+') then
            Order := Table.Order + 10
        else
            Order := 10;
    end;
}

