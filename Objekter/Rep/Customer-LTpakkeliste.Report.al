//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50108 "Customer - LT pakkeliste"
{
    // 170314 VD/age: Lykketronic packing list
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Customer - LT pakkeliste.rdl';
    Caption = 'Customer - Packing List';
    AdditionalSearchTerms = 'Lykketronic - Pakkeliste , med mulighed for ekport til excell';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", Priority;
            column(ReportForNavId_6836; 6836)
            {
            }
            column(ShipmentPeriodDate; StrSubstNo(Text000, PeriodText))
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(PrintAmountsInLCY; PrintAmountsInLCY)
            {
            }
            column(CustTableCapCustFilter; TableCaption + ': ' + CustFilter)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(SalesOrderLineFilter; StrSubstNo(Text001, SalesLineFilter))
            {
            }
            column(SalesLineFilter; SalesLineFilter)
            {
            }
            column(No_Customer; "No.")
            {
                IncludeCaption = true;
            }
            column(Name_Customer; Name)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(CustOrderDetailCaption; CustOrderDetailCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(AllAmtAreInLCYCaption; AllAmtAreInLCYCaptionLbl)
            {
            }
            column(ShipmentDateCaption; ShipmentDateCaptionLbl)
            {
            }
            column(QtyOnBackOrderCaption; QtyOnBackOrderCaptionLbl)
            {
            }
            column(OutstandingOrdersCaption; OutstandingOrdersCaptionLbl)
            {
            }
            column(repHeader; 'Lykketronic pakkeliste')
            {
            }
            column(dateLbl; dateLbl)
            {
            }
            column(shelfLbl; shelfLbl)
            {
            }
            column(inventoryLbl; inventoryLbl)
            {
            }
            column(weightLbl; weightLbl)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Bill-to Customer No." = field("No."), "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"), "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter");
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.") where("Document Type" = const(Order), "Outstanding Quantity" = filter(<> 0));
                RequestFilterFields = "Shipment Date";
                RequestFilterHeading = 'Sales Order Line';
                column(ReportForNavId_2844; 2844)
                {
                }
                column(SalesHeaderNo; SalesHeader."No.")
                {
                }
                column(SalesHeaderOrderDate; SalesHeader."Order Date")
                {
                }
                column(Description_SalesLine; Description)
                {
                    IncludeCaption = true;
                }
                column(No_SalesLine; "No.")
                {
                    IncludeCaption = true;
                }
                column(Type_SalesLine; Type)
                {
                    IncludeCaption = true;
                }
                column(ShipmentDate_SalesLine; Format("Shipment Date"))
                {
                }
                column(Quantity_SalesLine; Quantity)
                {
                    IncludeCaption = true;
                }
                column(OutStandingQty_SalesLine; "Outstanding Quantity")
                {
                    IncludeCaption = true;
                }
                column(BackOrderQty; BackOrderQty)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(UnitPrice_SalesLine; "Unit Price")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 2;
                    IncludeCaption = true;
                }
                column(LineDiscAmt_SalesLine; "Line Discount Amount")
                {
                    IncludeCaption = true;
                }
                column(InvDiscAmt_SalesLine; "Inv. Discount Amount")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 2;
                    IncludeCaption = true;
                }
                column(SalesOrderAmount; SalesOrderAmount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(SalesHeaderCurrCode; SalesHeader."Currency Code")
                {
                }
                column(NaviNo; '(' + item.NaviNo + ')')
                {
                }
                column(shelfNo; item."Shelf No." + ' ' + item.AltShelfNo)
                {
                }
                column(inventory; Format(item.Inventory))
                {
                }
                column(netWeight; Format(item."Net Weight"))
                {
                }
                column(Weight; "Sales Line"."Outstanding Quantity" * item."Net Weight")
                {
                }
                column(serialNoText; serialNoText)
                {
                }

                trigger OnAfterGetRecord()
                var
                    resEntry: Record "Reservation Entry";
                    lastSno: Text[20];
                begin
                    NewOrder := "Document No." <> SalesHeader."No.";
                    if NewOrder then
                        SalesHeader.Get(1, "Document No.");
                    if "Shipment Date" <= WorkDate then
                        BackOrderQty := "Outstanding Quantity"
                    else
                        BackOrderQty := 0;
                    Currency.InitRoundingPrecision;
                    if "VAT Calculation Type" in ["vat calculation type"::"Normal VAT", "vat calculation type"::"Reverse Charge VAT"] then
                        SalesOrderAmount :=
                          ROUND(
                            (Amount + "VAT Base Amount" * "VAT %" / 100) * "Outstanding Quantity" / Quantity / (1 + "VAT %" / 100),
                            Currency."Amount Rounding Precision")
                    else
                        SalesOrderAmount :=
                          ROUND(
                            "Outstanding Amount" / (1 + "VAT %" / 100),
                            Currency."Amount Rounding Precision");
                    SalesOrderAmountLCY := SalesOrderAmount;
                    if SalesHeader."Currency Code" <> '' then begin
                        if SalesHeader."Currency Factor" <> 0 then
                            SalesOrderAmountLCY :=
                              ROUND(
                                CurrExchRate.ExchangeAmtFCYToLCY(
                                  WorkDate, SalesHeader."Currency Code",
                                  SalesOrderAmountLCY, SalesHeader."Currency Factor"));
                        if PrintAmountsInLCY then begin
                            "Unit Price" :=
                              ROUND(
                                CurrExchRate.ExchangeAmtFCYToLCY(
                                  WorkDate, SalesHeader."Currency Code",
                                  "Unit Price", SalesHeader."Currency Factor"));
                            SalesOrderAmount := SalesOrderAmountLCY;
                        end;
                    end;
                    if SalesHeader."Prices Including VAT" then begin
                        "Unit Price" := "Unit Price" / (1 + "VAT %" / 100);
                        "Inv. Discount Amount" := "Inv. Discount Amount" / (1 + "VAT %" / 100);
                    end;
                    "Inv. Discount Amount" := "Inv. Discount Amount" * "Outstanding Quantity" / Quantity;
                    CurrencyCode2 := SalesHeader."Currency Code";
                    if PrintAmountsInLCY then
                        CurrencyCode2 := '';
                    CurrencyTotalBuffer.UpdateTotal(
                      CurrencyCode2,
                      SalesOrderAmount,
                      Counter1,
                      Counter1);

                    // 170314:
                    serialNoText := '';
                    snoText := '';
                    if "Sales Line".Type = "Sales Line".Type::Item then begin
                        item.Get("Sales Line"."No.");
                        item.CalcFields(Inventory);
                        totalWeight += "Sales Line"."Outstanding Quantity" * item."Net Weight";

                        if ("Outstanding Quantity" <> 0) and (item."Item Tracking Code" <> '') then begin
                            resEntry.SetCurrentkey("Serial No.");
                            resEntry.SetRange("Source Type", 37);
                            resEntry.SetRange("Source Subtype", 1);
                            resEntry.SetRange("Source ID", "Sales Line"."Document No.");
                            resEntry.SetRange("Source Ref. No.", "Line No.");
                            if resEntry.FindFirst then
                                repeat
                                    if serialNoText = '' then
                                        serialNoText := resEntry."Serial No."
                                    else
                                        if resEntry."Serial No." = IncStr(lastSno) then
                                            snoText := resEntry."Serial No."
                                        else
                                            if StrPos(serialNoText, lastSno) > 0 then
                                                serialNoText := serialNoText + ', ' + resEntry."Serial No."
                                            else
                                                serialNoText := serialNoText + '-' + lastSno + ', ' + resEntry."Serial No.";

                                    lastSno := resEntry."Serial No.";
                                until resEntry.Next = 0;

                            if (snoText > '') and (StrPos(serialNoText, snoText) = 0) then
                                serialNoText := serialNoText + '-' + snoText;
                        end;
                        if serialNoText > '' then
                            serialNoText := '   Serienumre: ' + serialNoText;
                    end;
                    // :170314

                    if PrintToExcel then
                        MakeExcelDataBody;
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(SalesOrderAmountLCY, SalesOrderAmount);
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                column(ReportForNavId_5444; 5444)
                {
                }
                column(TotalAmt_CurrTotalBuff; CurrencyTotalBuffer."Total Amount")
                {
                    AutoFormatExpression = CurrencyTotalBuffer."Currency Code";
                    AutoFormatType = 1;
                }
                column(CurrCode_CurrTotalBuff; CurrencyTotalBuffer."Currency Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Number = 1 then
                        OK := CurrencyTotalBuffer.Find('-')
                    else
                        OK := CurrencyTotalBuffer.Next <> 0;
                    if not OK then
                        CurrReport.Break;

                    CurrencyTotalBuffer2.UpdateTotal(
                      CurrencyTotalBuffer."Currency Code",
                      CurrencyTotalBuffer."Total Amount",
                      Counter1,
                      Counter1);
                end;

                trigger OnPostDataItem()
                begin
                    CurrencyTotalBuffer.DeleteAll;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if PrintOnlyOnePerPage then
                    PageGroupNo := PageGroupNo + 1;
            end;

            trigger OnPreDataItem()
            begin
                PageGroupNo := 1;
                CurrReport.NewPagePerRecord := PrintOnlyOnePerPage;
                CurrReport.CreateTotals(SalesOrderAmountLCY);
            end;
        }
        dataitem(Integer2; "Integer")
        {
            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
            column(ReportForNavId_4152; 4152)
            {
            }
            column(TotalAmt_CurrTotalBuff2; CurrencyTotalBuffer2."Total Amount")
            {
                AutoFormatExpression = CurrencyTotalBuffer2."Currency Code";
                AutoFormatType = 1;
            }
            column(CurrCode_CurrTotalBuff2; CurrencyTotalBuffer2."Currency Code")
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(totalWeight; Format(totalWeight))
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Number = 1 then
                    OK := CurrencyTotalBuffer2.Find('-')
                else
                    OK := CurrencyTotalBuffer2.Next <> 0;
                if not OK then
                    CurrReport.Break;
            end;

            trigger OnPostDataItem()
            begin
                CurrencyTotalBuffer2.DeleteAll;
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
                    field(ShowAmountsInLCY; PrintAmountsInLCY)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Show Amounts in LCY';
                    }
                    field(NewPagePerCustomer; PrintOnlyOnePerPage)
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
            //PrintToExcel := false;
        end;
    }

    labels
    {
        OrderNoCaption = 'Order No.';
    }

    trigger OnPostReport()
    begin
        if PrintToExcel then begin
            CreateExcelbook;

        end;
    end;

    trigger OnPreReport()
    begin
        CustFilter := Customer.GetFilters;
        SalesLineFilter := "Sales Line".GetFilters;
        PeriodText := "Sales Line".GetFilter("Shipment Date");

        if PrintToExcel then begin

            MakeExcelInfo;
        end;
    end;

    var
        Text000: label 'Shipment Date: %1';
        Text001: label 'Sales Order Line: %1';
        CurrExchRate: Record "Currency Exchange Rate";
        CurrencyTotalBuffer: Record "Currency Total Buffer" temporary;
        CurrencyTotalBuffer2: Record "Currency Total Buffer" temporary;
        SalesHeader: Record "Sales Header";
        ExcelBuf: Record "Excel Buffer" temporary;
        Currency: Record Currency;
        item: Record Item;
        CustFilter: Text;
        SalesLineFilter: Text;
        SalesOrderAmount: Decimal;
        SalesOrderAmountLCY: Decimal;
        PrintAmountsInLCY: Boolean;
        PeriodText: Text[30];
        PrintOnlyOnePerPage: Boolean;
        BackOrderQty: Decimal;
        NewOrder: Boolean;
        OK: Boolean;
        Counter1: Integer;
        CurrencyCode2: Code[10];
        PrintToExcel: Boolean;

        Text002: label 'Data';
        Text003: label 'Customer - Order Detail';
        Text004: label 'Company Name';
        Text005: label 'Report No.';
        Text006: label 'Report Name';
        Text007: label 'User ID';
        Text008: label 'Date';
        Text009: label 'Customer Filters';
        Text010: label 'Sales Order Lines Filters';
        Text011: label 'Quantity on Back Order';
        Text012: label 'Outstanding Orders';
        Text013: label 'All amounts are in LCY';
        Text014: label ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
        Text015: label 'Item';
        Text016: label 'Order';
        PageGroupNo: Integer;
        CustOrderDetailCaptionLbl: label 'Customer - Packing List';
        PageCaptionLbl: label 'Page';
        AllAmtAreInLCYCaptionLbl: label 'All amounts are in LCY';
        ShipmentDateCaptionLbl: label 'Shipment Date';
        QtyOnBackOrderCaptionLbl: label 'Quantity on Back Order';
        OutstandingOrdersCaptionLbl: label 'Outstanding Orders';
        TotalCaptionLbl: label 'Total';
        totalWeight: Decimal;
        XXXserialNos: Text[80];
        dateLbl: label 'Ship date';
        weightLbl: label 'Weight';
        inventoryLbl: label 'On hand';
        shelfLbl: label 'Shelf No.';
        serialNoText: Text;
        snoText: Text[20];
        lastSno: Text[20];


    procedure MakeExcelInfo()
    begin
        ExcelBuf.SetUseInfoSheet;

        ExcelBuf.AddInfoColumn(Format(Text004), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(COMPANYNAME, false, false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text006), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(Format(Text003), false, false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text005), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(Report::"Customer - Order Detail", false, false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text007), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(UserId, false, false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text008), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(Today, false, false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text009), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn(Customer.GetFilters, false, false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(Format(Text010), false, true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddInfoColumn("Sales Line".GetFilters, false, false, false, false, '', ExcelBuf."cell type"::Text);
        if PrintAmountsInLCY then begin
            ExcelBuf.NewRow;
            ExcelBuf.AddInfoColumn(Format(Text013), false, true, false, false, '', ExcelBuf."cell type"::Text);
            ExcelBuf.AddInfoColumn(PrintAmountsInLCY, false, false, false, false, '', ExcelBuf."cell type"::Text);
        end;
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer.FieldCaption("No."), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Customer.FieldCaption(Name), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(
          Format(Text016 + '  ' + SalesHeader.FieldCaption("No.")), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(SalesHeader.FieldCaption("Order Date"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption("Shipment Date"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption(Type), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(
          Format(Text015 + ' ' + "Sales Line".FieldCaption("No.")), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption(Description), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption(Quantity), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption("Outstanding Quantity"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Format(Text011), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption("Unit Price"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption("Line Discount Amount"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption("Inv. Discount Amount"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Format(Text012), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        if not PrintAmountsInLCY then
            ExcelBuf.AddColumn(SalesHeader.FieldCaption("Currency Code"), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
    end;


    procedure MakeExcelDataBody()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Customer.Name, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(SalesHeader."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(SalesHeader."Order Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("Sales Line"."Shipment Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn(Format(SelectStr("Sales Line".Type + 1, Text014)), false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line"."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".Description, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".Quantity, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Sales Line"."Outstanding Quantity", false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(BackOrderQty, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Sales Line"."Unit Price", false, '', false, false, false, '#,##0.00', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Sales Line"."Line Discount Amount", false, '', false, false, false, '#,##0.00', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Sales Line"."Inv. Discount Amount", false, '', false, false, false, '#,##0.00', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(SalesOrderAmount, false, '', false, false, false, '#,##0.00', ExcelBuf."cell type"::Number);
        if not PrintAmountsInLCY then
            ExcelBuf.AddColumn(SalesHeader."Currency Code", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
    end;


    procedure CreateExcelbook()
    begin
        ExcelBuf.CreateNewBook('Packing list');
        ExcelBuf.WriteSheet('Packing list', CompanyName(), UserId());
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename(StrSubstNo('%1-%2', Customer.Name, "Sales Line".GetFilter("Shipment Date")));
        ExcelBuf.OpenExcel();

    end;


    procedure InitializeRequest(ShowAmountInLCY: Boolean; NewPagePerCustomer: Boolean; SetPrintToExcel: Boolean)
    begin
        PrintAmountsInLCY := ShowAmountInLCY;
        PrintOnlyOnePerPage := NewPagePerCustomer;
        PrintToExcel := SetPrintToExcel;
    end;

    // local procedure CreateAndFillExcelBuffer(var TempExcelBuf: Record "Excel Buffer" temporary)
    // begin
    //     TempExcelBuf.CreateNewBook(SheetNameTxt);
    //     FillExcelBuffer(TempExcelBuf);
    //     TempExcelBuf.WriteSheet(HeaderTxt, CompanyName(), UserId());
    //     TempExcelBuf.CloseBook();
    // end;



}

