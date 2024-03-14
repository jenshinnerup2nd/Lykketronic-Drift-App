# Indholder Side udvidelser

Der er kun beskrevet udvidelser der indholder kunde felter og og funktioner 

Udvidelse der indholder felter Standard felter er ikke beskrevet , men her kommer lille beskrivelse der forklare disse 

Dette er en udvidelse til "Routing Lines" siden i BC. Den ændrer et eksisterende felt kaldet "Routing Link Code" til at være synligt for brugeren. 
Normalt kan dette felt være skjult, men i denne udvidelse er det sat til at være synligt (Visible = true). 

pageextension 50003 DynRoutingLineExt extends "Routing Lines"
{
    layout
    {
        modify("Routing Link Code")
        {
            Visible = true;
        }
    }

}
 
# Page Extension 73028

`pageextension73028` er en sideudvidelse i AL, der udvider "Service Orders" siden i Dynamics 365 Business Central. Den tilføjer et nyt felt til layoutet:

- `Description`: Dette felt viser beskrivelsen fra den aktuelle post (`Rec`). Feltet er sat til ikke at være synligt (`Visible = false`), og det er tilføjet efter feltet "Service Time (Hours)".

# Page Extension 50008 "BusinessManagerRCExt"

`BusinessManagerRCExt` er en sideudvidelse i AL, der udvider "Business Manager Role Center" siden i Dynamics 365 Business Central. Den tilføjer nye dele og handlinger til layoutet:

## Layout
- `SalesPerformancePart`: Dette er en del, der viser "Sales Performance". Den er tilføjet efter `Control55`.
- `PowerBIEmbeddedReportPart10` og `PowerBIEmbeddedReportPart11`: Disse er dele, der viser "Power BI Embedded Report Part". De er tilføjet efter `PowerBIEmbeddedReportPart3`.

## Actions
- `Lykketronic_Action1`: Dette er en gruppe af handlinger med titlen 'Lykketronic'. Den er tilføjet efter "Excel Reports".
    - `Lykketronicpage2`: Dette er en handling inden for `Lykketronic_Action1` gruppen. Når den udføres, åbner den "Fakturasøgning" siden i redigeringstilstand. Handlingen har et ikon af "Share" og en tooltip, der forklarer dens formål.
- `Lykketronic_Action3`: Dette er en anden gruppe af handlinger med titlen 'Lykketronic'. Den er tilføjet efter "Chart of Accounts".
    - `Lykketronicreport1` til `Lykketronicreport6`: Disse er handlinger inden for `Lykketronic_Action3` gruppen. Når de udføres, åbner de forskellige rapporter ("Customer - LT pakkeliste", "Customer OrderDetail Lykke", "DynPriceList", "DynChartDeliverySales", "DynChartDeliverySalesservice", "DynCustomerItemSales"). Hver handling har et ikon af "Print Document" og en tooltip, der forklarer dens formål.
    - `LykketronicPage1`: Dette er en handling inden for `Lykketronic_Action3` gruppen. Når den udføres, åbner den "DynSaleLine" siden i visningstilstand. Handlingen har et ikon af "Show Matrix" og en tooltip, der forklarer dens formål.


# Page Extension 73009 "pageextension73009"

`pageextension73009` er en sideudvidelse i AL, der udvider "Comment Sheet" siden i Dynamics 365 Business Central. Den tilføjer et nyt felt til layoutet:

- `Afd.`: Dette felt viser 'Afd.' (afdeling) fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Code". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`) og har en billedtekst 'Afd.'.

Bemærk: Der er ingen handlinger tilføjet i denne sideudvidelse baseret på den aktive udvælgelse.


# Page Extension 73040 "pageextension73040"

`pageextension73040` er en sideudvidelse i AL, der udvider "Finished Production Order" siden i Dynamics 365 Business Central. Den tilføjer nye handlinger til siden:

## Actions
- `Item List`: Denne handling er tilføjet efter "&Warehouse Entries" handlingen. Når den udføres, printer den produktionsordren ved hjælp af `ManuPrintReport` kodeenheden. Handlingen er fremhævet på siden og har en billedtekst 'LT job card'.

- `Relation`: Denne handling er tilføjet efter en handling med navnet "<Action2>". Når den udføres, kalder den `KaldSerieNrStyring` funktionen i `SerieNummerRelation` kodeenheden med produktionsordrens nummer. Handlingen har en billedtekst 'Relater serienumre'.

