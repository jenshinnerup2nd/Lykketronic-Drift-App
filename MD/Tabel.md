# Tab50013.DynProdCompQtyHolder.al

`DynProdCompQtyHolder` er en tabel i AL i Dynamics 365 Business Central. Den indeholder følgende felter:

- `Status`: Dette felt er en enumeration af "Production Order Status".
- `ProdOrderNo`: Dette kodefelt gemmer produktionsordrenummeret.
- `RoutingNo`: Dette kodefelt gemmer routingnummeret.
- `ItemNo`: Dette kodefelt gemmer varenummeret.
- `FirstLineNo`: Dette heltalsfelt gemmer det første linjenummer.
- `Pos1` og `Pos2`: Disse tekstfelter gemmer positionerne.
- `LineNo`: Dette heltalsfelt gemmer linjenummeret.
- `Qty`: Dette decimalfelt gemmer mængden.

- Benyttes på rapport (nyt Jobkort)

# Tab50007.Serienummeruffer.al

`Serienummeruffer` er en tabel i AL i Dynamics 365 Business Central. Den indeholder følgende felter:

- `VareNr`: Dette kodefelt med en længde på 20 tegn er beregnet til at gemme varenummeret.
- `Beskrivelse`: Dette tekstfelt med en længde på 50 tegn er beregnet til at gemme en beskrivelse.
- `SerieNumre`: Dette tekstfelt med en længde på 250 tegn er beregnet til at gemme serienumre.
- `DynSerialNum`: Dette Blob felt er beregnet til at gemme serienumre i binær format.

- Benytte af Seriennummer funktion , opsamling og visning af serienummer Sammenhæng


# Tab50006.Serienummerrelaton.al

`Serienummerrelaton` er en tabel i AL i Dynamics 365 Business Central. Den indeholder følgende felter:

- `Færdigvare serienr.`: Dette kodefelt gemmer serienummeret for det færdige produkt.
- `Råvare serienr.`: Dette kodefelt gemmer serienummeret for råvaren.
- `Færdigvarenr.`: Dette kodefelt gemmer varenummeret for det færdige produkt.
- `Råvarenr.`: Dette kodefelt gemmer varenummeret for råvaren.
- `Registration Date`: Dette datofelt gemmer registreringsdatoen.
- `Posting Date`: Dette datofelt gemmer postdatoen.
- `Prod. Order No.`: Dette kodefelt gemmer produktionsordrenummeret.
- `Færdigvarebeskrivelse`: Dette tekstfelt gemmer en beskrivelse af det færdige produkt.
- `Faktura nr`: Dette tekstfelt gemmer en beskrivelse af fakturanummer


# Tab50008.DynSerialNumbers.al

`DynSerialNumbers` er en tabel i AL i Dynamics 365 Business Central. Den indeholder følgende felter:

- `SourceId`: Dette kodefelt med en længde på 20 tegn er beregnet til at gemme kilden til serienumrene.
- `SerialNum`: Dette tekstfelt med en længde på 250 tegn er beregnet til at gemme serienumrene.
- `LineNo`: Dette heltalsfelt gemmer linjenummeret.

Denne tabel har en nøgle `Key1` som er klyngende og består af felterne `SourceId`, `LineNo` og `SerialNum`.