//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 72001 "Return Data to Fields"
{
    // Rettet sammen med FGB så den kan lade codeunits selvom der ikke er mappet data ud.

    Subtype = Upgrade;

    trigger OnRun()
    var
        Counter: Integer;
        win: Dialog;
    begin
    end;

    var
        RecRefLocal: RecordRef;
        FieldRefLocal: FieldRef;
        DataStore: Record "Data Store";
        IObject: Record AllObj;


    procedure CheckPrecondition()
    var
        FieldTable: Record "Field";
        FieldCompareTable: Record "Field Compare Table";
        TXT004: label 'It seems like you try to map datatype "%1" to a field with the datatype "%2"';
        TXT005: label 'Datatype "%1" is not supported in 2015';
    begin
        FieldCompareTable.Reset;
        FieldCompareTable.SetFilter(ReturnToField, '<>%1', 0);
        //Correct trnsfer datatype to datatype
        if FieldCompareTable.FindFirst then
            repeat
                if FieldCompareTable.ReturnToField > 0 then begin
                    //Tablefilter not supported in 2015
                    if FieldCompareTable."Type Prev" = FieldCompareTable."type prev"::TableFilter then
                        Error(TXT005, Format(FieldCompareTable."Type Prev"));
                    //Binary data not supported in 2015
                    if FieldCompareTable."Type Prev" = FieldCompareTable."type prev"::Binary then
                        Error(TXT005, Format(FieldCompareTable."Type Prev"));

                    FieldTable.Get(FieldCompareTable.Table, FieldCompareTable.ReturnToField);
                    case FieldTable.Type of
                        4988:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::RecordID then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        11519, 31488:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Text then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        11775:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Date then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        11776:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Time then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        11797:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::DateFormula then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        12799:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Decimal then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        33793:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Blob then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        34047:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Boolean then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        34559:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Integer then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        35071, 31489:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Code then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        35583:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Option then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        36095:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::BigInteger then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        36863:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Duration then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        37119:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::Guid then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                        37375:
                            if FieldCompareTable."Type Prev" <> FieldCompareTable."type prev"::DateTime then
                                Error(TXT004, Format(FieldCompareTable."Type Prev"), Format(FieldTable.Type));
                    end
                end else begin
                    if not IObject.Get(IObject."Object Type"::Codeunit, '', Abs(FieldCompareTable.ReturnToField)) then
                        Error('Codeunit %1 do not exist in the database.', Abs(FieldCompareTable.ReturnToField));
                end;
            until FieldCompareTable.Next = 0;
    end;

    procedure CopyData()
    var
        TransferDataReturn: Codeunit "Transfer Data Return";
        FieldCompareTable: Record "Field Compare Table";
        FieldTable: Record "Field";
    begin
        TransferDataReturn.CopyData(FieldCompareTable, 1);
    end;

    local procedure FirstCompany(): Boolean
    var
        CompanyLocal: Record Company;
    begin
        CompanyLocal.Reset;
        CompanyLocal.FindFirst;
        exit(COMPANYNAME = CompanyLocal.Name);
    end;
}

