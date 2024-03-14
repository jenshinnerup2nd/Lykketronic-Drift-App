PageExtension 73023 pageextension73023 extends "Posted Item Tracking Lines"
{
    layout
    {
        addafter(Quantity)
        {
            field("Item No."; Rec."Item No.")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = Basic;
                Caption = 'Beskrivelse';
                Editable = false;
            }
            field(extItem; extItem)
            {
                ApplicationArea = Basic;
                Caption = 'Debitor Varenummer';
            }
            field(extDescription; extDescription)
            {
                ApplicationArea = Basic;
                Caption = 'Debitor Varebeskrivelse';
            }
        }
    }

    var
        "***dynalogic": Integer;
        iItemRef: Record "Item Reference";
        extItem: Code[20];
        extDescription: Text[50];
        Produktion: Record "Production Order";
        ItemDescription: Text[50];

    trigger OnAfterGetRecord()
    begin
        GetLykketronicData;
    end;

    procedure GetLykketronicData()
    var
        DynItem: Record Item;
    begin
        extItem := '';
        extDescription := '';
        if Rec."Order Type" = Rec."Order Type"::Production then begin
            Produktion.SetRange(Produktion."No.", Rec."Order No.");
            if Produktion.FindFirst then begin
                if DynItem.Get(Rec."Item No.") then begin
                    ItemDescription := DynItem.Description;
                end;
                if Produktion.CustomerNo <> '' then begin
                    //iItemRef.SETRANGE("Item No.",Produktion."Source No.");
                    iItemRef.SetRange("Item No.", Rec."Item No.");
                    iItemRef.SetRange("Reference Type", iItemRef."Reference type"::Customer);
                    iItemRef.SetRange("Reference Type No.", Produktion.CustomerNo);
                    if iItemRef.FindFirst then begin
                        extItem := iItemRef."Reference No.";
                        extDescription := iItemRef.Description;
                    end;
                end;
            end;
        end;
    end;
}

