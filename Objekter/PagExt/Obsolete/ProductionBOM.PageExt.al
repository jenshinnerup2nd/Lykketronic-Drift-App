PageExtension 73033 pageextension73033 extends "Production BOM"
{
    actions
    {
        addafter("Copy &BOM")
        {
            action("Create base BOM")
            {
                ApplicationArea = Basic;
                Caption = 'Create base BOM';

                trigger OnAction()
                begin
                    Rec.TestField("No.");
                    if CopyStr(Rec."No.", 1, 5) <> '00000' then begin
                        Message('Kun Axapta-styklister kan udfoldes/splittes');
                        exit;
                    end else
                        splitBOM.baseBOM(Rec."No.");
                end;
            }
            action("Split BOM")
            {
                ApplicationArea = Basic;
                Caption = 'Split BOM';

                trigger OnAction()
                begin
                    Rec.TestField("No.");
                    if CopyStr(Rec."No.", 1, 5) <> '00000' then begin
                        Message('Kun Axapta-styklister kan udfoldes/splittes');
                        exit;
                    end else
                        splitBOM.splitBOM(Rec."No.");
                end;
            }
        }
    }

    var
        splitBOM: Codeunit 50000;
}

