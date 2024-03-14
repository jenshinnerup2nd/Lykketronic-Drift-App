# Cod50008.DynFindAndUpdatePos30.al

Denne AL-fil indeholder en kodeenhed med navnet `DynFindAndUpdatePos30`.

## Procedurer

Gennemsøger Felt pos30 , og rette fejl tekst til Ø eller Å 

# Cod50005.DynProduction.al

`DynProduction` er en AL kodeenhed, der indeholder event abonnenter til at håndtere produktion i Dynamics 365 Business Central.

## Procedurer

- `NAL_OnBeforeInsertOutputItemJnlLine`: Denne event abonnent validerer "Setup Time" og "Run Time" felterne i en "Item Journal Line" post baseret på en "Prod. Order Routing Line" post. 
benyttes af Produktionskladde til automatiske at sætte opstilling og Opr. tid

- `NAL_OnTransferBOMItemOnBeforeGetPlanning`: Denne event abonnent kopierer værdien fra "pos30" feltet i en "Production BOM Line" post til en "Prod. Order Component" post. 
henter Pos30  Postition lykketronic fra styklisten.

# Cod50007.DynPurchase.al

`DynPurchase` er en AL kodeenhed, der indeholder event abonnenter til at håndtere købsprocesser i Dynamics 365 Business Central.

## Procedurer

- `NAL_OnBeforeReleasePurchaseDoc`: Denne event abonnent kører før frigivelsen af et købsdokument. Hvis det ikke er i forhåndsvisningstilstand, sætter den "Planning Flexibility" feltet til "None" for alle varelinjer i det pågældende købsdokument.

# Cod50012.DynItemTracking.al

`DynItemTracking` er en AL kodeenhed, der indeholder event abonnenter og procedurer til at håndtere varetracking i Dynamics 365 Business Central.

## Procedurer

- `OnAfterUpdateExpDateEditable`: Denne event abonnent kører efter opdatering af udløbsdatoens redigerbarhed. Den henter Lykketronic data for den pågældende varetrackingkode.

- `GetLykketronicData`: Denne procedure henter Lykketronic data for en given varetrackingkode. Den opdaterer også "DynItemDescription" og "DynExtDescription" felterne i en "Tracking Specification" post.

- `GetTrackingSpecificationRange`: Denne procedure returnerer en tekststreng, der repræsenterer intervallet af serienumre i `SerielNoArray`.

- Ovenstående er funktioner der benytte til at vedligehode eller hente data i Lykketronic varesporingsdata, i denne er oprette serienummer relationer ifb med registering på lager, efter produktion 

# Cod50013.DynInventory.al

`DynInventory` er en AL kodeenhed, der indeholder en event abonnent til at håndtere lagerstyring i Dynamics 365 Business Central.

## Procedurer

- `CalculateInventory_OnBeforeInsertItemJnlLine`: Denne event abonnent kører før indsættelse af en post i "Item Journal Line". Den henter den tilsvarende varepost og opdaterer "NaviNo" og "Bin Code" felterne i "Item Journal Line" posten baseret på vareposten. benytte i varekladder til at hente disse 2 felter.

# Cod50016.DynItem.al

`DynItem` er en AL kodeenhed, der indeholder event abonnenter til at håndtere vareinformation i Dynamics 365 Business Central.

## Procedurer

- `DYN_UpdateBOMDescription`: Denne event abonnent kører efter opdatering af en varepost. Den gennemsøger alle produktions-BOM-linjer, der refererer til varen, og opdaterer deres beskrivelse og måleenhedskode til at matche varens basisenhed og beskrivelse. Denne opdatering udføres kun, hvis produktions-BOM'en ikke er lukket.

- `DYN_ShowItemName`: Denne event abonnent kører efter hentning af en post fra "Item Ledger Entries" siden. Den henter den tilsvarende varepost og opdaterer beskrivelsen i "Item Ledger Entry" posten til at matche varens beskrivelse.


# Serienummerrelation.Codeunit.al

`Serienummerrelation` er en AL kodeenhed, der indeholder procedurer til at håndtere serienummerrelationer i Dynamics 365 Business Central.

## Procedurer

- `KaldSerieNrStyringNew`: Denne procedure tager et produktionsordrenummer som input og kører "SerieNrOpdateringNew" kodeenheden for den pågældende produktionsordre.

- `FindSerieNrPostNew`: Denne procedure finder den første varepost for et givet serienummer og kopierer den fundne varepost til en lokal variabel.
  
- Ovenståendende beytte til at hente og indsætte serienummer på produktions ordre hvis disse ikke er angivet 

# Cod50017.DynUpdateBomText.al

`DynUpdateBomText` er en AL kodeenhed, der indeholder procedurer til at opdatere tekst i produktions-BOM'er i Dynamics 365 Business Central.

## Procedurer

- `OnRun`: Denne trigger kører, når kodeenheden udføres. Den finder den første varepost og kalder `NAL_onUpdateItem` for hver varepost i databasen.

- `NAL_onUpdateItem`: Denne procedure tager en varepost som input. Hvis varepostens "Description" eller "Base Unit of Measure" felter ikke er tomme, gennemsøger den alle produktions-BOM-linjer, der refererer til varen. For hver åben produktions-BOM-linje opdaterer den "Description" og "Unit of Measure Code" felterne til at matche varens "Description" og "Base Unit of Measure".


# Cod50002.UpdateCalcMatAndCapAmount.al

`UpdateCalcMatAndCapAmount` er en AL kodeenhed, der indeholder en trigger til at opdatere beregnede materiale- og kapacitetsmængder i Dynamics 365 Business Central.

## Procedurer

- `OnRun`: Denne trigger kører, når kodeenheden udføres. Den tager en "Job Queue Entry" post som input. Hvis postens "Parameter String" felt ikke er tomt, kalder den `CalcItem` funktionen i "CalculateStandardCostAuto" kodeenheden med "Parameter String" feltet som input og `false` som det andet argument. funktion der kaldes via opgavekø til at opdater standard kostpris på varekort 
