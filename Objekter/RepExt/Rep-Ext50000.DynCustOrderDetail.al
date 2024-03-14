reportextension 50000 DynCustOrderDetail extends "Customer - Order Detail"
{
    dataset
    {
        add("Sales Line")
        {
            column(ItemInventory; Inventory)
            {

            }
        }
        modify("Sales Line")
        {

            trigger OnAfterAfterGetRecord()
            var
                Item: Record Item;
            begin
                //dynalogic, srn 07012015 Begin
                Clear(Inventory);
                IF item.GET("Sales Line"."No.") THEN BEGIN
                    item.CALCFIELDS(Inventory);
                    Inventory := item.Inventory;
                END;
                //dynalogic, srn 07012015 End
            end;

        }
    }
    var
        Inventory: Decimal;

}


