#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 51113 "DynCustomerItemSales"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CustomerItem Sales.rdlc';
    Caption = 'Customer/Item Sales';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
            column(ReportForNavId_6836; 6836)
            {
            }
            column(STRSUBSTNO_Text000_PeriodText_; StrSubstNo(Text000, PeriodText))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(PrintOnlyOnePerPage; PrintOnlyOnePerPage)
            {
            }
            column(Customer_TABLECAPTION__________CustFilter; TableCaption + ': ' + CustFilter)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(Value_Entry__TABLECAPTION__________ItemLedgEntryFilter; "Item Ledger Entry".TableCaption + ': ' + ItemLedgEntryFilter)
            {
            }
            column(ItemLedgEntryFilter; ItemLedgEntryFilter)
            {
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Customer__Phone_No__; "Phone No.")
            {
            }
            column(ValueEntryBuffer__Sales_Amount__Actual__; ValueEntryBuffer."Sales Amount (Actual)")
            {
            }
            column(ValueEntryBuffer__Discount_Amount_; -ValueEntryBuffer."Discount Amount")
            {
            }
            column(Profit; Profit)
            {
                AutoFormatType = 1;
            }
            column(ProfitPct; ProfitPct)
            {
                DecimalPlaces = 1 : 1;
            }
            column(PrintToExcel; PrintToExcel)
            {
            }
            column(Customer_Item_SalesCaption; Customer_Item_SalesCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(ValueEntryBuffer__Item_No__Caption; ValueEntryBuffer__Item_No__CaptionLbl)
            {
            }
            column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
            {
            }
            column(ValueEntryBuffer__Invoiced_Quantity_Caption; ValueEntryBuffer__Invoiced_Quantity_CaptionLbl)
            {
            }
            column(Item__Base_Unit_of_Measure_Caption; Item__Base_Unit_of_Measure_CaptionLbl)
            {
            }
            column(ValueEntryBuffer__Sales_Amount__Actual___Control44Caption; ValueEntryBuffer__Sales_Amount__Actual___Control44CaptionLbl)
            {
            }
            column(ValueEntryBuffer__Discount_Amount__Control45Caption; ValueEntryBuffer__Discount_Amount__Control45CaptionLbl)
            {
            }
            column(Profit_Control46Caption; Profit_Control46CaptionLbl)
            {
            }
            column(ProfitPct_Control47Caption; ProfitPct_Control47CaptionLbl)
            {
            }
            column(Customer__Phone_No__Caption; FieldCaption("Phone No."))
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(PriceCaption; PriceCaptionLbl)
            {
            }
            column(ExtItemCaption; ExtItemCaptionLbl)
            {
            }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Source No." = field("No."), "Posting Date" = field("Date Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"), "Global Dimension 2 Code" = field("Global Dimension 2 Filter");
                DataItemTableView = sorting("Source Type", "Source No.", "Item No.", "Variant Code", "Posting Date") where("Source Type" = const(Customer));
                RequestFilterFields = "Item No.", "Posting Date";
                column(ReportForNavId_7209; 7209)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ValueEntryBuffer.SetRange("Item No.", "Item No.");

                    if not ValueEntryBuffer.Find('-') then begin
                        ValueEntryBuffer.Init;
                        ValueEntryBuffer."Entry No." := NextEntryNo;
                        ValueEntryBuffer."Item No." := "Item No.";
                        ValueEntryBuffer.Insert;

                        NextEntryNo := NextEntryNo + 1;
                    end;
                    CalcFields("Sales Amount (Actual)", "Cost Amount (Actual)", "Cost Amount (Non-Invtbl.)");
                    ValueEntryBuffer."Invoiced Quantity" := ValueEntryBuffer."Invoiced Quantity" + "Invoiced Quantity";
                    ValueEntryBuffer."Sales Amount (Actual)" := ValueEntryBuffer."Sales Amount (Actual)" + "Sales Amount (Actual)";
                    ValueEntryBuffer."Cost Amount (Actual)" := ValueEntryBuffer."Cost Amount (Actual)" + "Cost Amount (Actual)";

                    ValueEntry.SetCurrentkey("Item Ledger Entry No.");
                    ValueEntry.SetRange("Item Ledger Entry No.", "Entry No.");
                    if ValueEntry.FindSet then
                        repeat
                            ValueEntryBuffer."Discount Amount" := ValueEntryBuffer."Discount Amount" + ValueEntry."Discount Amount";
                        until ValueEntry.Next = 0;

                    ValueEntryBuffer."Cost Amount (Non-Invtbl.)" := ValueEntryBuffer."Cost Amount (Non-Invtbl.)" + "Cost Amount (Non-Invtbl.)";
                    ValueEntryBuffer.Modify;
                end;

                trigger OnPreDataItem()
                begin
                    ValueEntryBuffer.Reset;
                    ValueEntryBuffer.DeleteAll;

                    NextEntryNo := 1;
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_5444; 5444)
                {
                }
                column(ValueEntryBuffer__Item_No__; ValueEntryBuffer."Item No.")
                {
                }
                column(Item_Description; Item.Description)
                {
                }
                column(ValueEntryBuffer__Invoiced_Quantity_; -ValueEntryBuffer."Invoiced Quantity")
                {
                    DecimalPlaces = 0 : 5;
                }
                column(ValueEntryBuffer__Sales_Amount__Actual___Control44; ValueEntryBuffer."Sales Amount (Actual)")
                {
                    AutoFormatType = 1;
                }
                column(ValueEntryBuffer__Discount_Amount__Control45; -ValueEntryBuffer."Discount Amount")
                {
                    AutoFormatType = 1;
                }
                column(Profit_Control46; Profit)
                {
                    AutoFormatType = 1;
                }
                column(ProfitPct_Control47; ProfitPct)
                {
                    DecimalPlaces = 1 : 1;
                }
                column(Item__Base_Unit_of_Measure_; Item."Base Unit of Measure")
                {
                }
                column(CustPrice; iPrice)
                {
                }
                column(ExtItem; extItem)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Number = 1 then
                        ValueEntryBuffer.Find('-')
                    else
                        ValueEntryBuffer.Next;

                    Profit :=
                      ValueEntryBuffer."Sales Amount (Actual)" +
                      ValueEntryBuffer."Cost Amount (Actual)" +
                      ValueEntryBuffer."Cost Amount (Non-Invtbl.)";

                    if PrintToExcel and Item.Get(ValueEntryBuffer."Item No.") then begin
                        CalcProfitPct;
                        MakeExcelDataBody;
                    end;

                    //Dynalogic, srn 07042015 Begin
                    iPrice := 0;
                    FromSalesPrice.SetRange("Item No.", ValueEntryBuffer."Item No.");
                    FromSalesPrice.SetRange("Sales Type", FromSalesPrice."sales type"::Customer);
                    FromSalesPrice.SetRange("Sales Code", Customer."No.");
                    FromSalesPrice.SetFilter("Variant Code", '%1|%2', '', '');
                    FromSalesPrice.SetFilter("Ending Date", '%1|>=%2', 0D, Today());
                    //FromSalesPrice.SETFILTER("Currency Code",'%1|%2',Currency.Code,'');
                    if FromSalesPrice.FindSet then
                        repeat
                            if FromSalesPrice."Unit Price" <> 0 then begin
                                iPrice := FromSalesPrice."Unit Price";
                                iPrice := iCurrency.ExchangeAmount(iPrice, FromSalesPrice."Currency Code", '', Today());
                            end;
                        until FromSalesPrice.Next = 0;
                    extItem := '';
                    extDescription := '';
                    if Customer."No." <> '' then begin
                        iItemRef.SetRange("Item No.", ValueEntryBuffer."Item No.");
                        iItemRef.SetRange("Reference Type", iItemRef."Reference Type"::Customer);
                        iItemRef.SetRange("Reference Type No.", Customer."No.");
                        if iItemRef.FindFirst then begin
                            extItem := iItemRef."Reference No.";
                            extDescription := iItemRef.Description;
                        end;
                    end;
                    //Dynalogic, srn 07042015 Begin
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(
                      ValueEntryBuffer."Sales Amount (Actual)",
                      ValueEntryBuffer."Discount Amount",
                      Profit);

                    ValueEntryBuffer.Reset;
                    SetRange(Number, 1, ValueEntryBuffer.Count);
                end;
            }

            trigger OnPreDataItem()
            begin
                CurrReport.NewPagePerRecord := PrintOnlyOnePerPage;

                CurrReport.CreateTotals(
                  ValueEntryBuffer."Sales Amount (Actual)",
                  ValueEntryBuffer."Discount Amount",
                  Profit);
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
                    field(PrintOnlyOnePerPage; PrintOnlyOnePerPage)
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Page per Customer';
                    }
                    field(PrintToExcel; PrintToExcel)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Print to Excel';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            PrintToExcel := false;
        end;
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        if PrintToExcel then
            CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        CustFilter := Customer.GetFilters;
        ItemLedgEntryFilter := "Item Ledger Entry".GetFilters;
        PeriodText := "Item Ledger Entry".GetFilter("Posting Date");

        if PrintToExcel then
            MakeExcelInfo;
    end;

    var
        Text000: label 'Period: %1';
        Item: Record Item;
        ValueEntry: Record "Value Entry";
        ValueEntryBuffer: Record "Value Entry" temporary;
        ExcelBuf: Record "Excel Buffer" temporary;
        CustFilter: Text;
        ItemLedgEntryFilter: Text;
        PeriodText: Text[30];
        NextEntryNo: Integer;
        PrintOnlyOnePerPage: Boolean;
        Profit: Decimal;
        ProfitPct: Decimal;
        Text001: label 'Data';
        Text002: label 'Customer/Item Sales';
        Text003: label 'Company Name';
        Text004: label 'Report No.';
        Text005: label 'Report Name';
        Text006: label 'User ID';
        Text007: label 'Date';
        Text008: label 'Customer Filters';
        Text009: label 'Value Entry Filters';
        PrintToExcel: Boolean;
        Text010: label 'Profit';
        Text011: label 'Profit %';
        Customer_Item_SalesCaptionLbl: label 'Customer/Item Sales';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        All_amounts_are_in_LCYCaptionLbl: label 'All amounts are in LCY';
        ValueEntryBuffer__Item_No__CaptionLbl: label 'Item No.';
        Item_DescriptionCaptionLbl: label 'Description';
        ValueEntryBuffer__Invoiced_Quantity_CaptionLbl: label 'Invoiced Quantity';
        Item__Base_Unit_of_Measure_CaptionLbl: label 'Unit of Measure';
        ValueEntryBuffer__Sales_Amount__Actual___Control44CaptionLbl: label 'Amount';
        ValueEntryBuffer__Discount_Amount__Control45CaptionLbl: label 'Discount Amount';
        Profit_Control46CaptionLbl: label 'Profit';
        ProfitPct_Control47CaptionLbl: label 'Profit %';
        TotalCaptionLbl: label 'Total';
        "***dynalogic": Integer;
        iItemRef: Record "Item Reference";
        extItem: Code[20];
        extDescription: Text[50];
        FromSalesPrice: Record "Sales Price";
        iPrice: Decimal;
        PriceCaptionLbl: label 'Salesprice/pcs';
        iCurrency: Record "Currency Exchange Rate";
        ExtItemCaptionLbl: label 'Ext.itemno.';

    local procedure CalcProfitPct()
    begin
        with ValueEntryBuffer do begin
            if "Sales Amount (Actual)" <> 0 then
                ProfitPct := ROUND(100 * Profit / "Sales Amount (Actual)", 0.1)
            else
                ProfitPct := 0;
        end;
    end;


    procedure MakeExcelInfo()
    begin
        ExcelBuf.SetUseInfoSheet;
        //ExcelBuf.AddInfoColumn(Format(Text004), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(Format(Text003), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(COMPANYNAME, false, false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text005), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(Format(Text002), false, false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text004), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(Report::"Customer/Item Sales", false, false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text006), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(UserId, false, false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text007), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(Today, false, false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text008), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(Customer.GetFilters, false, false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text009), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn("Item Ledger Entry".GetFilters, false, false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer.FieldCaption("No."), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Customer.FieldCaption(Name), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(ValueEntryBuffer.FieldCaption("Item No."), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Item.FieldCaption(Description), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(ValueEntryBuffer.FieldCaption("Invoiced Quantity"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Item.FieldCaption("Base Unit of Measure"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(
          ValueEntryBuffer.FieldCaption("Sales Amount (Actual)"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(ValueEntryBuffer.FieldCaption("Discount Amount"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Format(Text010), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Format(Text011), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
    end;


    procedure MakeExcelDataBody()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Customer.Name, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(ValueEntryBuffer."Item No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Item.Description, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(-ValueEntryBuffer."Invoiced Quantity", false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(Item."Base Unit of Measure", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(ValueEntryBuffer."Sales Amount (Actual)", false, '', false, false, false, '#,##0.00', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(-ValueEntryBuffer."Discount Amount", false, '', false, false, false, '#,##0.00', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(Profit, false, '', false, false, false, '#,##0.00', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(ProfitPct, false, '', false, false, false, '#,##0.00', ExcelBuf."cell type"::Number);
    end;


    // procedure CreateExcelbook()
    // begin
    //     ExcelBuf.CreateBookAndOpenExcel(Text001,Text002,COMPANYNAME,UserId);
    //     Error('');
    // end;

    procedure CreateExcelbook()
    begin
        ExcelBuf.CreateNewBook('Customer/Item Sales');
        ExcelBuf.WriteSheet('Customer/Item Sales', CompanyName(), UserId());
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename(StrSubstNo('CustomerItemSales'));
        ExcelBuf.OpenExcel();

    end;


    procedure InitializeRequest(NewPagePerCustomer: Boolean; PrintToExcelFile: Boolean)
    begin
        PrintOnlyOnePerPage := NewPagePerCustomer;
        PrintToExcel := PrintToExcelFile;
    end;
}

