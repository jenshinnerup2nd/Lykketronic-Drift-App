//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72000 "Field Compare Table"
{
    DataPerCompany = false;

    fields
    {
        field(1; "Table"; Integer)
        {
        }
        field(2; FieldNo; Integer)
        {
        }
        field(3; TableName; Text[30])
        {
        }
        field(6; "Company Data Common"; Boolean)
        {
            // CalcFormula = exist("Table Information" where ("Table No."=field(Table),
            //                                                "Company Name"=filter('')));
            FieldClass = FlowField;
        }
        field(7; ReturnToField; Integer)
        {
            Caption = 'Return to Field/-Codeunit';

            trigger OnValidate()
            var
                ObjectTable: Record AllObj;
                TXT001: label 'Codeunit with ID = %1 does not exist in current database.';
                FieldTable: Record "Field";
                TXT002: label 'Field %1 in table %2 does not exist in current database';
                FieldCompareTableLocal: Record "Field Compare Table";
                TXT003: label 'It is not allowed to map different data to the same field i the same table. Se mapping to field %1';
                TXT004: label 'It seems like you try to map datatype "%1" to a field with the datatype "%2"';
            begin
                if ReturnToField <> 0 then begin
                    if ReturnToField > 0 then begin
                        //Does field exist in current database
                        if not FieldTable.Get(Table, ReturnToField) then
                            Message(TXT002, ReturnToField, Table);

                        FieldCompareTableLocal.Reset;
                        FieldCompareTableLocal.SetRange(Table, Table);
                        FieldCompareTableLocal.SetFilter(FieldNo, '<>%1', FieldNo);
                        FieldCompareTableLocal.SetRange(ReturnToField, ReturnToField);
                        if FieldCompareTableLocal.FindFirst then
                            Error(TXT003, FieldCompareTableLocal.FieldNo);

                        case FieldTable.Type of
                            4912:
                                if "Type Prev" <> "type prev"::TableFilter then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            4988:
                                if "Type Prev" <> "type prev"::RecordID then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            11519, 31488:
                                if "Type Prev" <> "type prev"::Text then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            11775:
                                if "Type Prev" <> "type prev"::Date then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            11776:
                                if "Type Prev" <> "type prev"::Time then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            11797:
                                if "Type Prev" <> "type prev"::DateFormula then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            12799:
                                if "Type Prev" <> "type prev"::Decimal then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            33791:
                                if "Type Prev" <> "type prev"::Binary then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            33793:
                                if "Type Prev" <> "type prev"::Blob then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            34047:
                                if "Type Prev" <> "type prev"::Boolean then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            34559:
                                if "Type Prev" <> "type prev"::Integer then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            35071, 31489:
                                if "Type Prev" <> "type prev"::Code then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            35583:
                                if "Type Prev" <> "type prev"::Option then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            36095:
                                if "Type Prev" <> "type prev"::BigInteger then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            36863:
                                if "Type Prev" <> "type prev"::Duration then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            37119:
                                if "Type Prev" <> "type prev"::Guid then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                            37375:
                                if "Type Prev" <> "type prev"::DateTime then
                                    Message(TXT004, Format("Type Prev"), Format(FieldTable.Type));
                        end;




                    end else begin
                        if not ObjectTable.Get(ObjectTable."Object Type"::Codeunit, '', Abs(ReturnToField)) then
                            Message(TXT001, Abs(ReturnToField));
                    end;
                end;
            end;
        }
        field(8; Comment; Text[250])
        {
        }
        field(10; "Class Prev"; Option)
        {
            OptionMembers = Normal,FlowField,FlowFilter;
        }
        field(11; "Type Prev"; Option)
        {
            OptionMembers = " ","Integer",Text,"Code",Decimal,Option,Boolean,Date,Time,DateTime,Binary,BLOB,DateFormula,TableFilter,BigInteger,Duration,Guid,RecordID;
        }
        field(12; "Len Prev"; Integer)
        {
        }
        field(13; "Name Prev"; Text[30])
        {
        }
        field(14; "Caption Prev"; Text[100])
        {
        }
        field(15; "Byte Prev"; Integer)
        {
        }
        field(16; "Primary Key Field"; Boolean)
        {
        }
        field(17; RelationTabelNo; Integer)
        {
        }
        field(18; RelatedFieldNo; Integer)
        {
        }
        field(19; "Prev OptionString"; Text[250])
        {
        }
        field(20; "Name New"; Text[30])
        {
        }
        field(21; "Class New"; Option)
        {
            OptionMembers = Normal,FlowField,FlowFilter;
        }
        field(22; "Type New"; Option)
        {
            OptionMembers = " ","Integer",Text,"Code",Decimal,Option,Boolean,Date,Time,DateTime,Binary,BLOB,DateFormula,TableFilter,BigInteger,Duration,Guid,RecordID;
        }
        field(23; "Len New"; Integer)
        {
        }
        field(24; "Caption New"; Text[100])
        {
        }
        field(25; "Byte New"; Integer)
        {
        }
        field(30; "Name Conflict"; Boolean)
        {
        }
        field(31; "Class Change"; Boolean)
        {
        }
        field(32; "Type Change"; Boolean)
        {
        }
        field(33; "Len Change"; Boolean)
        {
        }
        field(34; "Field"; Option)
        {
            OptionMembers = " ","New Field","Deleted Field","Deleted Table";
        }
        field(35; "Caption Conflict"; Boolean)
        {
        }
        field(100; UpdateHandle; Boolean)
        {
        }
        field(101; PrimaryKeyField; Boolean)
        {
        }
        field(102; ConflictData; Integer)
        {
            CalcFormula = count("Data Store" where(TableNoKey = field(Table),
                                                    FieldNoKey = field(FieldNo)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Table", FieldNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

