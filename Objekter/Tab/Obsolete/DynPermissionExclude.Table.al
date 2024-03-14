//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69000 DynPermissionExclude
{

    fields
    {
        field(1; RoleID; Code[20])
        {
            Caption = 'Role ID';
            TableRelation = "Permission Set"."Role ID";
        }
        field(2; RoleName; Text[30])
        {
            CalcFormula = lookup("Permission Set".Name where("Role ID" = field(RoleID)));
            Caption = 'Role Name';
            FieldClass = FlowField;
        }
        field(3; ObjectType; Option)
        {
            Caption = 'Object Type';
            OptionCaption = 'Table Data,Table,,Report,,Codeunit,XMLport,MenuSuite,Page,Query,System';
            OptionMembers = "Table Data","Table",,"Report",,"Codeunit","XMLport",MenuSuite,"Page","Query",System;
            ValuesAllowed = Report, Codeunit, XMLport, Page;
        }
        field(4; ObjectID; Integer)
        {
            Caption = 'Object ID';
            TableRelation = AllObj."Object ID" where("Object Type" = field(ObjectType));
        }
        field(5; ObjectName; Text[249])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = field(ObjectType),
                                                                           "Object ID" = field(ObjectID)));
            Caption = 'Object Name';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; RoleID, ObjectType, ObjectID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

