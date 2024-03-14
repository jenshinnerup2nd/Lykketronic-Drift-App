//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 72001 "Field Compare 2 versions"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = sorting(Number) order(ascending) where(Number = filter(1));
            column(ReportForNavId_1160810000; 1160810000)
            {
            }

            trigger OnAfterGetRecord()
            begin

                W.Update(1, 'Importer tabel felter');
                Field.Reset;
                Field.SetFilter(TableNo, '..%1|%2..', 49999, 100000);
                Field.SetFilter("No.", '%1..%2', 50000, 99999);
                if Field.FindSet then
                    repeat
                        if LastTable <> Field.TableNo then begin
                            LastTable := Field.TableNo;
                            W.Update(2, Format(+LastTable) + ' - ' + Field.TableName);
                        end;

                        with Field do begin
                            if not FieldBuffer.Get(Field.TableNo, Field."No.") then begin
                                FieldBuffer.Init;
                                FieldBuffer.Table := Field.TableNo;
                                FieldBuffer.FieldNo := Field."No.";
                                FieldBuffer.Insert;
                            end;

                            case Source of
                                Source::Previous:
                                    begin
                                        FieldBuffer."Class Prev" := Field.Class;
                                        FieldBuffer.TableName := Field.TableName;
                                        case Field.Type of
                                            4912:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::TableFilter;
                                            4988:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::RecordID;
                                            11519, 31488:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Text;
                                            11775:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Date;
                                            11776:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Time;
                                            11797:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::DateFormula;
                                            12799:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Decimal;
                                            33791:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Binary;
                                            33793:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Blob;
                                            34047:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Boolean;
                                            34559:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Integer;
                                            35071, 31489:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Code;
                                            35583:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Option;
                                            36095:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::BigInteger;
                                            36863:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Duration;
                                            37119:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::Guid;
                                            37375:
                                                FieldBuffer."Type Prev" := FieldBuffer."type prev"::DateTime;
                                        end;
                                        FieldBuffer."Name Prev" := Field.FieldName;
                                        FieldBuffer."Len Prev" := Field.Len;
                                        FieldBuffer."Caption Prev" := Field."Field Caption";
                                        FieldBuffer.RelationTabelNo := Field.RelationTableNo;
                                        FieldBuffer.RelatedFieldNo := Field.RelationFieldNo;
                                        FieldBuffer."Prev OptionString" := Field.OptionString;
                                    end;
                            end;
                            FieldBuffer.UpdateHandle := true;
                            FieldBuffer.Modify;
                        end;
                    until Field.Next = 0;
            end;

            trigger OnPostDataItem()
            var
                Fieldbuffer_Local: Record "Field Compare Table";
            begin

                W.Update(1, 'Analyze');

                //Test på om der er importeret nye felter inden fors¢g på sammenligning
                Fieldbuffer_Local.Reset;
                Fieldbuffer_Local.SetFilter("Name New", '<>%1', '');
                if Fieldbuffer_Local.FindFirst then begin
                    FieldBuffer.Reset;
                    FieldBuffer.FindFirst;
                    repeat
                        if LastTable <> FieldBuffer.Table then begin
                            LastTable := FieldBuffer.Table;
                            W.Update(2, Format(LastTable) + ' - ' + FieldBuffer.TableName);
                        end;
                        FieldBuffer.Field := FieldBuffer.Field::" ";
                        FieldBuffer."Name Conflict" := false;
                        FieldBuffer."Caption Conflict" := false;
                        FieldBuffer."Class Change" := false;
                        FieldBuffer."Type Change" := false;
                        FieldBuffer."Len Change" := false;
                        FieldBuffer.UpdateHandle := false;

                        if (FieldBuffer."Name Prev" = '') and (FieldBuffer."Name New" <> '') then
                            FieldBuffer.Field := FieldBuffer.Field::"New Field"
                        else begin
                            if FieldBuffer."Name New" = '' then
                                if TableDeleted(FieldBuffer.Table) then
                                    FieldBuffer.Field := FieldBuffer.Field::"Deleted Table"
                                else
                                    FieldBuffer.Field := FieldBuffer.Field::"Deleted Field";
                            if FieldBuffer."Name Prev" <> FieldBuffer."Name New" then
                                FieldBuffer."Name Conflict" := true;
                            if FieldBuffer."Caption Prev" <> FieldBuffer."Caption New" then
                                FieldBuffer."Caption Conflict" := true;
                            if FieldBuffer."Class Prev" <> FieldBuffer."Class New" then begin
                                FieldBuffer."Class Change" := true;
                            end;
                            if FieldBuffer."Type Prev" <> FieldBuffer."Type New" then begin
                                FieldBuffer."Type Change" := true;
                            end;
                            if (FieldBuffer."Type Prev" = FieldBuffer."type prev"::Text) or
                              (FieldBuffer."Type Prev" = FieldBuffer."type prev"::Code) or
                              (FieldBuffer."Type New" = FieldBuffer."type new"::Text) or
                              (FieldBuffer."Type New" = FieldBuffer."type new"::Code) then
                                if FieldBuffer."Len Prev" > FieldBuffer."Len New" then begin
                                    FieldBuffer."Len Change" := true;
                                end;
                        end;
                        FieldBuffer.UpdateHandle := true;
                        FieldBuffer.Modify;

                    until FieldBuffer.Next = 0;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if EmptyBuffer = true then begin
                    FieldBuffer.Reset;
                    FieldBuffer.DeleteAll(true);
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(EmptyBuffer; EmptyBuffer)
                {
                    ApplicationArea = Basic;
                    Caption = 'Empty buffer';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        Source := Source::Previous
    end;

    trigger OnPreReport()
    begin
        W.Open('Action #1################################\' +
               'Table  #2################################');
    end;

    var
        W: Dialog;
        LastTable: Integer;
        IFile: File;
        IFileLine: Text[1024];
        "Field": Record "Field";
        CurrentDBPreviusVersion: Boolean;
        NewVersion: Option "Before 6.00","6.01","6.02","6.03","6.04","6.05","6.06","2013","2013R2","2013R2S","2015","2016";
        "Danish NAV/TRIMIT": Boolean;
        BufferUpdated: Boolean;
        FieldBuffer: Record "Field Compare Table";
        FieldTable: Record "Field";
        Importtype: Option "Generel sammenligning","Import i fb. med opdateringsanalyse",Konverteringstabeller;
        FileName: Text[250];
        Source: Option "-",Previous,New;
        EmptyBuffer: Boolean;
        "FieldExport Functions": Codeunit "FieldExport Functions";


    procedure TableDeleted(TableNo: Integer): Boolean
    var
        BufferLocal: Record "Field Compare Table";
    begin
        BufferLocal.Reset;
        BufferLocal.SetRange(Table, TableNo);
        BufferLocal.SetFilter("Name New", '<>%1', '');
        exit(BufferLocal.Count = 0);
    end;
}

