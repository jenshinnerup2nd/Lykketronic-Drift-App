//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50030 DynChartDeliverySales
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/DynChartDeliverySales.rdl';
    Caption = 'Delivery - Chart';

    dataset
    {
        dataitem("Sales Shipment Line"; "Sales Shipment Line")
        {
            RequestFilterFields = "Promised Delivery Date";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            var
                Date1: Date;
                Date2: Date;
                TempPeriod: Text[20];
                Found: Boolean;
            begin
                if "Sales Shipment Line".Quantity = 0 then begin
                    CurrReport.Skip;
                end;

                Date1 := "Sales Shipment Line"."Promised Delivery Date";
                Date2 := "Sales Shipment Line"."Posting Date";

                if (Date1 = 0D) or (Date2 = 0D) then begin
                    CurrReport.Skip;
                end;

                TempPeriod := Format(Date1, 0, '<Year>-<Month,2>');

                if DynChartDataDelivery.Get(TempPeriod) then begin
                    Found := true;
                end else begin
                    DynChartDataDelivery.PeriodKey := TempPeriod;
                    DynChartDataDelivery.PeriodCaption := CopyStr(Format(Date1, 0, '<Month Text>'), 1, 3) + ' ' + Format(Date1, 0, '<Year,2>');
                    DynChartDataDelivery.TotalQty := 0;
                    DynChartDataDelivery.Interval1Qty := 0;
                    DynChartDataDelivery.Interval2Qty := 0;
                    DynChartDataDelivery.Interval3Qty := 0;
                end;

                if (Date2 - Date1) > 0 then begin
                    if (Date2 - Date1) <= 2 then begin
                        DynChartDataDelivery.Interval1Qty += 1;
                    end else
                        if (Date2 - Date1) <= 5 then begin
                            DynChartDataDelivery.Interval2Qty += 1;
                        end else begin
                            DynChartDataDelivery.Interval3Qty += 1;
                        end;
                end;

                DynChartDataDelivery.TotalQty += 1;

                if Found then begin
                    DynChartDataDelivery.Modify(false);
                end else begin
                    DynChartDataDelivery.Insert(false);
                end;

                CurrReport.Skip;
            end;
        }
        dataitem(IntegerChartData; "Integer")
        {
            column(ReportForNavId_1000000011; 1000000011)
            {
            }
            column(Chart1Caption; TextChart1Caption)
            {
            }
            column(PeriodKey; DynChartDataDelivery.PeriodKey)
            {
            }
            column(PeriodCaption; DynChartDataDelivery.PeriodCaption)
            {
            }
            column(TotalCaption; TextTotalLines)
            {
            }
            column(SumIntervalCaption; TextSumInterval)
            {
            }
            column(Interval1Caption; StrSubstNo(TextXdays, ParmInterval1))
            {
            }
            column(Interval2Caption; StrSubstNo(TextXdays, ParmInterval2))
            {
            }
            column(Interval3Caption; TextRest)
            {
            }
            column(SumIntervalLessEquel0Caption; StrSubstNo(TextXdays, 0))
            {
            }
            column(SumIntervalLessEquel1Caption; StrSubstNo(TextXYdays, 0, ParmInterval1))
            {
            }
            column(SumIntervalLessEquel2Caption; StrSubstNo(TextXYdays, 0, ParmInterval2))
            {
            }
            column(TotalQty; DynChartDataDelivery.TotalQty)
            {
            }
            column(SumIntervalQty; DynChartDataDelivery.Interval1Qty + DynChartDataDelivery.Interval2Qty + DynChartDataDelivery.Interval3Qty)
            {
            }
            column(Interval1Qty; DynChartDataDelivery.Interval1Qty)
            {
            }
            column(Interval2Qty; DynChartDataDelivery.Interval2Qty)
            {
            }
            column(Interval3Qty; DynChartDataDelivery.Interval3Qty)
            {
            }
            column(SumIntervalLessEquel0; TempSumIntervalLessEquel0)
            {
            }
            column(SumIntervalLessEquel1; TempSumIntervalLessEquel1)
            {
            }
            column(SumIntervalLessEquel2; TempSumIntervalLessEquel2)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if IntegerChartData.Number = 1 then begin
                    DynChartDataDelivery.FindSet();
                end else begin
                    DynChartDataDelivery.Next();
                end;

                // 1 = 100%

                TempSumIntervalLessEquel0 := 1;
                TempSumIntervalLessEquel1 := 1;
                TempSumIntervalLessEquel2 := 1;

                if DynChartDataDelivery.TotalQty > 0 then begin
                    TempSumIntervalLessEquel0 := (((DynChartDataDelivery.TotalQty - DynChartDataDelivery.Interval3Qty - DynChartDataDelivery.Interval2Qty - DynChartDataDelivery.Interval1Qty) / DynChartDataDelivery.TotalQty));
                    TempSumIntervalLessEquel1 := (((DynChartDataDelivery.TotalQty - DynChartDataDelivery.Interval3Qty - DynChartDataDelivery.Interval2Qty) / DynChartDataDelivery.TotalQty));
                    TempSumIntervalLessEquel2 := (((DynChartDataDelivery.TotalQty - DynChartDataDelivery.Interval3Qty) / DynChartDataDelivery.TotalQty));
                end;
            end;

            trigger OnPreDataItem()
            begin
                IntegerChartData.SetRange(Number, 1, DynChartDataDelivery.Count());
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
                field(ParmInterval1; ParmInterval1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Interval 1';
                }
                field(ParmInterval2; ParmInterval2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Interval 2';
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

    var
        DynChartDataDelivery: Record DynChartDataDelivery temporary;
        ParmInterval1: Integer;
        ParmInterval2: Integer;
        TextChart1Caption: label 'Delivery - Interval of Days';
        TextChart3Caption: label 'Delivery - Percent';
        TextXdays: label '%1 day(s)';
        TextXYdays: label '%1-%2 day(s)';
        TextRest: label 'Rest';
        TextTotalLines: label 'Total number of lines';
        TextSumInterval: label 'Total number of failures';
        [InDataSet]
        TempSumIntervalLessEquel0: Decimal;
        [InDataSet]
        TempSumIntervalLessEquel1: Decimal;
        [InDataSet]
        TempSumIntervalLessEquel2: Decimal;
}