- `test`: Denne handling er også tilføjet efter "<Action2>" handlingen. Når den udføres, kører den rapport 50011. Handlingen er ikke synlig på siden og har en billedtekst 'Test jobkort'.

## Variables
- `ManuPrintReport`: Dette er en instans af "Manu. Print Report" kodeenheden, der bruges til at printe produktionsordren i `Item List` handlingen.


# Page Extension 73032 "pageextension73032"

`pageextension73032` er en sideudvidelse i AL, der udvider "Finished Production Orders" siden i Dynamics 365 Business Central. Den tilføjer en ny handling til siden:

## Actions
- `Serienumre`: Denne handling er tilføjet i begyndelsen af "Reporting" handlingerne. Når den udføres, kalder den `KaldSerieNrStyringNew` funktionen i `SerieNummer` kodeenheden med produktionsordrens nummer. Handlingen er fremhævet på siden og har et ikon af "Action".

## Variables
- `SerieNummer`: Dette er en instans af "SerieNummer" kodeenheden, der bruges til at kalde `KaldSerieNrStyringNew` funktionen i `Serienumre` handlingen.


# Page Extension 73037 "pageextension73037"

`pageextension73037` er en sideudvidelse i AL, der udvider "Firm Planned Prod. Order" siden i Dynamics 365 Business Central. Den tilføjer en ny handling til siden:

## Actions
- `LT Jobkort`: Denne handling er tilføjet efter "Subcontractor - Dispatch List" handlingen. Når den udføres, printer den den faste planlagte produktionsordre ved hjælp af `ManuPrintReport` kodeenheden. Handlingen er tilgængelig i alle applikationsområder (`ApplicationArea = Basic`) og har et ikon af "Report".

## Variables
- `ManuPrintReport`: Dette er en instans af "Manu. Print Report" kodeenheden, der bruges til at printe den faste planlagte produktionsordre i `LT Jobkort` handlingen.


# Page Extension 73030 "pageextension73030"

`pageextension73030` er en sideudvidelse i AL, der udvider "Firm Planned Prod. Orders" siden i Dynamics 365 Business Central. Den tilføjer et nyt felt og en ny handling til siden:

## Layout
- `No. Printed`: Dette felt viser 'No. Printed' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Bin Code". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

## Actions
- `Report Prod. Order - Mat. Req. Lykke`: Denne handling er tilføjet i begyndelsen af "Reporting" handlingerne. Når den udføres, kører den rapport 50010. Handlingen er fremhævet på siden (både i "Report" kategorien og som en stor handling), og har en billedtekst 'LT Job Card'.


# Page Extension 73025 "pageextension73025"

`pageextension73025` er en sideudvidelse i AL, der udvider "Item Replenishment FactBox" siden i Dynamics 365 Business Central. Den tilføjer en ny trigger til et eksisterende felt på siden:

## Layout
- `Vendor No.`: Dette felt viser 'Vendor No.' fra den aktuelle post (`Rec`). En `OnDrillDown` trigger er tilføjet til dette felt. Når brugeren klikker på feltet, henter triggeren leverandørposten (`vendorRec`) baseret på 'Vendor No.' og åbner "Vendor Card" siden for den pågældende leverandør i en modal dialogboks.

Bemærk: Der er ingen handlinger tilføjet i denne sideudvidelse baseret på den aktive udvælgelse.


# Page Extension 73022 "pageextension73022"

`pageextension73022` er en sideudvidelse i AL, der udvider "Item Tracking Lines" siden i Dynamics 365 Business Central. Den tilføjer nye felter til layoutet og ændrer nogle eksisterende handlinger:

## Layout
- `ItemDescription`: Dette felt viser 'DynItemDescription' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Serial No.". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`) og har en billedtekst 'Varebeskrivelse'.
- `extItem`: Dette felt viser 'DynExtItem' fra den aktuelle post (`Rec`). Det er tilføjet efter feltet "ItemDescription". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`) og har en billedtekst 'Debitor Varenr.'.
- `extDescription`: Dette felt viser 'DynExtDescription' fra den aktuelle post (`Rec`). Det er tilføjet efter feltet "extItem". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`) og har en billedtekst 'Debitor varebeskrivelse'.

## Actions
- `Assign &Serial No.`: Denne handling er blevet ændret til at have en genvejstast 'Shift+Ctrl+T'. Den er også blevet fremhævet på siden og er blevet gjort større.
- `CreateCustomizedSN`: Denne handling er blevet ændret til at have en genvejstast 'Shift+Ctrl+I'. Den er også blevet fremhævet på siden og er blevet gjort større.

