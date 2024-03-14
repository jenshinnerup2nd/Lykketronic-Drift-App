//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69000 DynPermissionExclude
{
    PageType = List;
    SourceTable = DynPermissionExclude;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RoleID; Rec.RoleID)
                {
                    ApplicationArea = Basic;
                }
                field(RoleName; Rec.RoleName)
                {
                    ApplicationArea = Basic;
                }
                field(ObjectType; Rec.ObjectType)
                {
                    ApplicationArea = Basic;
                }
                field(ObjectID; Rec.ObjectID)
                {
                    ApplicationArea = Basic;
                }
                field(ObjectName; Rec.ObjectName)
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
            action(Update)
            {
                ApplicationArea = Basic;
                Caption = 'Update';
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PermissionSet: Record "Permission Set";
                    OptionObjectType: Record AllObj;
                begin
                    CurrPage.Update(true);

                    if PermissionSet.FindSet(false) then
                        repeat

                            DoObjectType(PermissionSet."Role ID", OptionObjectType."Object Type"::Page);
                            DoObjectType(PermissionSet."Role ID", OptionObjectType."Object Type"::Report);

                        until PermissionSet.Next() = 0;

                    Commit;
                end;
            }
        }
    }


    procedure DoObjectType(_RoleID: Code[20]; _ObjectType: Integer)
    var
        Permission: Record Permission;
        LocalExclude: Record DynPermissionExclude;
        "Object": Record AllObj;
    begin
        if _RoleID = '' then begin
            exit;
        end;

        LocalExclude.SetFilter(RoleID, '=%1', _RoleID);
        LocalExclude.SetRange(ObjectType, _ObjectType);
        if not LocalExclude.IsEmpty() then begin
            Permission.Reset();
            Permission.SetFilter("Role ID", '=%1', _RoleID);
            Permission.SetRange("Object Type", _ObjectType);
            Permission.DeleteAll(true);

            Object.SetRange(Object."Object Type", _ObjectType);
            if Object.FindSet(false) then
                repeat
                    Permission.Reset();
                    Permission.Validate("Role ID", _RoleID);
                    Permission.Validate("Object Type", _ObjectType);
                    Permission.Validate("Object ID", Object."Object ID");
                    Permission.Validate("Execute Permission", Permission."execute permission"::Yes);
                    Permission.Insert(true);
                until Object.Next() = 0;

            Object.Reset();
            if LocalExclude.FindSet(false) then
                repeat
                    if Permission.Get(LocalExclude.RoleID, LocalExclude.ObjectType, LocalExclude.ObjectID) then begin
                        Permission.Delete(true);
                    end;
                until LocalExclude.Next() = 0;
        end
    end;
}

