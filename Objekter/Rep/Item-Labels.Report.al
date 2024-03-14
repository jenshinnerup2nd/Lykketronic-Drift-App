//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50110 "Item - Labels"
{
    // //Dynalogic, srn 08012015
    //   kopi af debitor etiketter
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Item - Labels.rdl';

    Caption = 'Item - Labels';

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_6836; 6836)
            {
            }
            column(CustAddr_1__1_; CustAddr[1] [1])
            {
            }
            column(CustAddr_1__2_; CustAddr[1] [2])
            {
            }
            column(CustAddr_1__3_; CustAddr[1] [3])
            {
            }
            column(CustAddr_1__4_; CustAddr[1] [4])
            {
            }
            column(CustAddr_1__5_; CustAddr[1] [5])
            {
            }
            column(CustAddr_1__6_; CustAddr[1] [6])
            {
            }
            column(CustAddr_2__1_; CustAddr[2] [1])
            {
            }
            column(CustAddr_2__2_; CustAddr[2] [2])
            {
            }
            column(CustAddr_2__3_; CustAddr[2] [3])
            {
            }
            column(CustAddr_2__4_; CustAddr[2] [4])
            {
            }
            column(CustAddr_2__5_; CustAddr[2] [5])
            {
            }
            column(CustAddr_2__6_; CustAddr[2] [6])
            {
            }
            column(CustAddr_3__1_; CustAddr[3] [1])
            {
            }
            column(CustAddr_3__2_; CustAddr[3] [2])
            {
            }
            column(CustAddr_3__3_; CustAddr[3] [3])
            {
            }
            column(CustAddr_3__4_; CustAddr[3] [4])
            {
            }
            column(CustAddr_3__5_; CustAddr[3] [5])
            {
            }
            column(CustAddr_3__6_; CustAddr[3] [6])
            {
            }
            column(CustAddr_1__7_; CustAddr[1] [7])
            {
            }
            column(CustAddr_1__8_; CustAddr[1] [8])
            {
            }
            column(CustAddr_2__7_; CustAddr[2] [7])
            {
            }
            column(CustAddr_2__8_; CustAddr[2] [8])
            {
            }
            column(CustAddr_3__7_; CustAddr[3] [7])
            {
            }
            column(CustAddr_3__8_; CustAddr[3] [8])
            {
            }
            column(ShowBody1; (ColumnNo = 0) and (LabelFormat = Labelformat::"36 x 70 mm (3 columns)"))
            {
            }
            column(GroupNo1; GroupNo)
            {
            }
            column(ShowBody2; (ColumnNo = 0) and (LabelFormat = Labelformat::"37 x 70 mm (3 columns)"))
            {
            }
            column(ShowBody3; (ColumnNo = 0) and (LabelFormat = Labelformat::"36 x 105 mm (2 columns)"))
            {
            }
            column(ShowBody4; (ColumnNo = 0) and (LabelFormat = Labelformat::"37 x 105 mm (2 columns)"))
            {
            }

            trigger OnAfterGetRecord()
            var
                iCopy: Integer;
                c: Integer;
            begin
                iCopy := 1;
                for c := iCopy to QtyLabels do begin

                    RecordNo := RecordNo + 1;
                    ColumnNo := ColumnNo + 1;

                    CustAddr[ColumnNo, 1] := Item."No.";
                    CustAddr[ColumnNo, 2] := Item.Description;
                    CustAddr[ColumnNo, 3] := ' ';
                    CustAddr[ColumnNo, 4] := Item.NaviNo;
                    iCopy := iCopy + 1;

                    if RecordNo = NoOfRecords then begin
                        for i := ColumnNo + 1 to NoOfColumns do
                            Clear(CustAddr[i]);
                        ColumnNo := 0;
                    end else begin
                        if ColumnNo = NoOfColumns then
                            ColumnNo := 0;
                    end;

                    if ColumnNo = 0 then begin
                        if Counter = RecPerPageNum then begin
                            GroupNo := GroupNo + 1;
                            Counter := 0;
                        end;
                        Counter := Counter + 1;
                    end;
                end;
                /*
                RecordNo := RecordNo + 1;
                ColumnNo := ColumnNo + 1;
                //FormatAddr.Customer(CustAddr[ColumnNo],Customer);
                CustAddr[ColumnNo,2] := Item."No.";
                CustAddr[ColumnNo,3] := Item.Description;
                CustAddr[ColumnNo,4] := Item.NaviNo;
                
                IF RecordNo = NoOfRecords THEN BEGIN
                  FOR i := ColumnNo + 1 TO NoOfColumns DO
                    CLEAR(CustAddr[i]);
                  ColumnNo := 0;
                END ELSE BEGIN
                  IF ColumnNo = NoOfColumns THEN
                    ColumnNo := 0;
                END;
                
                IF ColumnNo = 0 THEN BEGIN
                  IF Counter = RecPerPageNum THEN BEGIN
                    GroupNo := GroupNo + 1;
                    Counter := 0;
                  END;
                  Counter := Counter + 1;
                END;
                */

            end;

            trigger OnPreDataItem()
            begin
                case LabelFormat of
                    Labelformat::"36 x 70 mm (3 columns)", Labelformat::"37 x 70 mm (3 columns)":
                        NoOfColumns := 3;
                    Labelformat::"36 x 105 mm (2 columns)", Labelformat::"37 x 105 mm (2 columns)":
                        NoOfColumns := 2;
                end;
                QtyLabels := 3;   //Altid bare 3 af hver
                NoOfRecords := Count * QtyLabels;
                //NoOfRecords := COUNT;
                RecordNo := 0;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(LabelFormat; LabelFormat)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Format';
                        OptionCaption = '36 x 70 mm (3 columns),37 x 70 mm (3 columns)';
                    }
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
        QtyLabels := 1;
    end;

    trigger OnPreReport()
    begin
        GroupNo := 1;
        RecPerPageNum := 5;
    end;

    var
        LabelFormat: Option "36 x 70 mm (3 columns)","37 x 70 mm (3 columns)","36 x 105 mm (2 columns)","37 x 105 mm (2 columns)";
        CustAddr: array[3, 8] of Text[50];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        i: Integer;
        GroupNo: Integer;
        Counter: Integer;
        RecPerPageNum: Integer;
        FormatAddr: Codeunit "Format Address";
        QtyLabels: Integer;


    procedure InitializeRequest(SetLabelFormat: Option)
    begin
        LabelFormat := SetLabelFormat;
    end;
}