## Variables
- `SerielNoArray`: Dette er en array af kodeværdier, der bruges i `Oldcode` proceduren.
- `iItemRef`: Dette er en instans af "Item Reference" posten.
- `extItem`: Dette er en kodeværdi, der bruges i `Oldcode` proceduren.
- `extDescription`: Dette er en tekstværdi, der bruges i `Oldcode` proceduren.
- `Produktion`: Dette er en instans af "Production Order" posten.
- `ItemDescription`: Dette er en tekstværdi, der bruges i `Oldcode` proceduren.


# Page Extension 50001 "DynItemListeExt"

`DynItemListeExt` er en sideudvidelse i AL, der udvider en ukendt side (sidenavnet er ikke inkluderet i det aktive uddrag). Den tilføjer nye felter til layoutet og en ny handling:

## Layout
- `Qty. on Sales Order`: Dette felt viser 'Qty. on Sales Order' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Vendor No.". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`).
- `Qty. on Purch. Order`: Dette felt viser 'Qty. on Purch. Order' fra den aktuelle post (`Rec`). Det er tilføjet efter feltet "Qty. on Sales Order". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`).
- `Qty. on Prod. Order`: Dette felt viser 'Qty. on Prod. Order' fra den aktuelle post (`Rec`). Det er tilføjet efter feltet "Qty. on Purch. Order". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`).
- `Qty. on Component Lines`: Dette felt viser 'Qty. on Component Lines' fra den aktuelle post (`Rec`). Det er tilføjet efter feltet "Qty. on Prod. Order". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`).

## FactBoxes
- `DocumentAttacmentDetails`: Dette er en FactBox af typen `DynDocAttachmentList`. Den er tilføjet som den første FactBox på siden. Den er linket til den aktuelle post via "No." feltet.

## Actions
- `VareLabel`: Denne handling er tilføjet i slutningen af "Reports" handlingerne. Når den udføres, kører den rapport 50111. Handlingen er fremhævet på siden (både i "Report" kategorien og som en stor handling), og har en billedtekst 'Vare - label'. Den har et ikon af "1099Form".

# Page Extension 50005 "DynProdComponent"

`DynProdComponent` er en sideudvidelse i AL, der udvider "Prod. Order Components" siden i Dynamics 365 Business Central. Den tilføjer et nyt felt til layoutet:

## Layout
- `Position (lykketronic)`: Dette felt viser 'pos30' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Remaining Quantity". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`).

Bemærk: Der er ingen handlinger tilføjet i denne sideudvidelse baseret på den aktive udvælgelse.


# Page Extension 50006 "DynCustomerList"

`DynCustomerList` er en sideudvidelse i AL, der udvider "Customer List" siden i Dynamics 365 Business Central. Den tilføjer to nye handlinger til siden:

## Actions
- `PakkeListe`: Denne handling er tilføjet i slutningen af "Reports" handlingerne. Når den udføres, kører den rapport 50108. Handlingen er fremhævet på siden (både i "Report" kategorien og som en stor handling), og har en billedtekst 'PakkeListe'. Den har et ikon af "8ball".

- `CustomerOrderDetail`: Denne handling er også tilføjet i slutningen af "Reports" handlingerne. Når den udføres, kører den rapport 55108. Handlingen er fremhævet på siden (både i "Report" kategorien og som en stor handling), og har en billedtekst 'Debitor - Ordrebeholdning'. Den har et ikon af "8ball".


# Page Extension 50007 "DynServiceOrderSubformExt"

`DynServiceOrderSubformExt` er en sideudvidelse i AL, der udvider "Service Order Subform" siden i Dynamics 365 Business Central. Den tilføjer en ny handling til siden:

## Actions
- `OpenServiceItem`: Denne handling er tilføjet efter "Create Service Item" handlingen. Når den udføres, åbner den "Service Item List" siden. Handlingen er tilgængelig i alle applikationsområder (`ApplicationArea = All`) og har en billedtekst 'Hop til Servicevare' og en tooltip 'Åbner og viser liste med Service vare (lykketronic)'.


# Page Extension 50009 "DynBookeeperRCExt"

`DynBookeeperRCExt` er en sideudvidelse i AL, der udvider "Bookkeeper Role Center" siden i Dynamics 365 Business Central. Den tilføjer nye handlinger til siden:

