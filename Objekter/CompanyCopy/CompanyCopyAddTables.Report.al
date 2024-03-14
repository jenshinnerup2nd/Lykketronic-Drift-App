//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70000 "Company Copy Add Tables"
{
    // CC1.5,  Company Copy, Emiel Romein eromein@home.nl
    // CC1.5.1 Company Copy, Updateed to Nav 2013 , Itthy 06-10-2013 by jhh@ithy.dk

    ProcessingOnly = true;

    dataset
    {
        dataitem("Object"; AllObj)
        {
            DataItemTableView = where("Object Type" = const(Table));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Object ID", "Object Name";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Table.Init;
                Table."Template Name" := TempalteFilter;
                Table."Table No." := Object."Object ID";
                Table."Exist Action" := DefaultAction;
                Table."Validate OnModify Trigger" := DefaultOnModify;
                Table."Validate OnInsert Trigger" := DefaultOnInsert;
                Table."Skip if Equal Num. of Records" := DefaultSkipIfEqual;
                Table.Order := LastOrderNo;
                if Table.Insert then
                    LastOrderNo := LastOrderNo + 10;
            end;

            trigger OnPreDataItem()
            begin
                Table.SetRange("Template Name", TempalteFilter);
                if Table.Find('+') then
                    LastOrderNo := Table.Order;

                LastOrderNo := LastOrderNo + 10;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(DefaultAction; DefaultAction)
                {
                    ApplicationArea = Basic;
                    Caption = 'Exist Action';

                    trigger OnValidate()
                    begin
                        //CC 1.5.1
                        DefaultFields;
                    end;
                }
                field(DefaultSkipIfEqual; DefaultSkipIfEqual)
                {
                    ApplicationArea = Basic;
                    Caption = 'Skip Table if Equal Number of Records';

                    trigger OnValidate()
                    begin
                        //CC 1.5.1
                        DefaultFields;
                    end;
                }
                field(DefaultOnInsert; DefaultOnInsert)
                {
                    ApplicationArea = Basic;
                    Caption = 'Validate OnInsert';

                    trigger OnValidate()
                    begin
                        //CC 1.5.1
                        DefaultFields;
                    end;
                }
                field(DefaultOnModify; DefaultOnModify)
                {
                    ApplicationArea = Basic;
                    Caption = 'Validate OnModify';

                    trigger OnValidate()
                    begin
                        //CC 1.5.1
                        DefaultFields;
                    end;
                }
            }
        }

        actions
        {
        }

        trigger OnModifyRecord(): Boolean
        begin
            //CC 1.5.1
            DefaultFields;
        end;

        trigger OnOpenPage()
        begin
            //CC 1.5.1
            DefaultFields;
            DefaultOnInsert := true
        end;
    }

    labels
    {
    }

    var
        "Table": Record "Company Copy Table";
        TempalteFilter: Code[10];
        LastOrderNo: Integer;
        DefaultAction: Option Skip,Modify;
        DefaultSkipIfEqual: Boolean;
        DefaultOnInsert: Boolean;
        DefaultOnModify: Boolean;


    procedure DefaultFields()
    begin
        //CC 1.5.1
        if DefaultAction = Defaultaction::Skip then
            DefaultOnModify := false;

        if DefaultAction = Defaultaction::Modify then
            DefaultSkipIfEqual := false;

        if DefaultAction = Defaultaction::Modify then
            DefaultOnModify := true;
    end;


    procedure SetTemplate(Template: Code[10])
    begin
        TempalteFilter := Template;
    end;
}

