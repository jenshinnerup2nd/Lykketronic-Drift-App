//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 72002 CreateAlExtCode
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            MaxIteration = 1;
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                FieldCompareTable.Reset;
                FieldCompareTable.SetFilter(Table, '6..27');
                if FieldCompareTable.FindSet then
                    repeat
                        if (TabelNoVar <> FieldCompareTable.Table) and (TabelNoVar <> 0) then begin
                            // ExportFile.Write('        }');
                            // ExportFile.Write('}');
                            // ExportFile.Close;
                        end;

                        if TabelNoVar <> FieldCompareTable.Table then begin
                            ObjCounter += 1;
                            // ExportFile.Create(ExportPatch + 'Tab-Exe'+Format(ExpoprtStartObjNo+ObjCounter)+'.Dyn'+ DelChr(FieldCompareTable.TableName,'=',' \/') +'.al');
                            // ExportFile.TextMode(true);
                            // ExportFile.Write('tableextension ' + Format(ExpoprtStartObjNo+ObjCounter) + ' Dyn'+ DelChr(FieldCompareTable.TableName,'=',' ')+'Ext extends "' + FieldCompareTable.TableName+'"');
                            // ExportFile.Write('{');
                            // ExportFile.Write('    fields');
                            // ExportFile.Write('    {');
                        end;


                        FieldTypeText := Format(FieldCompareTable."Type Prev");
                        case FieldCompareTable."Type Prev" of
                            FieldCompareTable."type prev"::Code, FieldCompareTable."type prev"::Text:
                                begin
                                    FieldTypeText := FieldTypeText + '[' + Format(FieldCompareTable."Len Prev") + ']'
                                end;
                        end; //END CASE

                        // ExportFile.Write('        field('+Format(FieldCompareTable.FieldNo)+'; '+FieldCompareTable."Name Prev" + '; ' + FieldTypeText + ')');
                        // ExportFile.Write('        {');
                        // ExportFile.Write('            Caption = ' + Format(FieldCompareTable."Caption Prev") + TextSign + ';');
                        // ExportFile.Write('            FieldClass = '+Format(FieldCompareTable."Class Prev") + ';');
                        // ExportFile.Write('            CalcFormula = '+'Missing' + ';');

                        if FieldCompareTable."Class Prev" = FieldCompareTable."class prev"::Normal then begin
                            //ExportFile.Write('            DataClassification = CustomerContent' + ';');
                        end;

                        if FieldCompareTable."Type Prev" = FieldCompareTable."type prev"::Option then begin
                            // ExportFile.Write('            OptionMembers = '+Format(FieldCompareTable."Prev OptionString") + ';');
                            // ExportFile.Write('            OptionCaption = ' + TextSign + Format(FieldCompareTable."Prev OptionString") + TextSign + ';');
                        end;

                        //ExportFile.Write('        }');
                        TabelNoVar := FieldCompareTable.Table;
                    until FieldCompareTable.Next = 0;
            end;

            trigger OnPostDataItem()
            begin
                // ExportFile.Write('}');
                // ExportFile.Close;

                Message('Oprette %1 filer', ObjCounter);
            end;

            trigger OnPreDataItem()
            begin
                if CopyStr(ExportPatch, StrLen(ExportPatch)) <> '\' then begin
                    ExportPatch := ExportPatch + '\';
                end;
                Clear(ObjCounter);
                ExpoprtStartObjNo := ExpoprtStartObjNo - 1;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1000000001)
                {
                    field(ExportPatch; ExportPatch)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Export Folder';
                    }
                    field(ExpoprtStartObjNo; ExpoprtStartObjNo)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Start Obj No.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            ExpoprtStartObjNo := 50000;
        end;
    }

    labels
    {
    }

    var
        ExportPatch: Text[250];
        ExpoprtStartObjNo: Integer;
        ObjCounter: Integer;
        ExportFile: File;
        FieldCompareTable: Record "Field Compare Table";
        TabelNoVar: Integer;
        FieldTypeText: Text[50];
        CalcFormulaText: Text[250];
        EditableText: Text[20];
        TextSign: label '''';
}