## Actions
- `Faktura Søgning`: Denne handling er tilføjet i en ny gruppe "Lykketronic_Action1" efter "EC &Sales List" handlingen. Når den udføres, åbner den "Fakturasøgning" siden i redigeringstilstand. Handlingen har en tooltip '(Lykketronic) Denne side er for fakturasøgning ved hjælp af et specificeret serienummer.'.

- `PakkeListe`: Denne handling er tilføjet i en ny gruppe "Lykketronic_Action3" efter "Chart of Accounts" handlingen. Når den udføres, kører den rapport "Customer - LT pakkeliste". Handlingen har en tooltip '(Lykketronic) Udskriv pakkeliste for debitor, med afgrænsning på debitor og periode (afsendelsedato)'.

- `Debitor Ordrebeholdning`: Denne handling er også i gruppen "Lykketronic_Action3". Når den udføres, kører den rapport "Customer OrderDetail Lykke". Handlingen har en tooltip '(Lykketronic) Udskrive Debitor ordrebeholdning, indholder lager beholdning og mulighederen for Export til Excel'.

- `Prisliste`: Denne handling er også i gruppen "Lykketronic_Action3". Når den udføres, kører den rapport "DynPriceList". Handlingen har en tooltip '(Lykketronic) Udskrive Debitor Prisliste'.

- `Leveringssikkerhed Grafer (Salg)`: Denne handling er også i gruppen "Lykketronic_Action3". Når den udføres, kører den rapport "DynChartDeliverySales". Handlingen har en tooltip '(Lykketronic) Udskrive Leveringssikkerhed (Salg)'.

- `Leveringssikkerhed Grafer (Service)`: Denne handling er også i gruppen "Lykketronic_Action3". Når den udføres, kører den rapport "DynChartDeliverySalesservice". Handlingen har en tooltip '(Lykketronic) Udskrive Leveringssikkerhed (Service))'.

- `Debitor Ordrebeholdning (oversigt ses på skærm (NY))`: Denne handling er også i gruppen "Lykketronic_Action3". Når den udføres, åbner den "DynSaleLine" siden i visningstilstand. Handlingen har en tooltip '(Lykketronic) Se Debitor ordrebeholdning, Viser Uge nr og Lagerbeholdning'.

- `Kunde/Varestatistik`: Denne handling er tilføjet i gruppen "Lykketronic_Action3" efter "Chart of Accounts" handlingen. Når den udføres, kører den rapport "DynCustomerItemSales". Handlingen er tilgængelig i alle applikationsområder (`ApplicationArea = all`), har en billedtekst 'Kunde/Varestatistik', et ikon af "PrintDocument", og en tooltip '(Lykketronic) Udskrive kunde/varestatistik'.

# Page Extension 50010 "DynO365ActivitiesPageExt"

`DynO365ActivitiesPageExt` er en sideudvidelse i AL, der udvider "O365 Activities" siden i Dynamics 365 Business Central. Den tilføjer nye felter til layoutet:

## Layout
- `Åbne Salgsordrer`: Dette felt viser 'DynOpenSalesOrders' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Ongoing Sales Orders". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`), har en billedtekst 'Åbne Salgsordrer', og en tooltip 'Alle åbne salgsordrer'. Når feltet klikkes på, åbner det "Sales Order List" siden.

- `Frigivne Salgsordrer`: Dette felt viser 'DynReleasedSalesOrders' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Åbne Salgsordrer". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`), har en billedtekst 'Frigivne Salgsordrer', og en tooltip 'Alle frigivne salgsordrer'. Når feltet klikkes på, åbner det "Sales Order List" siden.

- `Planlagte Prod.ordrer`: Dette felt viser 'DynPlanedProdOrders' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Frigivne Salgsordrer". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`), har en billedtekst 'Planlagte Prod.ordrer', og en tooltip 'Alle planlagte prod.ordrer'. Når feltet klikkes på, åbner det "Production Order List" siden.

- `Frigivne Prod.ordrer`: Dette felt viser 'DynReleasedProdOrders' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Planlagte Prod.ordrer". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`), har en billedtekst 'Frigivne Prod.ordrer', og en tooltip 'Alle frigivne prod.ordrer'. Når feltet klikkes på, åbner det "Production Order List" siden.

Bemærk: Der er ingen handlinger tilføjet i denne sideudvidelse baseret på den aktive udvælgelse.

# Page Extension 73036 "pageextension73036"

`pageextension73036` er en sideudvidelse i AL, der udvider "Planned Production Order" siden i Dynamics 365 Business Central. Den tilføjer en ny handling til siden:

