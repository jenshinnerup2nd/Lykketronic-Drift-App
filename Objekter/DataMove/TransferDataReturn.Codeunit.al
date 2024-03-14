//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 72002 "Transfer Data Return"
{
    TableNo = "Field Compare Table";

    trigger OnRun()
    begin
        case StrMenu(TXT001, 1, TXT002) of
            1:
                begin
                    if Rec.ReturnToField = 0 then
                        Error(TXT003);
                    Rec.CalcFields(ConflictData);
                    if Rec.ConflictData = 0 then
                        Error(TXT004);
                    CopyData(Rec, 0);
                end;
            2:
                CopyData(Rec, 1);
        end;
    end;

    var
        TXT001: label 'Only this field,All fields';
        TXT002: label 'What data to be transferred';
        TXT003: label 'There has not been specified code unit or field on this line';
        TXT004: label 'No data to transfer';


    procedure CopyData(FieldCompareTableParam: Record "Field Compare Table"; Scope: Option One,All)
    var
        FieldCompareTable: Record "Field Compare Table";
        FieldTable: Record "Field";
        DataStore: Record "Data Store";
        RecRefLocal: RecordRef;
        FieldRefLocal: FieldRef;
    begin
        FieldCompareTable.Reset;
        FieldCompareTable.SetFilter(ReturnToField, '<>%1', 0);

        //One or All?
        if Scope = Scope::One then begin
            FieldCompareTable.SetRange(Table, FieldCompareTableParam.Table);
            FieldCompareTable.SetRange(FieldNo, FieldCompareTableParam.FieldNo);
        end;

        if FieldCompareTable.FindFirst then
            repeat
                FieldCompareTable.CalcFields("Company Data Common");
                DataStore.Reset;
                //Filter table
                DataStore.SetRange(TableNoKey, FieldCompareTable.Table);
                //Filter field
                DataStore.SetRange(FieldNoKey, FieldCompareTable.FieldNo);
                //Companyfilter
                if not FieldCompareTable."Company Data Common" then
                    DataStore.SetRange(Company, COMPANYNAME)
                else
                    DataStore.SetFilter(Company, '%1', '');

                if (FieldCompareTable.ReturnToField > 0) and DataStore.FindFirst then begin
                    repeat
                        if FieldCompareTable."Company Data Common" then
                            RecRefLocal.Open(FieldCompareTable.Table, false, '')
                        else
                            RecRefLocal.Open(FieldCompareTable.Table, false, DataStore.Company);
                        RecRefLocal.Get(DataStore.RecordIdKey);
                        //Fieldno to save value to
                        FieldRefLocal := RecRefLocal.Field(FieldCompareTable.ReturnToField);
                        //Save value to field depending of datatype
                        case DataStore.DataType of
                            DataStore.Datatype::Integer:
                                FieldRefLocal.Value(DataStore.Integer);
                            DataStore.Datatype::Text:
                                begin
                                    //Textfield will be cut down to max len for desttination-field
                                    FieldTable.Get(FieldCompareTable.Table, FieldCompareTable.ReturnToField);
                                    FieldRefLocal.Value(CopyStr(DataStore.Text, 1, FieldTable.Len));
                                end;
                            DataStore.Datatype::Code:
                                begin
                                    //Codefield will be cut down to max len for desttination-field
                                    FieldTable.Get(FieldCompareTable.Table, FieldCompareTable.ReturnToField);
                                    FieldRefLocal.Value(CopyStr(DataStore.Code, 1, FieldTable.Len));
                                end;
                            DataStore.Datatype::Decimal:
                                FieldRefLocal.Value(DataStore.Decimal);
                            DataStore.Datatype::Option:
                                FieldRefLocal.Value(DataStore.Option);
                            DataStore.Datatype::Boolean:
                                FieldRefLocal.Value(DataStore.Boolean);
                            DataStore.Datatype::Date:
                                FieldRefLocal.Value(DataStore.Date);
                            DataStore.Datatype::Time:
                                FieldRefLocal.Value(DataStore.Time);
                            DataStore.Datatype::DateTime:
                                FieldRefLocal.Value(DataStore.DateTime);
                            //DataStore.DataType::Binary : FieldRefLocal.VALUE(DataStore.Binary);
                            DataStore.Datatype::Blob:
                                begin
                                    DataStore.CalcFields(Blob);
                                    FieldRefLocal.Value(DataStore.Blob);
                                end;
                            DataStore.Datatype::DateFormula:
                                FieldRefLocal.Value(DataStore.DateFormula);
                            //DataStore.DataType::TableFilter : FieldRefLocal.VALUE(DataStore.TableFilter);
                            DataStore.Datatype::BigInteger:
                                FieldRefLocal.Value(DataStore.BigInteger);
                            DataStore.Datatype::Duration:
                                FieldRefLocal.Value(DataStore.Duration);
                            DataStore.Datatype::Guid:
                                FieldRefLocal.Value(DataStore.Guid);
                            DataStore.Datatype::RecordID:
                                FieldRefLocal.Value(DataStore.RecordID);
                        end;
                        //Modify recref
                        RecRefLocal.Modify;
                        //Close recref.
                        RecRefLocal.Close;
                    until DataStore.Next = 0;
                end else begin
                    if FieldCompareTable.ReturnToField < 0 then
                        Codeunit.Run(Abs(FieldCompareTable.ReturnToField), FieldCompareTable);
                end;
            until FieldCompareTable.Next = 0;
    end;
}

