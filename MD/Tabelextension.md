# Tab-Ext50006.DYNDocumentAttachmentExt.al

`DYNDocumentAttachmentExt` er en tabeludvidelse i AL, der udvider "Document Attachment" tabellen i Dynamics 365 Business Central. Den tilføjer to nye felter: 

`DynBruger` og `DynParth`, begge er tekstfelter med en længde på 250 tegn. 

`DynBruger` feltet kan bruges til at gemme brugerinformation, mens `DynParth` feltet kan bruges til at gemme den originale sti til dokumentet.

# Tab-Ext50004.DynActivitesCueExt.al

`DynActivitesCueExt` er en tabeludvidelse i AL, der udvider "Activities Cue" tabellen i Dynamics 365 Business Central. Den tilføjer fire nye felter:

- `DynOpenSalesOrders`: Dette felt tæller antallet af åbne salgsordrer.
- `DynReleasedSalesOrders`: Dette felt tæller antallet af frigivne salgsordrer.
- `DynPlanedProdOrders`: Dette felt tæller antallet af planlagte produktionsordrer.
- `DynReleasedProdOrders`: Dette felt tæller antallet af frigivne produktionsordrer.

# Tab-Ext50003.DynSalesLineExt.al

`DynSalesLineExt` er en tabeludvidelse i AL, der udvider "Sales Line" tabellen i Dynamics 365 Business Central. Den tilføjer seks nye felter:

- `DynInventory`: Dette felt viser det samlede antal af et bestemt varenummer på lager.
- `DynProduction`: Dette felt er beregnet til at vise antallet af et bestemt varenummer i produktion.
- `DynPurchase`: Dette felt er beregnet til at vise antallet af et bestemt varenummer i købsordrer.
- `DynItemDescription`: Dette felt viser beskrivelsen af det pågældende varenummer.
- `DynCustomerName`: Dette felt viser navnet på den kunde, der er knyttet til salgslinjen.
- `DynSalesRef`: Dette felt viser den eksterne dokumentnummer fra salgshovedet.


# Tab-Ext50002.DynPlanningWorkSheet.al

`DynPlanningWorkSheet` er en tabeludvidelse i AL, der udvider "Requisition Line" tabellen i Dynamics 365 Business Central. Den tilføjer et nyt felt:

- `DynUnPlannedWarning`: Dette tekstfelt med en længde på 250 tegn er beregnet til at vise advarsler eller meddelelser relateret til uplanlagte elementer i en planlægningsproces. Feltet er markeret med `DataClassification` som `CustomerContent`.


# Tab-Ext50001.DynTrackingSpecification.al

`DynTrackingSpecification` er en tabeludvidelse i AL, der udvider "Tracking Specification" tabellen i Dynamics 365 Business Central. Den tilføjer tre nye felter:

- `DynItemDescription`: Dette tekstfelt med en længde på 100 tegn er beregnet til at vise en beskrivelse af varen.
- `DynExtDescription`: Dette tekstfelt med en længde på 100 tegn er beregnet til at vise en udvidet beskrivelse.
- `DynExtItem`: Dette tekstfelt med en længde på 50 tegn er beregnet til at vise et udvidet varenummer.

# Tab-Ext52014.DynProductionBOMLineExt.al

`DynProductionBOMLineExt` er en tabeludvidelse i AL, der udvider "Production BOM Line" tabellen i Dynamics 365 Business Central. Den tilføjer et nyt felt:

- `pos30`: Dette tekstfelt med en længde på 30 tegn er beregnet til at gemme brugerdefinerede data. Feltet er markeret med `DataClassification` som `CustomerContent`.
- Indholder summem af Pos 1 & Pos 2 & Pos 3

# Tab-Ext52013.DynServiceItemLineExt.al

`DynServiceItemLineExt` er en tabeludvidelse i AL, der udvider "Service Item Line" tabellen i Dynamics 365 Business Central. Den tilføjer et nyt felt:

- `PostingDate`: Dette datofelt er beregnet til at gemme postdatoen for en servicevarelinje. Feltet er markeret med `DataClassification` som `CustomerContent`.


# Tab-Ext52012.DynProdOrderComponentExt.al

`DynProdOrderComponentExt` er en tabeludvidelse i AL, der udvider "Prod. Order Component" tabellen i Dynamics 365 Business Central. Den tilføjer et nyt felt:

- `pos30`: Dette tekstfelt med en længde på 30 tegn er beregnet til at gemme brugerdefinerede data. Feltet er markeret med `DataClassification` som `CustomerContent`.
-  Indholder summem af Pos 1 & Pos 2 & Pos 3

# Tab-Ext52011.DynProductionOrderExt.al

`DynProductionOrderExt` er en tabeludvidelse i AL, der udvider "Production Order" tabellen i Dynamics 365 Business Central. Den tilføjer fire nye felter:

- `No. Printed`: Dette heltalsfelt er beregnet til at gemme antallet af gange, en produktionsordre er blevet udskrevet.
- `Finished Quantity`: Dette decimalfelt er en flowfield, der beregner summen af "Finished Quantity" fra "Prod. Order Line" for den aktuelle produktionsordre og vare.
- `Remaining Quantity`: Dette decimalfelt er en flowfield, der beregner summen af "Remaining Quantity" fra "Prod. Order Line" for den aktuelle produktionsordre og vare.
- `CustomerNo`: Dette kodefelt er beregnet til at gemme kundenummeret relateret til produktionsordren.  


# Tab-Ext50008.DynCommentLineExt.al

`DynCommentLineExt` er en tabeludvidelse i AL, der udvider "Comment Line" tabellen i Dynamics 365 Business Central. Den tilføjer et nyt felt:

- `Afd.`: Dette optionsfelt er beregnet til at gemme afdelingsinformation. Mulige værdier inkluderer Produktion, Indkøb, Salg, StykListe, Administration, Forsendelse, Modtagelse, Værktøj, Reparation, Udført.


# Tab-Ext52006.DynItemJournalLineExt.al

`DynItemJournalLineExt` er en tabeludvidelse i AL, der udvider "Item Journal Line" tabellen i Dynamics 365 Business Central. Den tilføjer et nyt felt:

- `NaviNo`: Dette kodefelt med en længde på 20 tegn er beregnet til at gemme Navision varenummer. Feltet er markeret med `DataClassification` som `CustomerContent`.



# Tab-Ext52003.DynItemExt.al

`DynItemExt` er en tabeludvidelse i AL, der udvider "Item" tabellen i Dynamics 365 Business Central. Den tilføjer otte nye felter:

- `NaviNo`: Dette kodefelt gemmer Navision varenummer.
- `NaviDescription`: Dette tekstfelt gemmer Navision varetekst.
- Resterende felter benyttes ikke


