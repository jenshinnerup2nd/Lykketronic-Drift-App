//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 72000 "CopyMove Data"
{
    // 
    // This report is able to copy or move data from particular field in particular
    // tables to records in table 72001.
    // 
    // The handling of field that is tranfered is setup in table 72000 whre the field
    // "UpdateHandling" is the trigger for copy or export data to table 72001.
    // 
    // For security reason and to avoid the situation that the same data is transfered
    // to table 72001 several times, it is not possible to run this report if table
    // 72001 contains data.
    // 
    // * * * * * WARNING! * * * * *
    // If you run this report and "MOVE" data to table 72001 and afterwards delete
    // records in table 72001, then those data is totaly lost in the particular database!

    ProcessingOnly = true;
    ShowPrintStatus = false;
    UseSystemPrinter = false;

    dataset
    {
        dataitem(Company; Company)
        {
            column(ReportForNavId_1160810000; 1160810000)
            {
            }
            dataitem("Field Compare Table"; "Field Compare Table")
            {
                DataItemTableView = sorting(Table, FieldNo) where(UpdateHandle = filter(true), Field = filter(<> "Deleted Table"));
                RequestFilterFields = "Table", FieldNo;
                column(ReportForNavId_1160810001; 1160810001)
                {
                }

                trigger OnAfterGetRecord()
                var
                    //NAL-JHHEmptyBinary: Binary;
                    EmptyDateformula: DateFormula;
                    EmptyDuration: Duration;
                    EmptyGUID: Guid;
                    EmptyRecId: RecordID;
                begin
                    if ((Table >= 50000) and (Table <= 99999)) or
                      (Table >= 2000000000) then
                        CurrReport.Skip;

                    if "Field Compare Table".Field = "Field Compare Table".Field::"Deleted Table" then
                        CurrReport.Skip;


                    if (Company.Name <> FirstCompanyName) and ("Field Compare Table"."Company Data Common") then
                        CurrReport.Skip;

                    if (Table = 72000) or
                      (Table = 72001) then
                        CurrReport.Skip;

                    SetRange(Table, Table);
                    FindLast;
                    "Field Compare Table".CalcFields("Company Data Common");
                    FBNo += "Field Compare Table".Count;
                    if TableFilter <> '' then
                        SetFilter(Table, TableFilter)
                    else
                        SetRange(Table);
                    W.Update(4, ROUND(FBNo / FB * 10000, 1));

                    Clear(RecordNo);

                    RecRef.Open(Table, false, Company.Name);
                    Records := RecRef.Count;
                    W.Update(3, RecRef.Name);
                    if RecRef.FindFirst then begin
                        //Hent oplysninger om feltnr. og felttype ind i en flerdimensionel Variabel
                        Clear(IFieldsInTable);
                        Clear(IFieldNewLength);
                        FieldBufferTemp.Reset;
                        FieldBufferTemp.SetRange(Table, Table);
                        //Mulighed for at kopiere data fra enkeltfelter i en bestemt tabel
                        if GetFilter(FieldNo) <> '' then
                            Copyfilter(FieldNo, FieldBufferTemp.FieldNo);

                        FieldBufferTemp.SetRange(UpdateHandle, true);
                        FieldBufferTemp.FindSet;
                        repeat
                            IFieldsInTable += 1;
                            IFieldNo[IFieldsInTable] := FieldBufferTemp.FieldNo;
                            IFieldtype[IFieldsInTable] := FieldBufferTemp."Type Prev";

                            //Der er ingen grund til at l¢fte data af tekst og kodefelter, hvis den eneste konflikt er
                            //længdeændring og teksten i feltet ikke overskrider den eksisterende længde på feltet.
                            if (FieldBufferTemp."Type New" = FieldBufferTemp."type new"::Text) or
                              (FieldBufferTemp."Type New" = FieldBufferTemp."type new"::Code) then
                                if (FieldBufferTemp.Field = FieldBufferTemp.Field::" ") and
                                  (not FieldBufferTemp."Class Change") and
                                  (not FieldBufferTemp."Type Change") and
                                  FieldBufferTemp."Len Change" then
                                    IFieldNewLength[IFieldsInTable] := FieldBufferTemp."Len New";
                        until FieldBufferTemp.Next = 0;

                        repeat
                            RecordNo += 1;
                            RecordModified := false;
                            if (RecordNo MOD 1000) = 0 then
                                W.Update(5, ROUND(RecordNo / Records * 10000, 1));
                            for I := 1 to IFieldsInTable do begin
                                IFieldRef := RecRef.Field(IFieldNo[I]);
                                UpdateDataRec.Init;
                                UpdateDataRec.TableNoKey := Table;
                                if not "Company Data Common" then
                                    UpdateDataRec.Company := Company.Name;
                                UpdateDataRec.ID_Rec := ID_RecNext;

                                //Her skal der indsættes en record med data hvis fieldref har value
                                case IFieldtype[I] of
                                    1:
                                        begin
                                            UpdateDataRec.Integer := IFieldRef.Value;
                                            if UpdateDataRec.Integer <> 0 then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(0);
                                            end;
                                        end;
                                    2:
                                        begin
                                            UpdateDataRec.Text := IFieldRef.Value;
                                            if (UpdateDataRec.Text <> '') and (StrLen(UpdateDataRec.Text) > IFieldNewLength[I]) then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value('');
                                            end;
                                        end;
                                    3:
                                        begin
                                            UpdateDataRec.Code := IFieldRef.Value;
                                            if (UpdateDataRec.Code <> '') and (StrLen(UpdateDataRec.Code) > IFieldNewLength[I]) then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value('');
                                            end;
                                        end;
                                    4:
                                        begin
                                            UpdateDataRec.Decimal := IFieldRef.Value;
                                            if UpdateDataRec.Decimal <> 0 then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(0);
                                            end;
                                        end;
                                    5:
                                        begin
                                            UpdateDataRec.Option := IFieldRef.Value;
                                            if UpdateDataRec.Option <> 0 then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(0);
                                            end;
                                        end;
                                    6:
                                        begin
                                            UpdateDataRec.Boolean := IFieldRef.Value;
                                            if UpdateDataRec.Boolean then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(false);
                                            end;
                                        end;
                                    7:
                                        begin
                                            UpdateDataRec.Date := IFieldRef.Value;
                                            if UpdateDataRec.Date <> 0D then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(0D);
                                            end;
                                        end;
                                    8:
                                        begin
                                            UpdateDataRec.Time := IFieldRef.Value;
                                            if UpdateDataRec.Time <> 0T then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(0T);
                                            end;
                                        end;
                                    9:
                                        begin
                                            UpdateDataRec.DateTime := IFieldRef.Value;
                                            if UpdateDataRec.DateTime <> 0DT then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(0DT);
                                            end;
                                        end;
                                    10:
                                        Error('Can not handle Binary data at this moment');
                                    11:
                                        begin
                                            //ERROR('Can not handle BLOB data at this moment. See table %1, field %2',"Field Compare Table".Table,IFieldNo[I]);
                                            IFieldRef.CalcField;
                                            UpdateDataRec.Blob := IFieldRef.Value;
                                            if UpdateDataRec.Blob.Hasvalue then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value := EmptyCompanyBlob.Picture;
                                            end;
                                        end;
                                    12:
                                        begin
                                            UpdateDataRec.DateFormula := IFieldRef.Value;
                                            if UpdateDataRec.DateFormula <> EmptyDateformula then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(EmptyDateformula);
                                            end;
                                        end;
                                    13:
                                        Error('Can not handle TableFilter');
                                    14:
                                        begin
                                            UpdateDataRec.BigInteger := IFieldRef.Value;
                                            if UpdateDataRec.BigInteger <> 0 then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(0);
                                            end;
                                        end;
                                    15:
                                        begin
                                            UpdateDataRec.Duration := IFieldRef.Value;
                                            if UpdateDataRec.Duration <> EmptyDuration then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(EmptyDuration);
                                            end;
                                        end;
                                    16:
                                        begin
                                            UpdateDataRec.Guid := IFieldRef.Value;
                                            if UpdateDataRec.Guid <> EmptyGUID then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(EmptyGUID);
                                            end;
                                        end;
                                    17:
                                        begin
                                            UpdateDataRec.RecordID := IFieldRef.Value;
                                            if Format(UpdateDataRec.RecordID) <> '' then begin
                                                UpdateDataRec.ID += 1;
                                                UpdateDataRec.RecordIdKey := RecRef.RecordId;
                                                UpdateDataRec.RecordKeyTxt := Format(UpdateDataRec.RecordIdKey);
                                                UpdateDataRec.FieldNoKey := IFieldNo[I];
                                                UpdateDataRec.DataType := IFieldtype[I];
                                                UpdateDataRec.Insert;
                                                RecordModified := true;
                                                if Runtype = Runtype::Move then
                                                    IFieldRef.Value(EmptyRecId);
                                            end;
                                        end;
                                end;
                            end;
                            if RecordModified then begin
                                if Runtype = Runtype::Move then
                                    RecRef.Modify;
                                ID_RecNext := ID_RecNext + 1;
                            end;
                        until RecRef.Next = 0;
                    end;
                    RecRef.Close;
                end;

                trigger OnPreDataItem()
                begin
                    Clear(RecordNo);
                    FB := "Field Compare Table".Count;
                    Clear(FBNo);

                    //Gem et evt. tabelfilter
                    TableFilter := "Field Compare Table".GetFilter(Table);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompanyNo += 1;
                W.Update(1, Name);
                W.Update(2, ROUND(CompanyNo / Companies * 10000, 1));
                //UpdateDataRec.CHANGECOMPANY(Name);
                Clear(NextId);
            end;

            trigger OnPostDataItem()
            begin
                Dur := CurrentDatetime - StartTime;
                Message('Processingtime %1', Dur);
            end;

            trigger OnPreDataItem()
            begin
                StartTime := CurrentDatetime;

                W.Open('#1#############################\' +
                       '@2@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\' +
                       '#3#############################\' +
                       '@4@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\' +
                       '@5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

                Companies := Company.Count;

                if UpdateDataRec.Count > 0 then begin
                    if not Confirm('Table 72001 "Data Store" is not empty. There is a risk of creating redundancy data. ' +
                                   'Continue', false) then
                        Error('Report cancel')
                    else begin
                        UpdateDataRec.FindLast;
                        ID_RecNext := UpdateDataRec.ID + 1;
                    end;
                end else
                    //Counter to mark all stored data from the same record with same ID.
                    //Used afterwards to uptimize when back-transfer data to tables from data store
                    ID_RecNext := 1;

                //Stunt for handling empty blobfields
                Clear(EmptyCompanyBlob);
                EmptyCompanyBlob.Insert;
                EmptyCompanyBlob.CalcFields(Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    var
        CompanyRec: Record Company;
    begin
        //Save CompanyName of the first company
        //Used to handle table where DataPerCompany is FALSE together wit handling the first company.

        CompanyRec.Reset;
        CompanyRec.FindFirst;
        FirstCompanyName := CompanyRec.Name;

        case StrMenu('Copy data,Move data', 1) of
            0:
                exit;
            1:
                Runtype := Runtype::Copy;
            2:
                Runtype := Runtype::Move;
        end;
    end;

    var
        TableFilter: Text[1024];
        Runtype: Option Copy,Move;
        StartTime: DateTime;
        Dur: Duration;
        W: Dialog;
        FirstCompanyName: Text[30];
        Companies: Integer;
        CompanyNo: Integer;
        ID_RecNext: BigInteger;
        FB: Integer;
        FBNo: Integer;
        RecRef: RecordRef;
        Records: Integer;
        RecordNo: Integer;
        FieldBufferTemp: Record "Field Compare Table";
        IFieldNo: array[1000] of Integer;
        IFieldtype: array[1000] of Integer;
        IFieldNewLength: array[1000] of Integer;
        IFieldsInTable: Integer;
        I: Integer;
        IFieldRef: FieldRef;
        RecordModified: Boolean;
        NextId: BigInteger;
        UpdateDataRec: Record "Data Store";
        EmptyCompanyBlob: Record "Company Information" temporary;
}

