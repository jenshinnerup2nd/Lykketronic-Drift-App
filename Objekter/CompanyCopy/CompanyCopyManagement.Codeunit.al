//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70000 "Company Copy Management"
{
    // CC1.5,  Company Copy, Emiel Romein eromein@home.nl
    // CC1.5.1 Company Copy, Updateed to Nav 2013 , Itthy 06-10-2013 by jhh@ithy.dk

    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        CopyDataAuto(Rec."Parameter String")
    end;

    var
        Text000: label 'DEFAULT';
        Text001: label 'Default Journal';
        Text002: label 'Are you sure you want to copy data from %1 to %2?';
        Text003: label 'You cannot copy data to the same company.';
        Text004: label 'Table #1######################\@2@@@@@@@@@@@@@@@@@@@@@@@@@@@@\@3@@@@@@@@@@@@@@@@@@@@@@@@@@@@\\#4### records created.\#5### records modified.\#6### records skipped.';
        Text005: label 'Copy of data from %1 to %2 was successful.\\%3 records created.\%4 records modified.\%5 records skipped.';
        Text006: label 'You are about to copy and maybe overwrite data in company %2.\This could mean you will lose data in company %2. If you are having doubts, please create a back-up of company %2. This is the only way you can correct wrongly copied data.\\The developer or distributor of this tool is not responsible for any damage made to any database.\\Are you absolutely sure you want to copy data from %1 to %2.';
        Text007: label 'You are currently working in company %1. It is recommended to run this tool in the same company as the company you want to copy data to (%2). This will ensure the validate functionality.\\Confirm this message to start copying or choose NO to change company.';
        "Session Description": Text[80];
        ConfigTemplateMgt: Codeunit "Config. Template Management";
        ConfigTemplateHeader: Record "Config. Template Header";


    procedure OpenJnl(var CurrentTemplateName: Code[10]; var "Table": Record "Company Copy Table")
    begin
        CheckBatchName(CurrentTemplateName);
        Table.FilterGroup := 2;
        Table.SetRange("Template Name", CurrentTemplateName);
        Table.FilterGroup := 0;
    end;

    local procedure CheckBatchName(var CurrentTemplateName: Code[10])
    var
        Template: Record "Company Copy Template";
    begin
        if not Template.Get(CurrentTemplateName) then begin
            if not Template.Find('-') then begin
                Template.Init;
                Template.Name := Text000;
                Template.Description := Text001;
                Template.Insert(true);
                Commit;
            end;
            CurrentTemplateName := Template.Name;
        end;
    end;


    procedure LookupName(var CurrentTemplateName: Code[10]; var "Table": Record "Company Copy Table")
    var
        Template: Record "Company Copy Template";
    begin
        Commit;
        Template.Name := Table.GetRangemax("Template Name");
        if Page.RunModal(0, Template) = Action::LookupOK then begin
            CurrentTemplateName := Template.Name;
            SetName(CurrentTemplateName, Table);
        end;
    end;


    procedure SetName(CurrentTemplateName: Code[10]; var "Table": Record "Company Copy Table")
    begin
        Table.FilterGroup := 2;
        Table.SetRange("Template Name", CurrentTemplateName);
        Table.FilterGroup := 0;
        if Table.Find('-') then;
    end;


    procedure InsertAllFields(CopyField: Record "Company Copy Field")
    var
        "Field": Record "Field";
    begin
        Field.SetRange(TableNo, CopyField."Table No.");
        Field.SetRange(Class, Field.Class::Normal);
        Field.SetFilter(Type, '<>%1', Field.Type::Blob);
        Field.SetRange(Enabled, true);
        Field.Find('-');
        repeat
            CopyField.Init;
            CopyField.Validate("Field No.", Field."No.");
            if CopyField.Insert then;
        until Field.Next = 0;
    end;


    procedure GetNumOfRecs(CompanyName: Text[30]; TableNo: Integer) NumOfRecs: Integer
    var
    //TableInfo: Record "Table Information";
    begin
        // if TableInfo.Get(CompanyName,TableNo) then
        //   NumOfRecs := TableInfo."No. of Records";
    end;


    procedure CopyData(CurrentTemplateName: Code[10])
    var
        Template: Record "Company Copy Template";
        "Table": Record "Company Copy Table";
        "Field": Record "Company Copy Field";
        FromTable: RecordRef;
        ToTable: RecordRef;
        ToTable2: RecordRef;
        FromField: FieldRef;
        ChangeLogMgt: Codeunit "Change Log Management";
        ToField: FieldRef;
        Window: Dialog;
        CurrRec: Integer;
        NumOfRecs: Integer;
        NumOfRecsCreated: Integer;
        NumOfRecsModified: Integer;
        NumOfRecsSkipped: Integer;
        NumOfTables: Integer;
        CurrTable: Integer;
        ConfigTemplateHeader: Record "Config. Template Header";
    begin
        Template.Get(CurrentTemplateName);

        Template.TestField("From Company");
        Template.TestField("To Company");

        //itthy:JHH:CC2.0
        if Template."Only Intercompany" = false then begin
            ;
            if Template."From Company" = Template."To Company" then
                Error(Text003);

            if Template."To Company" <> COMPANYNAME then
                if not Confirm(Text007, false, COMPANYNAME, Template."To Company") then
                    exit;

            if not Confirm(Text002, false, Template."From Company", Template."To Company") then
                exit;

            if not Confirm(Text006, false, Template."From Company", Template."To Company") then
                exit;

            Window.Open(Text004);

            Table.SetCurrentkey(Order);
            Table.SetRange("Template Name", CurrentTemplateName);
            Table.Find('-');

            NumOfTables := Table.Count;

            repeat
                Table.CalcFields(Name);
                Window.Update(1, StrSubstNo('%1 - %2', Table."Table No.", Table.Name));

                Window.Update(3, ROUND((CurrTable / NumOfTables) * 10000, 1));
                CurrTable := CurrTable + 1; // After update else total progress bar will be 100% while copying last data.

                if not (Table."Skip if Equal Num. of Records" and
                  (GetNumOfRecs(Template."From Company", Table."Table No.") = GetNumOfRecs(Template."To Company", Table."Table No."))) then begin

                    Field.SetRange("Template Name", Table."Template Name");
                    Field.SetRange("Table No.", Table."Table No.");
                    if Field.Find('-') then begin
                        //CC 1.5.1
                        FromTable.Close;
                        //
                        FromTable.Open(Table."Table No.", false, Template."From Company");
                        //CC 1.5.1
                        ToTable.Close;
                        //
                        ToTable.Open(Table."Table No.", false, Template."To Company");

                        if FromTable.Find('-') then begin
                            NumOfRecs := FromTable.Count;
                            CurrRec := 0;
                            repeat
                                CurrRec := CurrRec + 1;
                                Window.Update(2, ROUND((CurrRec / NumOfRecs) * 10000, 1));

                                Field.Find('-');
                                repeat
                                    FromField := FromTable.Field(Field."Field No.");
                                    ToField := ToTable.Field(Field."Field No.");

                                    if Field."Validate Field" then
                                        ToField.Validate(FromField.Value)
                                    else
                                        ToField.Value := FromField.Value;
                                until Field.Next = 0;

                                ToTable2 := ToTable.Duplicate;
                                if ToTable2.Find then begin
                                    case Table."Exist Action" of
                                        Table."exist action"::Modify:
                                            begin
                                                ToTable.Modify(Table."Validate OnModify Trigger");
                                                // To-do 2.0 , Changelog not working
                                                //ChangeLogMgt.LogModification(ToTable,ToTable2);
                                                if ConfigTemplateHeader.Get(Table."To Company Config Temp Header") then
                                                    ConfigTemplateMgt.UpdateRecord(ConfigTemplateHeader, ToTable);

                                                NumOfRecsModified := NumOfRecsModified + 1;
                                                Window.Update(5, NumOfRecsModified);
                                            end;
                                        else begin
                                            NumOfRecsSkipped := NumOfRecsSkipped + 1;
                                            Window.Update(6, NumOfRecsSkipped);
                                        end;
                                    end;
                                end else begin
                                    ToTable.Insert(Table."Validate OnInsert Trigger");
                                    // To-do 2.0 , Changelog not working
                                    //ChangeLogMgt.LogInsertion(ToTable);

                                    if ConfigTemplateHeader.Get(Table."To Company Config Temp Header") then
                                        ConfigTemplateMgt.UpdateRecord(ConfigTemplateHeader, ToTable);


                                    NumOfRecsCreated := NumOfRecsCreated + 1;
                                    Window.Update(4, NumOfRecsCreated);
                                end;
                            until FromTable.Next = 0;
                        end;
                    end;
                    if Template."Commit After Table Copy" then
                        Commit;
                end else begin
                    NumOfRecsSkipped := NumOfRecsSkipped + GetNumOfRecs(Template."From Company", Table."Table No.");
                    Window.Update(6, NumOfRecsSkipped);
                end;
            until Table.Next = 0;

            Message(Text005, Template."From Company", Template."To Company", NumOfRecsCreated, NumOfRecsModified, NumOfRecsSkipped);
            //itthy:JHH:CC2.0 >>
        end else begin
            ;
            RunICFromCompany(Template."Use this Codeunit from Company", Template."From Company");
            Sleep(3000);
            RunICToCompany(Template."Use this Codeunit to Company", Template."To Company");
        end;
        //itthy:JHH:CC2.0 <<
    end;


    procedure RunICFromCompany(RunCodeUnit: Integer; RunInCompany: Text[80])
    var
        SessionID: Integer;
        Ok: Boolean;
    begin
        "Session Description" := StrSubstNo('Logoff session, codeunit %1 exececuted in %2', RunCodeUnit, RunInCompany);

        Ok := StartSession(SessionID, RunCodeUnit, RunInCompany);

        if Ok then begin
            ;
            StartSession(SessionID, RunCodeUnit, RunInCompany);
            StopSession(SessionID, "Session Description");
        end else begin
            ;
            Error('The session was not started successfully.');
        end;
    end;


    procedure RunICToCompany(RunCodeUnit: Integer; RunInCompany: Text[80])
    var
        SessionID: Integer;
        Ok: Boolean;
    begin
        "Session Description" := StrSubstNo('Logoff session, codeunit %1 exececuted in %2', RunCodeUnit, RunInCompany);

        Ok := StartSession(SessionID, RunCodeUnit, RunInCompany);

        if Ok then begin
            ;
            StartSession(SessionID, RunCodeUnit, RunInCompany);
            StopSession(SessionID, "Session Description");
        end else begin
            ;
            Error('The session was not started successfully.');
        end;
    end;


    procedure CopyDataAuto(CurrentTemplateName: Code[10])
    var
        Template: Record "Company Copy Template";
        "Table": Record "Company Copy Table";
        "Field": Record "Company Copy Field";
        FromTable: RecordRef;
        ToTable: RecordRef;
        ToTable2: RecordRef;
        FromField: FieldRef;
        ChangeLogMgt: Codeunit "Change Log Management";
        ToField: FieldRef;
        Window: Dialog;
        CurrRec: Integer;
        NumOfRecs: Integer;
        NumOfRecsCreated: Integer;
        NumOfRecsModified: Integer;
        NumOfRecsSkipped: Integer;
        NumOfTables: Integer;
        CurrTable: Integer;
        ConfigTemplateHeader: Record "Config. Template Header";
    begin
        if not Template.Get(CurrentTemplateName) then
            exit;

        Template.TestField("From Company");
        Template.TestField("To Company");

        //itthy:JHH:CC2.0
        if Template."Only Intercompany" = false then begin
            ;
            if Template."From Company" = Template."To Company" then
                Error(Text003);
            //No validateion in Auto
            /*
              IF Template."To Company" <> COMPANYNAME THEN
                IF NOT CONFIRM(Text007,FALSE,COMPANYNAME,Template."To Company") THEN
                  EXIT;

              IF NOT CONFIRM(Text002,FALSE,Template."From Company",Template."To Company") THEN
                EXIT;

              IF NOT CONFIRM(Text006,FALSE,Template."From Company",Template."To Company") THEN
                EXIT;
            */
            Window.Open(Text004);

            Table.SetCurrentkey(Order);
            Table.SetRange("Template Name", CurrentTemplateName);
            Table.Find('-');

            NumOfTables := Table.Count;

            repeat
                Table.CalcFields(Name);
                Window.Update(1, StrSubstNo('%1 - %2', Table."Table No.", Table.Name));

                Window.Update(3, ROUND((CurrTable / NumOfTables) * 10000, 1));
                CurrTable := CurrTable + 1; // After update else total progress bar will be 100% while copying last data.

                if not (Table."Skip if Equal Num. of Records" and
                  (GetNumOfRecs(Template."From Company", Table."Table No.") = GetNumOfRecs(Template."To Company", Table."Table No."))) then begin

                    Field.SetRange("Template Name", Table."Template Name");
                    Field.SetRange("Table No.", Table."Table No.");
                    if Field.Find('-') then begin
                        //CC 1.5.1
                        FromTable.Close;
                        //
                        FromTable.Open(Table."Table No.", false, Template."From Company");
                        //CC 1.5.1
                        ToTable.Close;
                        //
                        ToTable.Open(Table."Table No.", false, Template."To Company");

                        if FromTable.Find('-') then begin
                            NumOfRecs := FromTable.Count;
                            CurrRec := 0;
                            repeat
                                CurrRec := CurrRec + 1;
                                Window.Update(2, ROUND((CurrRec / NumOfRecs) * 10000, 1));

                                Field.Find('-');
                                repeat
                                    FromField := FromTable.Field(Field."Field No.");
                                    ToField := ToTable.Field(Field."Field No.");

                                    if Field."Validate Field" then
                                        ToField.Validate(FromField.Value)
                                    else
                                        ToField.Value := FromField.Value;
                                until Field.Next = 0;

                                ToTable2 := ToTable.Duplicate;
                                if ToTable2.Find then begin
                                    case Table."Exist Action" of
                                        Table."exist action"::Modify:
                                            begin
                                                ToTable.Modify(Table."Validate OnModify Trigger");
                                                // To-do 2.0 , Changelog not working
                                                //ChangeLogMgt.LogModification(ToTable,ToTable2);
                                                if ConfigTemplateHeader.Get(Table."To Company Config Temp Header") then
                                                    ConfigTemplateMgt.UpdateRecord(ConfigTemplateHeader, ToTable);

                                                NumOfRecsModified := NumOfRecsModified + 1;
                                                Window.Update(5, NumOfRecsModified);
                                            end;
                                        else begin
                                            NumOfRecsSkipped := NumOfRecsSkipped + 1;
                                            Window.Update(6, NumOfRecsSkipped);
                                        end;
                                    end;
                                end else begin
                                    ToTable.Insert(Table."Validate OnInsert Trigger");
                                    // To-do 2.0 , Changelog not working
                                    //ChangeLogMgt.LogInsertion(ToTable);

                                    if ConfigTemplateHeader.Get(Table."To Company Config Temp Header") then
                                        ConfigTemplateMgt.UpdateRecord(ConfigTemplateHeader, ToTable);


                                    NumOfRecsCreated := NumOfRecsCreated + 1;
                                    Window.Update(4, NumOfRecsCreated);
                                end;
                            until FromTable.Next = 0;
                        end;
                    end;
                    if Template."Commit After Table Copy" then
                        Commit;
                end else begin
                    NumOfRecsSkipped := NumOfRecsSkipped + GetNumOfRecs(Template."From Company", Table."Table No.");
                    Window.Update(6, NumOfRecsSkipped);
                end;
            until Table.Next = 0;

            Message(Text005, Template."From Company", Template."To Company", NumOfRecsCreated, NumOfRecsModified, NumOfRecsSkipped);
            //itthy:JHH:CC2.0 >>
        end else begin
            ;
            RunICFromCompany(Template."Use this Codeunit from Company", Template."From Company");
            Sleep(3000);
            RunICToCompany(Template."Use this Codeunit to Company", Template."To Company");
        end;
        //itthy:JHH:CC2.0 <<

    end;
}