## Actions
- `LT Jobkort`: Denne handling er tilføjet efter "Subcontractor - Dispatch List" handlingen. Når den udføres, kører den "Manu. Print Report" kodeenhedens `PrintProductionOrder` funktion med den aktuelle post (`Rec`) og 0 som parametre. Handlingen er tilgængelig i alle applikationsområder (`ApplicationArea = Basic`), har et ikon af "Report".

# Page Extension 73036 "pageextension73036"

`pageextension73036` er en sideudvidelse i AL, der udvider "Planned Production Order" siden i Dynamics 365 Business Central. Den tilføjer en ny handling til siden:

## Actions
- `LT Jobkort`: Denne handling er tilføjet efter "Subcontractor - Dispatch List" handlingen. Når den udføres, kører den "Manu. Print Report" kodeenhedens `PrintProductionOrder` funktion med den aktuelle post (`Rec`) og 0 som parametre. Handlingen er tilgængelig i alle applikationsområder (`ApplicationArea = Basic`), har et ikon af "Report".


# Page Extension 73039 "pageextension73039"

`pageextension73039` er en sideudvidelse i AL, der udvider "Planning Worksheet" siden i Dynamics 365 Business Central. Den tilføjer et nyt felt til layoutet og en trigger:

## Layout
- `DynUnPlannedWarning`: Dette felt viser 'DynUnPlannedWarning' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Item Description". Det er ikke redigerbart, men er aktiveret, fremhævet, viser ikke sin billedtekst, har en "Attention" stil, og er altid synligt.

## Triggers
- `OnAfterGetRecord`: Denne trigger udføres efter at posten er hentet. Den henter en "Untracked Planning Element" post baseret på den aktuelle post's "Worksheet Template Name", "Journal Batch Name", "Line No.", og 1. Hvis posten findes, sættes 'DynUnPlannedWarning' til 'Source' fra den hentede post. Hvis posten ikke findes, sættes 'DynUnPlannedWarning' til en tom streng.

Bemærk: Der er ingen handlinger tilføjet i denne sideudvidelse baseret på den aktive udvælgelse.

# Page Extension 73023 "pageextension73023"

`pageextension73023` er en sideudvidelse i AL, der udvider "Posted Item Tracking Lines" siden i Dynamics 365 Business Central. Den tilføjer nye felter til layoutet og en trigger:

## Layout
- `Item No.`: Dette felt viser 'Item No.' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Quantity". Det er ikke redigerbart og er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

- `Description`: Dette felt viser 'Description' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Item No.". Det er ikke redigerbart, har en billedtekst 'Beskrivelse', og er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

- `extItem`: Dette felt viser 'extItem' variablen. Feltet er tilføjet efter feltet "Description". Det har en billedtekst 'Debitor Varenummer' og er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

- `extDescription`: Dette felt viser 'extDescription' variablen. Feltet er tilføjet efter feltet "extItem". Det har en billedtekst 'Debitor Varebeskrivelse' og er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

## Triggers
- `OnAfterGetRecord`: Denne trigger udføres efter at posten er hentet. Den kalder `GetLykketronicData` proceduren.

## Procedures
- `GetLykketronicData`: Denne procedure henter data fra "Item", "Item Reference" og "Production Order" tabellerne baseret på den aktuelle post (`Rec`). Hvis "Order Type" er "Production" og en "Production Order" post kan findes med "Order No." fra den aktuelle post, henter den "Description" fra "Item" posten med "Item No." fra den aktuelle post og sætter "ItemDescription". Hvis "CustomerNo" i "Production Order" posten ikke er tom, sætter den "Reference Type" og "Reference Type No." i "Item Reference" posten til "Customer" og "CustomerNo" fra "Production Order" posten, og hvis en "Item Reference" post kan findes, sætter den "extItem" og "extDescription" til "Reference No." og "Description" fra "Item Reference" posten.

Bemærk: Der er ingen handlinger tilføjet i denne sideudvidelse baseret på den aktive udvælgelse.


# Page Extension 73034 "pageextension73034"

`pageextension73034` er en sideudvidelse i AL, der udvider "Production BOM Lines" siden i Dynamics 365 Business Central. Den tilføjer et nyt felt til layoutet og ændrer synligheden af nogle eksisterende felter:

## Layout
- `Line No.`: Dette felt viser 'Line No.' fra den aktuelle post (`Rec`). Feltet er tilføjet før alle andre felter. Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

- `Position (lykketronic)`: Dette felt viser 'pos30' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Routing Link Code". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`).

Følgende felter er ændret til at være synlige:
- `Position`
- `Position 2`
- `Position 3`
- `Routing Link Code`

