//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70000 "Company Copy Template"
{
    // CC1.5, Company Copy, Emiel Romein eromein@home.nl
    // CC1.5.1 Company Copy, Updateed to Nav 2013 , Itthy 06-10-2013 by jhh@ithy.dk

    Caption = 'Company Copy Template';
    DataPerCompany = false;
    LookupPageID = "Company Copy Templates";

    fields
    {
        field(1; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; "From Company"; Text[30])
        {
            Caption = 'From Company';
            TableRelation = Company;
        }
        field(4; "To Company"; Text[30])
        {
            Caption = 'To Company';
            TableRelation = Company;
        }
        field(5; "Commit After Table Copy"; Boolean)
        {
            Caption = 'Commit After Table Copy';
        }
        field(6; "Only Intercompany"; Boolean)
        {
            Caption = 'Only Intercompany';
            Description = 'Hvis ja ,sker der kun intercompany håndtering , at dette er rette mod til "Firma"';
        }
        field(7; "Use this Codeunit to Company"; Integer)
        {
            Caption = 'Codeunit';
            Description = 'Benyt denne CodeUnit til behandling af intercompany';
            TableRelation = AllObj."Object Type" where("Object Type" = const(Codeunit));
        }
        field(8; "Special Order"; Boolean)
        {
            Caption = 'Special Order';
            Description = 'Intercompany order behandles som specialorder';
        }
        field(9; "Use this Codeunit from Company"; Integer)
        {
            Caption = 'Codeunit';
            Description = 'Benyt denne CodeUnit til behandling af intercompany';
            TableRelation = AllObj."Object Type" where("Object Type" = const(Codeunit));
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Table.SetRange("Template Name", Name);
        Table.DeleteAll := true;
    end;

    var
        "Table": Record "Company Copy Table";
}

