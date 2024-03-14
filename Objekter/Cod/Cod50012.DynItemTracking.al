codeunit 50012 DynItemTracking
{
    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", OnAfterUpdateExpDateEditable, '', false, false)]
    procedure OnAfterUpdateExpDateEditable(CurrentSignFactor: Integer; var ExpirationDateEditable: Boolean; var ItemTrackingCode: Record "Item Tracking Code"; var NewExpirationDateEditable: Boolean; var TrackingSpecification: Record "Tracking Specification")
    var
    begin
        GetLykketronicData(ItemTrackingCode, NewExpirationDateEditable, TrackingSpecification);
    end;

    procedure GetLykketronicData(var ItemTrackingCode: Record "Item Tracking Code"; var NewExpirationDateEditable: Boolean; var TrackingSpecification: Record "Tracking Specification")
    var
        DynItem: Record Item;
    begin

        if Produktion.Get(Produktion.Status::Released, TrackingSpecification."Source ID") then begin
            ;
            if DynItem.Get(TrackingSpecification."Item No.") then
                TrackingSpecification.DynItemDescription := DynItem.Description;
            if Produktion.CustomerNo <> '' then begin
                iItemRef.SetRange("Item No.", Produktion."Source No.");
                iItemRef.SetRange("Reference Type", iItemRef."Reference type"::Customer);
                iItemRef.SetRange("Reference Type No.", Produktion.CustomerNo);
                if iItemRef.FindFirst then begin
                    TrackingSpecification.DynextItem := iItemRef."Reference No.";
                    TrackingSpecification.DynExtDescription := iItemRef.Description;
                end;
            end;
        end;

    end;

    procedure GetTrackingSpecificationRange() SerielNoRange: Text[50]
    var
        i: Integer;
        lastSerielNo: Text[20];
    begin

        for i := 1 to ArrayLen(SerielNoArray) do begin
            if SerielNoArray[i] <> '' then
                lastSerielNo := SerielNoArray[i];
        end;

        exit(SerielNoArray[1] + ' - ' + lastSerielNo);
    end;

    var
        SerielNoArray: array[999] of Code[20];
        "***dynalogic": Integer;
        iItemRef: Record "Item Reference";
        extItem: Code[20];
        extDescription: Text[100];
        Produktion: Record "Production Order";
        ItemDescription: Text[100];

}