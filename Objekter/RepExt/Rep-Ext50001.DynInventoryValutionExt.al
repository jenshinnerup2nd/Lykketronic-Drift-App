reportextension 50001 DynInventoryValutionExt extends "Inventory Valuation"
{
    dataset
    {
        add(Item)
        {
            column(LastDirectCost; "Last Direct Cost")
            {
            }
            column(ItemCategoryCode; "Item Category Code")
            {
            }
            column(ReplenishmentSystem; "Replenishment System")
            {
            }
            column(AltShelfNo; "Shelf No." + ' ' + AltShelfNo)
            {
            }
            column(StandardCost; "Standard Cost")
            {
            }
            column(ItemRolledupMaterialCost; Item."Rolled-up Material Cost")
            {
            }
            column(ItemRolledupCapacityCost; Item."Rolled-up Capacity Cost")
            {
            }
            column(Purchasing_Blocked; "Purchasing Blocked")
            {
            }
        }
    }
}
