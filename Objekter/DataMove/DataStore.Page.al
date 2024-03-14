//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 72001 "Data Store"
{
    PageType = List;
    SourceTable = "Data Store";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Company; Rec.Company)
                {
                    ApplicationArea = Basic;
                }
                field(RecordKeyTxt; Rec.RecordKeyTxt)
                {
                    ApplicationArea = Basic;
                }
                field(FieldNoKey; Rec.FieldNoKey)
                {
                    ApplicationArea = Basic;
                    Visible = CFieldNo;
                }
                field(TableNoKey; Rec.TableNoKey)
                {
                    ApplicationArea = Basic;
                    Visible = CTableNo;
                }
                field(ID_Rec; Rec.ID_Rec)
                {
                    ApplicationArea = Basic;
                }
                field("Integer"; Rec.Integer)
                {
                    ApplicationArea = Basic;
                    Visible = CInteger;
                }
                field(Text; Rec.Text)
                {
                    ApplicationArea = Basic;
                    Visible = CText;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Visible = CCode;
                }
                field(Decimal; Rec.Decimal)
                {
                    ApplicationArea = Basic;
                    Visible = CDecimal;
                }
                field(Option; Rec.Option)
                {
                    ApplicationArea = Basic;
                    Visible = COption;
                }
                field(Boolean; Rec.Boolean)
                {
                    ApplicationArea = Basic;
                    Visible = CBoolean;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Visible = CDate;
                }
                field(Time; Time)
                {
                    ApplicationArea = Basic;
                    Visible = CTime;
                }
                field(Blob; Rec.Blob)
                {
                    ApplicationArea = Basic;
                    Visible = CBLOB;
                }
                field(DateFormula; Rec.DateFormula)
                {
                    ApplicationArea = Basic;
                    Visible = CDateFormula;
                }
                field(BigInteger; Rec.BigInteger)
                {
                    ApplicationArea = Basic;
                    Visible = CBigInteger;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    Visible = CDuration;
                }
                field(Guid; Rec.Guid)
                {
                    ApplicationArea = Basic;
                    Visible = CGUID;
                }
                field(RecordID; Rec.RecordID)
                {
                    ApplicationArea = Basic;
                    Visible = CRecordID;
                }
                field(DateTime; Rec.DateTime)
                {
                    ApplicationArea = Basic;
                    Visible = CDateTime;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        if (Rec.GetFilter(TableNoKey) <> '') and (Rec.GetFilter(FieldNoKey) <> '') then
            TypeFilter := true
        else
            TypeFilter := false;
    end;

    trigger OnOpenPage()
    begin
        if (Rec.GetFilter(TableNoKey) <> '') and (Rec.GetFilter(FieldNoKey) <> '') then
            TypeFilter := true
        else
            TypeFilter := false;

        if TypeFilter then begin
            Rec.FindFirst;

            CTableNo := false;
            CFieldNo := false;
            CInteger := false;
            CText := false;
            CCode := false;
            CDecimal := false;
            COption := false;
            CBoolean := false;
            CDate := false;
            CTime := false;
            //CBinary := FALSE;
            CBLOB := false;
            CDateFormula := false;
            //CTableFilter := FALSE;
            CBigInteger := false;
            CDuration := false;
            CGUID := false;
            CRecordID := false;
            CDateTime := false;

            case Rec.DataType of
                Rec.Datatype::Integer:
                    CInteger := true;
                Rec.Datatype::Text:
                    CText := true;
                Rec.Datatype::Code:
                    CCode := true;
                Rec.Datatype::Decimal:
                    CDecimal := true;
                Rec.Datatype::Option:
                    COption := true;
                Rec.Datatype::Boolean:
                    CBoolean := true;
                Rec.Datatype::Date:
                    CDate := true;
                Rec.Datatype::Time:
                    CTime := true;
                Rec.Datatype::DateTime:
                    CDateTime := true;
                //DataType::Binary : CBinary := TRUE;
                Rec.Datatype::Blob:
                    CBLOB := true;
                Rec.Datatype::DateFormula:
                    CDateFormula := true;
                //DataType::TableFilter : CTableFilter := TRUE;
                Rec.Datatype::BigInteger:
                    CBigInteger := true;
                Rec.Datatype::Duration:
                    CDuration := true;
                Rec.Datatype::Guid:
                    CGUID := true;
                Rec.Datatype::RecordID:
                    CRecordID := true;
            end;
        end else begin
            CTableNo := true;
            CFieldNo := true;
            CInteger := true;
            CText := true;
            CCode := true;
            CDecimal := true;
            COption := true;
            CBoolean := true;
            CDate := true;
            CTime := true;
            //CBinary := TRUE;
            CBLOB := true;
            CDateFormula := true;
            //CTableFilter := TRUE;
            CBigInteger := true;
            CDuration := true;
            CGUID := true;
            CRecordID := true;
            CDateTime := true;
        end;
    end;

    var
        TypeFilter: Boolean;
        CTableNo: Boolean;
        CFieldNo: Boolean;
        CInteger: Boolean;
        CText: Boolean;
        CCode: Boolean;
        CDecimal: Boolean;
        COption: Boolean;
        CBoolean: Boolean;
        CDate: Boolean;
        CTime: Boolean;
        CBLOB: Boolean;
        CDateFormula: Boolean;
        CBigInteger: Boolean;
        CDuration: Boolean;
        CGUID: Boolean;
        CRecordID: Boolean;
        CDateTime: Boolean;
}

