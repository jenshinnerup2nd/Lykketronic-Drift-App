//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50011 DynChartDataDelivery
{

    fields
    {
        field(1; PeriodKey; Text[20])
        {
        }
        field(11; PeriodCaption; Text[20])
        {
        }
        field(50; TotalQty; Integer)
        {
        }
        field(51; Interval1Qty; Integer)
        {
        }
        field(52; Interval2Qty; Integer)
        {
        }
        field(53; Interval3Qty; Integer)
        {
        }
    }

    keys
    {
        key(Key1; PeriodKey)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

