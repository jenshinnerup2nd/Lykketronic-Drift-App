# Report Extension 50001 DynInventoryValutionExt

## extends "Inventory Valuation"

`DynInventoryValutionExt` er en rapportudvidelse i AL, der udvider "Inventory Valuation" rapporten i Dynamics 365 Business Central. Den tilføjer nye kolonner til `Item` datasættet:

- `LastDirectCost`: Viser den seneste direkte omkostning for varen.
- `ItemCategoryCode`: Viser varekategori-koden for varen.
- `ReplenishmentSystem`: Viser genopfyldningssystemet for varen.
- `AltShelfNo`: Viser alternativ hylde nummer for varen.
- `StandardCost`: Viser standardomkostningen for varen.
- `ItemRolledupMaterialCost`: Viser den opregnede materialeomkostning for varen.
- `ItemRolledupCapacityCost`: Viser den opregnede kapacitetsomkostning for varen.
- `Purchasing_Blocked`: Viser om indkøb er blokeret for varen.


# Report Extension 50000 DynCustOrderDetail

## extends "Customer - Order Detail"

`DynCustOrderDetail` er en rapportudvidelse i AL, der udvider "Customer - Order Detail" rapporten i Dynamics 365 Business Central. Den tilføjer en ny kolonne og en trigger til `Sales Line` datasættet:

- `ItemInventory`: Denne kolonne viser lagerbeholdningen for den pågældende vare.

- `OnAfterAfterGetRecord` trigger: Denne trigger udføres efter hver post i `Sales Line` datasættet er hentet. Den henter vareposten baseret på varenummeret i salgslinjen, beregner lagerbeholdningen for varen og tildeler denne værdi til `ItemInventory` kolonnen.