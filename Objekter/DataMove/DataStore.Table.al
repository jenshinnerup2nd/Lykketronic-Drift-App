//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72001 "Data Store"
{
    //       4912  : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::TableFilter;
    //       4988  : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::RecordID;
    //       11519, 31488 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Text;
    //       11775 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Date;
    //       11776 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Time;
    //       11797 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::DateFormula;
    //       12799 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Decimal;
    //       33791 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Binary;
    //       33793 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::BLOB;
    //       34047 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Boolean;
    //       34559 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Integer;
    //       35071, 31489 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Code;
    //       35583 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Option;
    //       36095 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::BigInteger;
    //       36863 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Duration;
    //       37119 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::Guid;
    //       37375 : FieldBuffer."Type Prev" := FieldBuffer."Type Prev"::DateTime;

    DataPerCompany = false;
    DrillDownPageID = "Data Store";
    LookupPageID = "Data Store";

    fields
    {
        field(1; ID; BigInteger)
        {
        }
        field(2; Company; Text[30])
        {
        }
        field(3; RecordIdKey; RecordID)
        {
        }
        field(4; FieldNoKey; Integer)
        {
        }
        field(5; TableNoKey; Integer)
        {
        }
        field(6; DataType; Option)
        {
            OptionMembers = " ","Integer",Text,"Code",Decimal,Option,Boolean,Date,Time,DateTime,Binary,BLOB,DateFormula,TableFilter,BigInteger,Duration,Guid,RecordID;
        }
        field(7; ID_Rec; Integer)
        {
        }
        field(8; RecordKeyTxt; Text[250])
        {
        }
        field(10; "Integer"; Integer)
        {
        }
        field(11; Text; Text[250])
        {
        }
        field(12; "Code"; Code[250])
        {
        }
        field(13; Decimal; Decimal)
        {
        }
        field(14; Option; Option)
        {
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50";
        }
        field(15; Boolean; Boolean)
        {
        }
        field(16; Date; Date)
        {
        }
        field(17; Time; Time)
        {
        }
        field(19; Blob; Blob)
        {
        }
        field(20; DateFormula; DateFormula)
        {
        }
        field(22; BigInteger; BigInteger)
        {
        }
        field(23; Duration; Duration)
        {
        }
        field(24; Guid; Guid)
        {
        }
        field(25; RecordID; RecordID)
        {
        }
        field(26; DateTime; DateTime)
        {
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
        key(Key2; TableNoKey, FieldNoKey)
        {
        }
    }

    fieldgroups
    {
    }
}

