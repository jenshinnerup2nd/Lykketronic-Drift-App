//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50200 "Service Order Lykketronic"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Service Order Lykketronic.rdl';
    Caption = 'Service Order';

    dataset
    {
        dataitem("Service Header"; "Service Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Order));
            RequestFilterFields = "No.", "Customer No.";
            column(ReportForNavId_1634; 1634)
            {
            }
            column(No_ServHeader; "No.")
            {
            }
            column(No_ServHeaderCaption; DynNumberCaptionLbl)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_5701; 5701)
                {
                }
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(ReportForNavId_6455; 6455)
                    {
                    }
                    column(CompanyInfoPicture; CompanyInfo.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(ContractNo_ServHeader; "Service Header"."Contract No.")
                    {
                    }
                    column(OrderTime_ServHeader; "Service Header"."Order Time")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(OrderDate_ServHeader; Format("Service Header"."Order Date"))
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(Status_ServHeader; "Service Header".Status)
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(BilltoName_ServHeader; "Service Header"."Bill-to Name")
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(ServOrderCopyText; StrSubstNo(Text001, CopyText))
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                    {
                    }
                    column(PhoneNo_ServHeader; "Service Header"."Phone No.")
                    {
                    }
                    column(Email_ServHeader; "Service Header"."E-Mail")
                    {
                    }
                    column(Description_ServHeader; "Service Header".Description)
                    {
                    }
                    column(PageCaption; Text002)
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(ContractNoCaption; ContractNoCaptionLbl)
                    {
                    }
                    column(ServiceHeaderOrderDateCaption; ServiceHeaderOrderDateCaptionLbl)
                    {
                    }
                    column(InvoicetoCaption; InvoicetoCaptionLbl)
                    {
                    }
                    column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoFaxNoCaption; CompanyInfoFaxNoCaptionLbl)
                    {
                    }
                    column(ServiceHeaderEMailCaption; ServiceHeaderEMailCaptionLbl)
                    {
                    }
                    column(OrderTime_ServHeaderCaption; DynOrderTime)
                    {
                    }
                    column(Status_ServHeaderCaption; DynStatus)
                    {
                    }
                    column(Description_ServHeaderCaption; DynDescription)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        column(ReportForNavId_7574; 7574)
                        {
                        }
                        column(DimText; DimText)
                        {
                        }
                        column(Number_DimensionLoop1; Number)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.FindSet then
                                    CurrReport.Break;
                            end else
                                if not Continue then
                                    CurrReport.Break;

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break;
                        end;
                    }
                    dataitem("Service Order Comment"; "Service Comment Line")
                    {
                        DataItemLink = "Table Subtype" = field("Document Type"), "No." = field("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = sorting("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") where("Table Name" = const("Service Header"), Type = const(General));
                        column(ReportForNavId_9034; 9034)
                        {
                        }
                        column(Comment_ServOrderComment; Comment)
                        {
                        }
                        column(TabName_ServOrderComment; "Table Name")
                        {
                        }
                        column(No_ServOrderComment; "No.")
                        {
                        }
                        column(TableLineNo_ServOrderComment; "Table Line No.")
                        {
                        }
                    }
                    dataitem("Service Item Line"; "Service Item Line")
                    {
                        DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
                        column(ReportForNavId_6416; 6416)
                        {
                        }
                        column(LineNo_ServItemLine; "Line No.")
                        {
                        }
                        column(SerialNo_ServItemLine; "Serial No.")
                        {
                        }
                        column(Description_ServItemLine; Description)
                        {
                        }
                        column(ItemNo_ServItemLineServ; "Service Item No.")
                        {
                        }
                        column(ServItemGroupCode_ServItemLine; "Service Item Group Code")
                        {
                        }
                        column(Warranty_ServItemLine; Format(Warranty))
                        {
                        }
                        column(LoanerNo_ServItemLine; "Loaner No.")
                        {
                        }
                        column(RepairStatusCode_ServItemLine; "Repair Status Code")
                        {
                        }
                        column(ServShelfNo_ServItemLine; "Service Shelf No.")
                        {
                        }
                        column(ResponseTime_ServItemLine; Format("Response Time"))
                        {
                        }
                        column(ResponseDate_ServItemLine; Format("Response Date"))
                        {
                        }
                        column(DocumentNo_ServItemLine; "Document No.")
                        {
                        }
                        column(ServiceItemLineWarrantyCaption; CaptionClassTranslate(FieldCaption(Warranty)))
                        {
                        }
                        column(ServiceItemLinesCaption; ServiceItemLinesCaptionLbl)
                        {
                        }
                        column(ServiceItemLineResponseDateCaption; ServiceItemLineResponseDateCaptionLbl)
                        {
                        }
                        column(ServiceItemLineResponseTimeCaption; ServiceItemLineResponseTimeCaptionLbl)
                        {
                        }
                        column(SerialNo_ServItemLineCaption; DynSerialNo)
                        {
                        }
                        column(Description_ServItemLineCaption; DynDescription2)
                        {
                        }
                        column(ItemNo_ServItemLineServCaption; DynServItem)
                        {
                        }
                        column(ServItemGroupCode_ServItemLineCaption; FieldCaption("Service Item Group Code"))
                        {
                        }
                        column(LoanerNo_ServItemLineCaption; FieldCaption("Loaner No."))
                        {
                        }
                        column(RepairStatusCode_ServItemLineCaption; DynRepairCaptionLbl)
                        {
                        }
                        column(ServShelfNo_ServItemLineCaption; DynShelf)
                        {
                        }
                        dataitem("Fault Comment"; "Service Comment Line")
                        {
                            DataItemLink = "Table Subtype" = field("Document Type"), "No." = field("Document No."), "Table Line No." = field("Line No.");
                            DataItemTableView = sorting("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") where("Table Name" = const("Service Header"), Type = const(Fault));
                            column(ReportForNavId_8902; 8902)
                            {
                            }
                            column(Comment_FaultComment; Comment)
                            {
                            }
                            column(TableSubtype_FaultComment; "Table Subtype")
                            {
                            }
                            column(Type_FaultComment; Type)
                            {
                            }
                            column(LineNo_FaultComment; "Line No.")
                            {
                            }
                            column(FaultCommentsCaption; FaultCommentsCaptionLbl)
                            {
                            }
                        }
                        dataitem("Resolution Comment"; "Service Comment Line")
                        {
                            DataItemLink = "Table Subtype" = field("Document Type"), "No." = field("Document No."), "Table Line No." = field("Line No.");
                            DataItemTableView = sorting("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") where("Table Name" = const("Service Header"), Type = const(Resolution));
                            column(ReportForNavId_5074; 5074)
                            {
                            }
                            column(Comment_ResolutionComment; Comment)
                            {
                            }
                            column(TableSubtype_ResolutionComment; "Table Subtype")
                            {
                            }
                            column(Type_ResolutionComment; Type)
                            {
                            }
                            column(LineNo_ResolutionComment; "Line No.")
                            {
                            }
                            column(ResolutionCommentsCaption; ResolutionCommentsCaptionLbl)
                            {
                            }
                        }
                    }
                    dataitem("Service Line"; "Service Line")
                    {
                        DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
                        column(ReportForNavId_6560; 6560)
                        {
                        }
                        column(ServLineLineNo; "Line No.")
                        {
                        }
                        column(TotalAmt; TotalAmt)
                        {
                        }
                        column(TotalGrossAmt; TotalGrossAmt)
                        {
                        }
                        column(ServItemSerialNo_ServLine; "Service Item Serial No.")
                        {
                        }
                        column(Type_ServLine; Type)
                        {
                        }
                        column(No_ServLine; "No.")
                        {
                        }
                        column(VariantCode_ServLine; "Variant Code")
                        {
                        }
                        column(Description_ServLine; Description)
                        {
                        }
                        column(Qty; Qty)
                        {
                        }
                        column(UnitPrice_ServLine; "Unit Price")
                        {
                        }
                        column(LineDiscount_ServLine; "Line Discount %")
                        {
                        }
                        column(Amt; Amt)
                        {
                        }
                        column(GrossAmt; GrossAmt)
                        {
                        }
                        column(QtyConsumed_ServLine; "Quantity Consumed")
                        {
                        }
                        column(QtytoConsume_ServLine; "Qty. to Consume")
                        {
                        }
                        column(DocumentNo_ServLine; "Document No.")
                        {
                        }
                        column(QtyCaption; QtyCaptionLbl)
                        {
                        }
                        column(ServiceLinesCaption; ServiceLinesCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(GrossAmountCaption; GrossAmountCaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        column(ServItemSerialNo_ServLineCaption; DynServSerial)
                        {
                        }
                        column(Type_ServLineCaption; DynType)
                        {
                        }
                        column(No_ServLineCaption; DynItemNo)
                        {
                        }
                        column(VariantCode_ServLineCaption; FieldCaption("Variant Code"))
                        {
                        }
                        column(Description_ServLineCaption; FieldCaption(Description))
                        {
                        }
                        column(UnitPrice_ServLineCaption; FieldCaption("Unit Price"))
                        {
                        }
                        column(LineDiscount_ServLineCaption; FieldCaption("Line Discount %"))
                        {
                        }
                        column(QtyConsumed_ServLineCaption; FieldCaption("Quantity Consumed"))
                        {
                        }
                        column(QtytoConsume_ServLineCaption; FieldCaption("Qty. to Consume"))
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                            column(ReportForNavId_3591; 3591)
                            {
                            }
                            column(DimText2; DimText)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.FindSet then
                                        CurrReport.Break;
                                end else
                                    if not Continue then
                                        CurrReport.Break;

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break;

                                DimSetEntry2.SetRange("Dimension Set ID", "Service Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if ShowQty = Showqty::Quantity then begin
                                Qty := Quantity;
                                Amt := "Line Amount";
                                GrossAmt := "Amount Including VAT";
                            end else begin
                                if "Quantity Invoiced" = 0 then
                                    CurrReport.Skip;
                                Qty := "Quantity Invoiced";

                                Amt := ROUND((Qty * "Unit Price") * (1 - "Line Discount %" / 100));
                                GrossAmt := (1 + "VAT %" / 100) * Amt;
                            end;

                            TotalAmt += Amt;
                            TotalGrossAmt += GrossAmt;
                        end;

                        trigger OnPreDataItem()
                        begin
                            CurrReport.CreateTotals(Amt, GrossAmt);

                            TotalAmt := 0;
                            TotalGrossAmt := 0;
                        end;
                    }
                    dataitem(Shipto; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                        column(ReportForNavId_6218; 6218)
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowShippingAddr then
                                CurrReport.Break;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if Number > 1 then begin
                        CopyText := Text000;
                        OutputNo += 1;
                    end;

                    CurrReport.PageNo := 1;
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    if NoOfLoops <= 0 then
                        NoOfLoops := 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);

                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            var
                LanguageCU: Codeunit Language;
            begin
                CurrReport.Language := LanguageCU.GetLanguageIdOrDefault("Language Code");

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                if RespCenter.Get("Responsibility Center") then begin
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                end else
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                FormatAddr.ServiceOrderSellto(CustAddr, "Service Header");
                ShowShippingAddr := "Ship-to Code" <> '';
                if ShowShippingAddr then
                    FormatAddr.ServiceOrderShipto(ShipToAddr, "Service Header");
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
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic;
                        Caption = 'No. of Copies';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Show Internal Information';
                    }
                    field(ShowQty; ShowQty)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Amounts Based on';
                        OptionCaption = 'Quantity,Quantity Invoiced';
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
        CompanyInfo.Get;
        ServiceSetup.Get;

        case ServiceSetup."Logo Position on Documents" of
            ServiceSetup."logo position on documents"::"No Logo":
                ;
            ServiceSetup."logo position on documents"::Left:
                begin
                    CompanyInfo3.Get;
                    CompanyInfo3.CalcFields(Picture);
                end;
            ServiceSetup."logo position on documents"::Center:
                begin
                    CompanyInfo1.Get;
                    CompanyInfo1.CalcFields(Picture);
                end;
            ServiceSetup."logo position on documents"::Right:
                begin
                    CompanyInfo2.Get;
                    CompanyInfo2.CalcFields(Picture);
                end;
        end;
    end;

    var
        DynItemNo: label 'No.';
        DynType: label 'Type';
        DynServSerial: label 'Service Item Serial No.';
        DynShelf: label 'Service Shelf No.';
        DynServItem: label 'Service Item No.';
        DynDescription2: label 'Description';
        DynSerialNo: label 'Serial No.';
        DynDescription: label 'Description';
        DynStatus: label 'Status';
        DynOrderTime: label 'Order Time';
        DynNumberCaptionLbl: label 'Number';
        DynRepairCaptionLbl: label 'Repair status';
        Text000: label 'COPY';
        Text001: label 'Service Order %1';
        Text002: label 'Page %1 of %2';
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        ServiceSetup: Record "Service Mgt. Setup";
        RespCenter: Record "Responsibility Center";
        Language: Record Language;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        FormatAddr: Codeunit "Format Address";
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        OutputNo: Integer;
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ShowShippingAddr: Boolean;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[120];
        Qty: Decimal;
        Amt: Decimal;
        ShowQty: Option Quantity,"Quantity Invoiced";
        GrossAmt: Decimal;
        TotalAmt: Decimal;
        TotalGrossAmt: Decimal;
        ContractNoCaptionLbl: label 'Contract No.';
        ServiceHeaderOrderDateCaptionLbl: label 'Order Date';
        InvoicetoCaptionLbl: label 'Invoice to';
        CompanyInfoPhoneNoCaptionLbl: label 'Phone No.';
        CompanyInfoFaxNoCaptionLbl: label 'Fax No.';
        ServiceHeaderEMailCaptionLbl: label 'E-Mail';
        HeaderDimensionsCaptionLbl: label 'Header Dimensions';
        ServiceItemLinesCaptionLbl: label 'Service Item Lines';
        ServiceItemLineResponseDateCaptionLbl: label 'Response Date';
        ServiceItemLineResponseTimeCaptionLbl: label 'Response Time';
        FaultCommentsCaptionLbl: label 'Fault Comments';
        ResolutionCommentsCaptionLbl: label 'Resolution Comments';
        QtyCaptionLbl: label 'Quantity';
        ServiceLinesCaptionLbl: label 'Service Lines';
        AmountCaptionLbl: label 'Amount';
        GrossAmountCaptionLbl: label 'Gross Amount';
        TotalCaptionLbl: label 'Total';
        LineDimensionsCaptionLbl: label 'Line Dimensions';
        ShiptoAddressCaptionLbl: label 'Ship-to Address';


    procedure InitializeRequest(ShowInternalInfoFrom: Boolean; ShowQtyFrom: Option)
    begin
        ShowInternalInfo := ShowInternalInfoFrom;
        ShowQty := ShowQtyFrom;
    end;
}

