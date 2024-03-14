codeunit 50014 DynServiceFunction
{
    [EventSubscriber(ObjectType::Table, Database::"Service Item Line", 'OnBeforeValidateWarranty', '', false, false)]
    local procedure OnBeforeValidateWarranty(var ServiceItemLine: Record "Service Item Line"; xServiceItemLine: Record "Service Item Line"; CallingFieldNo: Integer; var IsHandled: Boolean);
    begin
        // Override the warranty , by user
        IsHandled := true;
    end;
}