Bemærk: Der er ingen handlinger tilføjet i denne sideudvidelse baseret på den aktive udvælgelse.

# Page Extension 73035 "pageextension73035"

`pageextension73035` er en sideudvidelse i AL, der udvider "Production BOM Version Lines" siden i Dynamics 365 Business Central. Den tilføjer et nyt felt til layoutet og ændrer synligheden af nogle eksisterende felter:

## Layout
- `Line No.`: Dette felt viser 'Line No.' fra den aktuelle post (`Rec`). Feltet er tilføjet før alle andre felter. Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

- `Position (lykketronic)`: Dette felt viser 'pos30' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Routing Link Code". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = All`).

Følgende felter er ændret til at være synlige:
- `Position`
- `Position 2`
- `Position 3`
- `Routing Link Code`

Bemærk: Der er ingen handlinger tilføjet i denne sideudvidelse baseret på den aktive udvælgelse.

# Page Extension 73038 "pageextension73038"

`pageextension73038` er en sideudvidelse i AL, der udvider "Released Production Order" siden i Dynamics 365 Business Central. Den tilføjer et nyt felt til layoutet og en ny handling:

## Layout
- `CustomerNo`: Dette felt viser 'CustomerNo' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Last Date Modified". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

## Actions
- `LT Jobkort`: Denne handling er tilføjet efter "Subcontractor - Dispatch List" handlingen. Når den udføres, kører den "Manu. Print Report" kodeenhedens `PrintProductionOrder` funktion med den aktuelle post (`Rec`) og 0 som parametre. Handlingen er tilgængelig i alle applikationsområder (`ApplicationArea = Basic`), har et ikon af "Report".


# Page Extension 73031 "pageextension73031"

`pageextension73031` er en sideudvidelse i AL, der udvider "Released Production Orders" siden i Dynamics 365 Business Central. Den tilføjer nye felter til layoutet og nye handlinger:

## Layout
- `Finished Quantity`: Dette felt viser 'Finished Quantity' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Quantity". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

- `Remaining Quantity`: Dette felt viser 'Remaining Quantity' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Finished Quantity". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

- `No. Printed`: Dette felt viser 'No. Printed' fra den aktuelle post (`Rec`). Feltet er tilføjet efter feltet "Bin Code". Det er tilgængeligt i alle applikationsområder (`ApplicationArea = Basic`).

## Actions
- `Item List`: Denne handling er tilføjet før alle andre handlinger i "Reporting" gruppen. Når den udføres, kører den rapport 50010. Handlingen er tilgængelig i alle applikationsområder (`ApplicationArea = Basic`), har en billedtekst 'LT job card', er fremhævet, har en "Report" kategori, og er stor.

- `Serienumre`: Denne handling er tilføjet efter "Change &Status" handlingen. Når den udføres, kører den `KaldSerieNrStyringNew` funktionen i "SerieNummer" kodeenheden med 'No.' fra den aktuelle post (`Rec`) som parameter. Handlingen er tilgængelig i alle applikationsområder (`ApplicationArea = Basic`), har en billedtekst 'Scan Serienummer', er fremhævet, og har et "Action" ikon.

- `Serienumre Test`: Denne handling er tilføjet efter "Serienumre" handlingen. Når den udføres, kører den "DynTest" side 50020's `ProdOrdre` funktion med 'No.' fra den aktuelle post (`Rec`) som parameter, og viser siden. Handlingen er tilgængelig i alle applikationsområder (`ApplicationArea = Basic`), og har en billedtekst 'Serienummer (Test)'.

- `Item List 2`: Denne handling er tilføjet efter "Production Order Statistics" handlingen. Når den udføres, kører den rapport 50011. Handlingen er tilgængelig i alle applikationsområder (`ApplicationArea = Basic`), har en billedtekst 'Test brug ikke', er fremhævet, har en "Report" kategori, er stor, og er ikke synlig.

# Rapportudvidelse 50002 "DynUpdateUnitCostExt"

`DynUpdateUnitCostExt` er en rapportudvidelse i AL, der udvider "Update Unit Cost" rapporten i Dynamics 365 Business Central. Den tilføjer en ny trigger:

## Triggers
- `OnOpenPage`: Denne trigger udføres, når anmodningssiden åbnes. Den kalder `InitializeRequest` funktionen med 1 og true som parametre. sætter ja i alle ved beregning af kostpris 

Bemærk: Der er ingen handlinger eller dataset tilføjet i denne rapportudvidelse.