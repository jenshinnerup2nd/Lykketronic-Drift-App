/**
 * This report generates a price list for Lykketronic products.
 * It includes information such as item details, sales prices, and sales line discounts.
 * The report is designed to be used with an RDLC layout file located at './Layouts/Price List.rdl'.
 * The report can be filtered based on various fields such as item number, search description, assembly BOM, and inventory posting group.
 * The report supports different sales price types, including customer price group and customer-specific prices.
 * It also includes company information such as address, phone number, fax number, VAT registration number, bank details, etc.
 * The report can handle item variants and provides separate sections for variant-specific sales prices and sales line discounts.
 * The report is categorized under 'Reports and Analysis' in the application.
 */
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 51715 "DynPriceList"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Price List.rdl';
    Caption = 'Lykketronic Price List';
    AdditionalSearchTerms = 'Lykketronic Prisliste';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Item; Item)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Description", "Assembly BOM", "Inventory Posting Group";
            column(ReportForNavId_8129; 8129)
            {
            }
            column(CompanyAddr1; CompanyAddr[1])
            {
            }
            column(CompanyAddr2; CompanyAddr[2])
            {
            }
            column(CompanyAddr3; CompanyAddr[3])
            {
            }
            column(CompanyAddr4; CompanyAddr[4])
            {
            }
            column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
            {
            }
            column(CompanyInfoBankName; CompanyInfo."Bank Name")
            {
            }
            column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
            {
            }
            column(ReqDateFormatted; StrSubstNo(Text003, Format(DateReq, 0, 4)))
            {
            }
            column(CompanyAddr5; CompanyAddr[5])
            {
            }
            column(CompanyAddr6; CompanyAddr[6])
            {
            }
            column(SalesPriceType; SalesPriceType)
            {
            }
            column(SalesCode; SalesCode)
            {
            }
            column(PageCaption; StrSubstNo(Text002, ''))
            {
            }
            column(SalesDesc; SalesDesc)
            {
            }
            column(UnitPriceFieldCaption; SalesPrice.FieldCaption("Unit Price") + CurrencyText)
            {
            }
            column(LineDiscountFieldCaption; SalesLineDisc.FieldCaption("Line Discount %") + CurrencyText)
            {
            }
            column(No_Item; "No.")
            {
            }
            column(No_NaviNo; DynNaviNo)
            {
            }
            column(PriceListCaption; PriceListCaptionLbl)
            {
            }
            column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
            {
            }
            column(CompanyInfoFaxNoCaption; CompanyInfoFaxNoCaptionLbl)
            {
            }
            column(CompanyInfoVATRegNoCaption; CompanyInfoVATRegNoCaptionLbl)
            {
            }
            column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
            {
            }
            column(CompanyInfoBankNameCaption; CompanyInfoBankNameCaptionLbl)
            {
            }
            column(CompanyInfoBankAccNoCaption; CompanyInfoBankAccNoCaptionLbl)
            {
            }
            column(ItemNoCaption; ItemNoCaptionLbl)
            {
            }
            column(DynNaviNoCaption; DynNaviNoCaptionLbl)
            {
            }
            column(DynExtCaption; DynExtCaptionLbl)
            {
            }
            column(ItemDescCaption; ItemDescCaptionLbl)
            {
            }
            column(UnitOfMeasureCaption; UnitOfMeasureCaptionLbl)
            {
            }
            column(MinimumQuantityCaption; MinimumQuantityCaptionLbl)
            {
            }
            column(VATTextCaption; VATTextCaptionLbl)
            {
            }
            dataitem(SalesPrices; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                column(ReportForNavId_6482; 6482)
                {
                }
                column(VATText_SalesPrices; VATText)
                {
                }
                column(SalesPriceUnitPrice; iPrice)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 2;
                }
                column(UOM_SalesPrices; UnitOfMeasure)
                {
                }
                column(ItemNo_SalesPrices; ItemNo)
                {
                }
                column(ItemDesc_SalesPrices; ItemDesc)
                {
                    Caption = 'Description';
                }
                column(MinimumQty_SalesPrices; MinQty)
                {
                }
                column(extItem_SalesPrices; extItem)
                {
                }
                column(extDesc_SalesPrices; extDescription)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PrintSalesPrice(false);
                    //Dynalogic, srn 07012015 Begin
                    //IF SalesPrice."Unit Price" = 0 THEN BEGIN
                    if iPrice = 0 then begin
                        CurrReport.Skip;
                    end;//Dynalogic, srn 07012015 End
                end;

                trigger OnPreDataItem()
                begin
                    PreparePrintSalesPrice(false);
                end;
            }
            dataitem(SalesLineDiscs; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                column(ReportForNavId_6957; 6957)
                {
                }
                column(LineDisc_SalesLineDisc; SalesLineDisc."Line Discount %")
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 2;
                }
                column(MinimumQty_SalesLineDiscs; SalesLineDisc."Minimum Quantity")
                {
                }
                column(UOM_SalesLineDiscs; UnitOfMeasure)
                {
                }
                column(ItemDesc_SalesLineDiscs; ItemDesc)
                {
                }
                column(ItemNo_SalesLineDiscs; ItemNo)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PrintSalesDisc;
                end;

                trigger OnPreDataItem()
                begin
                    PreparePrintSalesDisc(false);
                end;
            }
            dataitem("Item Variant"; "Item Variant")
            {
                DataItemLink = "Item No." = field("No.");
                column(ReportForNavId_7031; 7031)
                {
                }
                dataitem(VariantSalesPrices; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                    column(ReportForNavId_8437; 8437)
                    {
                    }
                    column(ItemNo_Variant_SalesPrices; ItemNo)
                    {
                    }
                    column(ItemDesc_Variant_SalesPrices; ItemDesc)
                    {
                    }
                    column(UOM_Variant_SalesPrices; UnitOfMeasure)
                    {
                    }
                    column(MinimumQty_Variant_SalesPrices; SalesPrice."Minimum Quantity")
                    {
                    }
                    column(UnitPrince_Variant_SalesPrices; SalesPrice."Unit Price")
                    {
                    }
                    column(VATText_Variant_SalesPrices; VATText)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        PrintSalesPrice(true);
                    end;

                    trigger OnPreDataItem()
                    begin
                        PreparePrintSalesPrice(true);
                    end;
                }
                dataitem(VariantSalesLineDiscs; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                    column(ReportForNavId_5444; 5444)
                    {
                    }
                    column(ItemNo_Variant_SalesLineDescs; ItemNo)
                    {
                    }
                    column(ItemDesc_Variant_SalesLineDescs; ItemDesc)
                    {
                    }
                    column(UOM_Variant_SalesLineDescs; UnitOfMeasure)
                    {
                    }
                    column(MinimumQty_Variant_SalesLineDescs; SalesLineDisc."Minimum Quantity")
                    {
                    }
                    column(LineDisc_Variant_SalesLineDescs; SalesLineDisc."Line Discount %")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        PrintSalesDisc;
                    end;

                    trigger OnPreDataItem()
                    begin
                        PreparePrintSalesDisc(true);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    ItemNo := Code;
                    ItemDesc := Description;

                    SalesPriceCalcMgt.FindSalesPrice(
                      SalesPrice, CustNo, ContNo, CustPriceGrCode, CampaignNo, Item."No.", Code, '', Currency.Code, DateReq, false);
                    SalesPriceCalcMgt.FindSalesLineDisc(
                      SalesLineDisc, CustNo, ContNo, CustDiscGrCode, CampaignNo, Item."No.",
                      Item."Item Disc. Group", Code, '', Currency.Code, DateReq, false);
                end;
            }

            trigger OnAfterGetRecord()
            var
                iCust: Record Customer;
            begin
                Clear(MinQty);
                ItemNo := "No.";
                ItemDesc := Description;
                //Dynalogic, srn 28102015 Begin
                DynNaviNo := '';
                DynNaviNo := Item.NaviNo;
                //Dynalogic, srn 28102015 End
                /*
                SalesPriceCalcMgt.FindSalesPrice(
                  SalesPrice,CustNo,ContNo,CustPriceGrCode,CampaignNo,"No.",'','',Currency.Code,DateReq,FALSE);
                */
                //Dynalogic, srn 07012015 Begin
                if (SalesPriceType = SalesPriceType::"Customer Price Group") or (SalesPriceType = SalesPriceType::Customer) then begin
                    iPrice := 0;
                    FromSalesPrice.Reset();
                    FromSalesPrice.SetFilter("Item No.", '=%1', ItemNo);
                    FromSalesPrice.SetFilter("Variant Code", '%1|%2', '', '');
                    FromSalesPrice.SetFilter("Ending Date", '%1|>=%2', 0D, DateReq);
                    FromSalesPrice.SetFilter("Currency Code", '%1|%2', Currency.Code, '');
                    if SalesPriceType = SalesPriceType::"Customer Price Group" then begin
                        if CustPriceGrCode <> '' then begin
                            FromSalesPrice.SetFilter("Sales Type", '=%1', SalesPriceType::"Customer Price Group");
                            FromSalesPrice.SetFilter("Sales Code", '=%1', CustPriceGrCode);
                        end;
                    end;
                    if SalesPriceType = SalesPriceType::Customer then begin
                        if CustNo <> '' then begin
                            FromSalesPrice.SetFilter("Sales Type", '=%1', SalesPriceType::Customer);
                            FromSalesPrice.SetFilter("Sales Code", '=%1', CustNo);
                        end;
                    end;
                    if FromSalesPrice.FindSet then
                        repeat
                            if FromSalesPrice."Unit Price" <> 0 then begin
                                iPrice := FromSalesPrice."Unit Price";
                                MinQty := FromSalesPrice."Minimum Quantity";
                            end;
                        until FromSalesPrice.Next = 0;
                    //hvis ingen deb pris så prøv på kundes prisgruppe
                    if (iPrice = 0) and (SalesPriceType = SalesPriceType::Customer) then begin
                        if iCust.Get(CustNo) then begin
                            if iCust."Customer Price Group" <> '' then begin
                                FromSalesPrice.Reset;
                                FromSalesPrice.SetFilter("Item No.", '=%1', ItemNo);
                                FromSalesPrice.SetFilter("Variant Code", '%1|%2', '', '');
                                FromSalesPrice.SetFilter("Ending Date", '%1|>=%2', 0D, DateReq);
                                FromSalesPrice.SetFilter("Currency Code", '%1|%2', Currency.Code, '');
                                FromSalesPrice.SetFilter("Sales Type", '=%1', SalesPriceType::"Customer Price Group");
                                FromSalesPrice.SetFilter("Sales Code", '=%1', iCust."Customer Price Group");
                                if FromSalesPrice.FindSet() then
                                    repeat
                                        if FromSalesPrice."Unit Price" <> 0 then begin
                                            iPrice := FromSalesPrice."Unit Price";
                                            MinQty := FromSalesPrice."Minimum Quantity";
                                        end;
                                    until FromSalesPrice.Next = 0;
                            end;
                        end;
                    end;
                    if iPrice = 0 then begin
                        CurrReport.Skip;
                    end;
                end else begin
                    SalesPriceCalcMgt.FindSalesPrice(
                      SalesPrice, CustNo, ContNo, CustPriceGrCode, CampaignNo, "No.", '', '', Currency.Code, DateReq, false);
                end;
                //Dynalogic, srn 07012015 End

                SalesPriceCalcMgt.FindSalesLineDisc(
                  SalesLineDisc, CustNo, ContNo, CustDiscGrCode, CampaignNo, "No.",
                  "Item Disc. Group", '', '', Currency.Code, DateReq, false);


                //Dynalogic, srn 07012015 Begin
                extItem := '';
                extDescription := '';
                if CustNo <> '' then begin
                    iItemRef.SetRange("Item No.", ItemNo);
                    iItemRef.SetRange("Reference Type", iItemRef."reference type"::Customer);
                    iItemRef.SetRange("Reference Type No.", CustNo);
                    if iItemRef.FindFirst then begin
                        extItem := iItemRef."Reference No.";
                        extDescription := iItemRef.Description;
                    end;
                end;
                //Dynalogic, srn 07012015 End

            end;

            trigger OnPreDataItem()
            begin
                CustNo := '';
                ContNo := '';
                CustPriceGrCode := '';
                CustDiscGrCode := '';
                SalesDesc := '';

                case SalesPriceType of
                    SalesPriceType::Customer:
                        begin
                            Cust.Get(SalesCode);
                            CustNo := Cust."No.";
                            CustPriceGrCode := Cust."Customer Price Group";
                            CustDiscGrCode := Cust."Customer Disc. Group";
                            SalesDesc := Cust.Name;
                        end;
                    SalesPriceType::"Customer Price Group":
                        begin
                            CustPriceGr.Get(SalesCode);
                            CustPriceGrCode := SalesCode;
                        end;
                    SalesPriceType::Campaign:
                        begin
                            Campaign.Get(SalesCode);
                            CampaignNo := SalesCode;
                            SalesDesc := Campaign.Description;
                        end;
                end;

                ContBusRel.SetRange("Link to Table", ContBusRel."link to table"::Customer);
                ContBusRel.SetRange("No.", CustNo);
                if ContBusRel.FindFirst then
                    ContNo := ContBusRel."Contact No.";
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
                    field(Date; DateReq)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Date';
                    }
                    field(SalesPriceType; SalesPriceType)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Sales Type';
                        //OptionCaption = 'Customer,Customer Price Group,All Customers,Campaign';

                        trigger OnValidate()
                        begin
                            SalesCodeCtrlEnable := SalesPriceType <> SalesPriceType::"All Customers";
                            SalesCode := '';
                        end;
                    }
                    field(SalesCodeCtrl; SalesCode)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Sales Code';
                        Enabled = SalesCodeCtrlEnable;

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            CustList: Page "Customer List";
                            CustPriceGrList: Page "Customer Price Groups";
                            CampaignList: Page "Campaign List";
                        begin
                            case SalesPriceType of
                                SalesPriceType::Customer:
                                    begin
                                        CustList.LookupMode := true;
                                        CustList.SetRecord(Cust);
                                        if CustList.RunModal = Action::LookupOK then begin
                                            CustList.GetRecord(Cust);
                                            SalesCode := Cust."No.";
                                        end;
                                    end;
                                SalesPriceType::"Customer Price Group":
                                    begin
                                        CustPriceGrList.LookupMode := true;
                                        CustPriceGrList.SetRecord(CustPriceGr);
                                        if CustPriceGrList.RunModal = Action::LookupOK then begin
                                            CustPriceGrList.GetRecord(CustPriceGr);
                                            SalesCode := CustPriceGr.Code;
                                        end;
                                    end;
                                SalesPriceType::Campaign:
                                    begin
                                        CampaignList.LookupMode := true;
                                        CampaignList.SetRecord(Campaign);
                                        if CampaignList.RunModal = Action::LookupOK then begin
                                            CampaignList.GetRecord(Campaign);
                                            SalesCode := Campaign."No.";
                                        end;
                                    end;
                            end;
                        end;

                        trigger OnValidate()
                        begin
                            ValidateSalesCode;
                        end;
                    }
                    field("Currency.Code"; Currency.Code)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Currency Code';
                        TableRelation = Currency;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            SalesCodeCtrlEnable := true;
        end;

        trigger OnOpenPage()
        begin
            if DateReq = 0D then
                DateReq := WorkDate;

            SalesCodeCtrlEnable := true;
            if SalesPriceType = SalesPriceType::"All Customers" then
                SalesCodeCtrlEnable := false;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        ValidateSalesCode;

        CompanyInfo.Get;
        FormatAddr.Company(CompanyAddr, CompanyInfo);

        if CustPriceGr.Code <> '' then
            CustPriceGr.Find;

        SetCurrency(Currency.Code, CurrencyFactor);
    end;

    var
        DynExtCaptionLbl: label 'Ext.itemref';
        DynNaviNoCaptionLbl: label 'NAV itemno';
        Text000: label 'Incl.';
        Text001: label 'Excl.';
        Text002: label 'Page %1';
        Text003: label 'As of %1';
        DynNaviNo: Code[20];
        CompanyInfo: Record "Company Information";
        CustPriceGr: Record "Customer Price Group";
        Cust: Record Customer;
        Campaign: Record Campaign;
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        SalesPrice: Record "Sales Price" temporary;
        SalesLineDisc: Record "Sales Line Discount" temporary;
        ContBusRel: Record "Contact Business Relation";
        GLSetup: Record "General Ledger Setup";
        FormatAddr: Codeunit "Format Address";
        SalesPriceCalcMgt: Codeunit "Sales Price Calc. Mgt.";
        VATText: Text[20];
        DateReq: Date;
        CompanyAddr: array[8] of Text[50];
        CurrencyText: Text[30];
        UnitOfMeasure: Code[10];
        //SalesPriceType: Option Customer,"Customer Price Group","All Customers",Campaign;
        SalesPriceType: Enum "Sales Price Type";
        SalesCode: Code[20];
        CustNo: Code[20];
        ContNo: Code[20];
        CampaignNo: Code[20];
        ItemNo: Code[20];
        ItemDesc: Text[50];
        SalesDesc: Text[50];
        CustPriceGrCode: Code[10];
        CustDiscGrCode: Code[20];
        IsFirstSalesPrice: Boolean;
        IsFirstSalesLineDisc: Boolean;
        PricesInCurrency: Boolean;
        CurrencyFactor: Decimal;
        [InDataSet]
        SalesCodeCtrlEnable: Boolean;
        Text004: label 'You must specify a sales code, if the sales type is different from All Customers.';
        PriceListCaptionLbl: label 'Price List';
        CompanyInfoPhoneNoCaptionLbl: label 'Phone No.';
        CompanyInfoFaxNoCaptionLbl: label 'Fax No.';
        CompanyInfoVATRegNoCaptionLbl: label 'VAT Reg. No.';
        CompanyInfoGiroNoCaptionLbl: label 'Giro No.';
        CompanyInfoBankNameCaptionLbl: label 'Bank';
        CompanyInfoBankAccNoCaptionLbl: label 'Account No.';
        ItemNoCaptionLbl: label 'Item No.';
        ItemDescCaptionLbl: label 'Description';
        UnitOfMeasureCaptionLbl: label 'Unit of Measure';
        MinimumQuantityCaptionLbl: label 'Minimum Quantity';
        VATTextCaptionLbl: label 'VAT';
        "***dynalogic": Integer;
        iItemRef: Record "Item Reference";
        extItem: Code[20];
        extDescription: Text[50];
        FromSalesPrice: Record "Sales Price";
        iPrice: Decimal;
        MinQty: Decimal;

    local procedure SetCurrency(CurrencyCode2: Code[10]; CurrencyFactor2: Decimal)
    begin
        PricesInCurrency := Currency.Code <> '';
        if PricesInCurrency then begin
            Currency.Find;
            CurrencyText := ' (' + Currency.Code + ')';
            CurrencyFactor := 0;
        end else
            GLSetup.Get;
    end;


    procedure ConvertPricetoUoM(var UOMCode: Code[10]; var UnitPrice: Decimal)
    var
        UOMMgt: Codeunit "Unit of Measure Management";
    begin
        if UOMCode = '' then begin
            UnitPrice :=
              UnitPrice * UOMMgt.GetQtyPerUnitOfMeasure(Item, Item."Sales Unit of Measure");
            if UOMCode = '' then
                UOMCode := Item."Sales Unit of Measure"
            else
                UOMCode := Item."Base Unit of Measure";
        end;
    end;

    local procedure ConvertPriceLCYToFCY(CurrencyCode: Code[10]; var UnitPrice: Decimal)
    begin
        if PricesInCurrency then begin
            if CurrencyCode = '' then begin
                if CurrencyFactor = 0 then begin
                    Currency.TestField("Unit-Amount Rounding Precision");
                    CurrencyFactor := CurrExchRate.ExchangeRate(DateReq, Currency.Code);
                end;
                UnitPrice := CurrExchRate.ExchangeAmtLCYToFCY(DateReq, Currency.Code, UnitPrice, CurrencyFactor);
            end;
            UnitPrice := ROUND(UnitPrice, Currency."Unit-Amount Rounding Precision");
        end else
            UnitPrice := ROUND(UnitPrice, GLSetup."Unit-Amount Rounding Precision");
    end;


    procedure PreparePrintSalesPrice(IsVariant: Boolean)
    begin
        with SalesPrice do begin
            if PricesInCurrency then begin
                SetRange("Currency Code", Currency.Code);
                if Find('-') then begin
                    SetRange("Currency Code", '');
                    DeleteAll;
                end;
                SetRange("Currency Code");
            end;

            SetRange("Sales Type", SalesPriceType);
            SetRange("Sales Code", SalesCode);

            if IsVariant then begin
                SetRange("Variant Code", '');
                DeleteAll;
                SetRange("Variant Code");
            end;
        end;

        IsFirstSalesPrice := true;
    end;


    procedure PrintSalesPrice(IsVariant: Boolean)
    begin
        with SalesPrice do begin
            if IsFirstSalesPrice then begin
                IsFirstSalesPrice := false;
                if not Find('-') then begin
                    if not IsVariant then begin
                        if SalesPriceType = SalesPriceType::Campaign then
                            CurrReport.Skip;

                        "Currency Code" := '';
                        "Price Includes VAT" := Item."Price Includes VAT";
                        "Unit Price" := Item."Unit Price";
                        "Unit of Measure Code" := Item."Base Unit of Measure";
                        "Minimum Quantity" := 0;
                    end else
                        CurrReport.Skip;
                end;
            end else
                if Next = 0 then
                    CurrReport.Break;

            if (SalesPriceType = SalesPriceType::Campaign) and ("Sales Type" <> "sales type"::Campaign) then
                CurrReport.Skip;

            if "Price Includes VAT" then
                VATText := Text000
            else
                VATText := Text001;
            UnitOfMeasure := "Unit of Measure Code";
            ConvertPricetoUoM(UnitOfMeasure, "Unit Price");
            ConvertPriceLCYToFCY("Currency Code", "Unit Price");
        end;
    end;


    procedure PreparePrintSalesDisc(IsVariant: Boolean)
    begin
        with SalesLineDisc do begin
            if PricesInCurrency then begin
                SetRange("Currency Code", Currency.Code);
                if Find('-') then begin
                    SetRange("Currency Code", '');
                    DeleteAll;
                end;
                SetRange("Currency Code");
            end;

            if IsVariant then begin
                SetRange("Variant Code", '');
                DeleteAll;
                SetRange("Variant Code");
            end;
        end;

        IsFirstSalesLineDisc := true;
    end;


    procedure PrintSalesDisc()
    begin
        with SalesLineDisc do begin
            if IsFirstSalesLineDisc then begin
                IsFirstSalesLineDisc := false;
                if not Find('-') then
                    CurrReport.Break;
            end else
                if Next = 0 then
                    CurrReport.Break;

            if (SalesPriceType = SalesPriceType::Campaign) and ("Sales Type" <> "sales type"::Campaign) then
                CurrReport.Skip;

            if "Unit of Measure Code" = '' then
                UnitOfMeasure := Item."Base Unit of Measure"
            else
                UnitOfMeasure := "Unit of Measure Code";
        end;
    end;


    procedure InitializeRequest(NewDateReq: Date; NewSalesPriceType: Option; NewSalesCode: Code[20]; NewCurrencyCode: Code[10])
    begin
        DateReq := NewDateReq;
        SalesPriceType := NewSalesPriceType;
        SalesCode := NewSalesCode;
        Currency.Code := NewCurrencyCode;
    end;


    procedure ValidateSalesCode()
    begin
        if (SalesPriceType <> SalesPriceType::"All Customers") and (SalesCode = '') then
            Error(Text004);

        case SalesPriceType of
            SalesPriceType::Customer:
                Cust.Get(SalesCode);
            SalesPriceType::"Customer Price Group":
                CustPriceGr.Get(SalesCode);
            SalesPriceType::Campaign:
                Campaign.Get(SalesCode);
        end;
    end;
}

