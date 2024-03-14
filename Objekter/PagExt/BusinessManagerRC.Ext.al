pageextension 50008 "BusinessManagerRCExt" extends "Business Manager Role Center"

{
    layout
    {
        addafter(Control55)
        {
            part(SalesPerformancePart; "Sales Performance")
            {
                ApplicationArea = All;
                Caption = 'Salgsydelse';
            }

        }
         addafter(PowerBIEmbeddedReportPart3)
         {
         part(PowerBIEmbeddedReportPart10; "Power BI Embedded Report Part")
         {
             ApplicationArea = All;
             Caption = 'Power BI';
         }
         part(PowerBIEmbeddedReportPart11; "Power BI Embedded Report Part")
         {
             ApplicationArea = All;
             Caption = 'Power BI';
         }
        // part(PowerBIEmbeddedReportPart12; "Power BI Embedded Report Part")
        // {
        //     ApplicationArea = All;
        //     Caption = 'Power BI';
        // }
        // part(PowerBIEmbeddedReportPart13; "Power BI Embedded Report Part")
        // {
        //     ApplicationArea = All;
        //     Caption = 'Power BI';
        // }
        // part(PowerBIEmbeddedReportPart14; "Power BI Embedded Report Part")
        // {
        //     ApplicationArea = All;
        //     Caption = 'Power BI';
        // }
        // part(PowerBIEmbeddedReportPart15; "Power BI Embedded Report Part")
        // {
        //     ApplicationArea = All;
        //     Caption = 'Power BI';
        // }
         }

    }

    actions
    {
        addafter("Excel Reports")
        {
            group("Lykketronic_Action1")
            {
                Caption = 'Lykketronic';
                action("Lykketronicpage2")
                {
                    ApplicationArea = All;
                    Caption = 'Faktura Søgning';
                    Image = Share;
                    RunPageMode = Edit;
                    RunObject = Page "Fakturasøgning";
                    ToolTip = '(Lykketronic) Denne side er for fakturasøgning ved hjælp af et specificeret serienummer.';
                }

            }
        }
        // addafter("Customer")
        // {
        //     group("Lykketronic_Action2")
        //     {
        //         Caption = 'Lykketronic';
        //         action("ZY Sales Quote 2")
        //         {
        //             AccessByPermission = TableData "Sales Header" = IMD;
        //             ApplicationArea = Basic, Suite;
        //             Caption = 'Sales Quote 2';
        //             Image = NewSalesQuote;
        //             RunObject = Page "Sales Quote";
        //             RunPageMode = Create;
        //             ToolTip = 'Offer items or services to a customer.';
        //         }
        //         action("ZY Sales Order 2")
        //         {
        //             AccessByPermission = TableData "Sales Header" = IMD;
        //             ApplicationArea = Basic, Suite;
        //             Caption = 'Sales Order 2';
        //             Image = NewOrder;
        //             RunObject = Page "Sales Order";
        //             RunPageMode = Create;
        //             ToolTip = 'Create a new sales order for items or services.';
        //         }
        //     }
        // }
        addafter("Chart of Accounts")
        {
            group("Lykketronic_Action3")
            {
                Caption = 'Lykketronic';
                action("Lykketronicreport1")
                {
                    // AccessByPermission = TableData "Sales Header" = IMD;
                    ApplicationArea = all;
                    Caption = 'PakkeListe';
                    Image = PrintDocument;
                    RunObject = report "Customer - LT pakkeliste";
                    // RunPageMode = Create;
                    ToolTip = '(Lykketronic) Udskriv pakkeliste for debitor, med afgrænsning på debitor og periode (afsendelsedato)';
                }
                action("Lykketronicreport2")
                {
                    // AccessByPermission = TableData "Sales Header" = IMD;
                    ApplicationArea = all;
                    Caption = 'Debitor Ordrebeholdning';
                    Image = PrintDocument;
                    RunObject = report "Customer OrderDetail Lykke";
                    // RunPageMode = Create;
                    ToolTip = '(Lykketronic) Udskrive Debitor ordrebeholdning, indholder lager beholdning og mulighederen for Export til Excel';
                }
                action("Lykketronicreport3")
                {
                    // AccessByPermission = TableData "Sales Header" = IMD;
                    ApplicationArea = all;
                    Caption = 'Prisliste';
                    Image = PrintDocument;
                    RunObject = report "DynPriceList";
                    // RunPageMode = Create;
                    ToolTip = '(Lykketronic) Udskrive Debitor Prisliste';
                }
                action("Lykketronicreport4")
                {
                    // AccessByPermission = TableData "Sales Header" = IMD;
                    ApplicationArea = all;
                    Caption = 'Leveringssikkerhed Grafer (Salg)';
                    Image = PrintDocument;
                    RunObject = report "DynChartDeliverySales";
                    // RunPageMode = Create;
                    ToolTip = '(Lykketronic) Udskrive Leveringssikkerhed (Salg)';
                }
                action("Lykketronicreport5")
                {
                    // AccessByPermission = TableData "Sales Header" = IMD;
                    ApplicationArea = all;
                    Caption = 'Leveringssikkerhed Grafer (Service)';
                    Image = PrintDocument;
                    RunObject = report "DynChartDeliverySalesservice";
                    // RunPageMode = Create;
                    ToolTip = '(Lykketronic) Udskrive Leveringssikkerhed (Service))';
                }
                action("LykketronicPage1")
                {
                    AccessByPermission = TableData "Sales Header" = IMD;
                    ApplicationArea = all;
                    Caption = 'Debitor Ordrebeholdning (oversigt ses på skærm (NY))';
                    Image = ShowMatrix;
                    RunObject = page DynSaleLine;
                    RunPageMode = View;
                    ToolTip = '(Lykketronic) Se Debitor ordrebeholdning, Viser Uge nr og Lagerbeholdning';
                }
                action("Lykketronicreport6")
                {
                    // AccessByPermission = TableData "Sales Header" = IMD;
                    ApplicationArea = all;
                    Caption = 'Kunde/Varestatistik';
                    Image = PrintDocument;
                    RunObject = report DynCustomerItemSales;
                    ToolTip = '(Lykketronic) Udskrive kunde/varestatistik';
                }
            }
        }
    }
}