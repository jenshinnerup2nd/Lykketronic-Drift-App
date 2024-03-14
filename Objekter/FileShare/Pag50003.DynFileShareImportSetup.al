page 50003 DynFileShareImportSetup
{
    ApplicationArea = All;
    Caption = 'File Share Import Setup';
    PageType = Card;
    SourceTable = DynFileShareImportSetup;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(DynFSGArchiveFilePath; Rec.DynFSGArchiveFilePath)
                {
                    ToolTip = 'Specifies the value of the ArchiveFilePath field.';
                }
                field(DynFSGFilePath; Rec.DynFSGFilePath)
                {
                    ToolTip = 'Specifies the value of the FilePath field.';
                }
                field(DynFSGFileSetupHeaderCode; Rec.DynFSGFileSetupHeaderCode)
                {
                    ToolTip = 'Specifies the value of the FileSetupHeaderCode field.';
                }
            }
        }

    }
    actions
    {
        area(Navigation)
        {
            action(Import)
            {
                ApplicationArea = All;
                Caption = 'Create File Share Import log';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                trigger OnAction()
                var
                    IsConfirmed: Boolean;
                    ConfirmManagement: Codeunit "Confirm Management";
                    DynImportFileShare: Codeunit DynImportFileShare;
                begin
                    IsConfirmed := ConfirmManagement.GetResponseOrDefault('Er du sikker på at du ønsker at igangsætte import dette kan tage nogen tid', false);
                    if IsConfirmed then begin
                        DynImportFileShare.FindAndCreateFSGPath();
                    end;
                end;
            }

            action("Open DynFileShareImportLogPage")
            {
                Caption = 'Open File Share Import Log';
                Image = Action;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "DynFileShareImportLogPage";
            }
            // Other actions go here

        }
    }
    // Other actions go here  
    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then begin
            Rec.Key := 1; // Replace 'Key' and 'Value' with your actual key and value
            Rec.Insert();
        end;
    end;

}
