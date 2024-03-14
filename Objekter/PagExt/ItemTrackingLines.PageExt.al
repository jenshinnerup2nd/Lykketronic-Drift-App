PageExtension 73022 pageextension73022 extends "Item Tracking Lines"
{
    layout
    {
        addafter("Serial No.")
        {

            field(ItemDescription; Rec.DynItemDescription)
            {
                ApplicationArea = Basic;
                Caption = 'Varebeskrivelse';
            }
            field(extItem; rec.DynExtItem)
            {
                ApplicationArea = Basic;
                Caption = 'Debitor Varenr.';
            }
            field(extDescription; Rec.DynExtDescription)
            {
                ApplicationArea = Basic;
                Caption = 'Debitor varebeskrivelse';
            }
        }

    }
    actions
    {
        modify("Assign &Serial No.")
        {
            ShortCutKey = 'Shift+Ctrl+T';
            Promoted = true;
            PromotedIsBig = true;
            PromotedCategory = Process;


        }
        modify(CreateCustomizedSN)
        {
            ShortCutKey = 'Shift+Ctrl+I';

            Promoted = true;
            PromotedIsBig = true;
            PromotedCategory = Process;

        }
    }

    procedure Oldcode()
    begin

        //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

        //trigger OnAfterGetCurrRecord()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        UpdateExpDateEditable;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        UpdateExpDateEditable;

        //Dynalogic - jhh
        GetLykketronicData;
        */
        //end;


        //Unsupported feature: Code Modification on "OnAfterGetRecord".

        //trigger OnAfterGetRecord()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ExpirationDateOnFormat;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ExpirationDateOnFormat;
        //Dynalogic - jhh
        GetLykketronicData;
        */
        //end;


        //Unsupported feature: Code Modification on "b(PROCEDURE 17)".

        //procedure AddToGlobalRecordSet();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TempTrackingSpecification.SETCURRENTKEY("Lot No.","Serial No.");
        IF TempTrackingSpecification.FIND('-') THEN
          REPEAT
        #4..27
              END;

              INSERT;

              IF "Buffer Status" = 0 THEN BEGIN
                xTempItemTrackingLine := Rec;
                xTempItemTrackingLine.INSERT;
        #35..38
            TempTrackingSpecification.SETRANGE("Lot No.");
            TempTrackingSpecification.SETRANGE("Serial No.");
          UNTIL TempTrackingSpecification.NEXT = 0;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..30
              // Dynalogic MMU Start
              SerielNoArray[Rec."Entry No."] := Rec."Serial No.";
              // Dynalogic MMU Start
        #32..41
        */
        //end;
    end;


    var
        SerielNoArray: array[999] of Code[20];
        iItemRef: Record "Item Reference";
        extItem: Code[20];
        extDescription: Text[50];
        Produktion: Record "Production Order";
        ItemDescription: Text[50];

}

