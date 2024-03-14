//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 50000 "ax data"
{
    FieldSeparator = ';';
    Format = VariableText;

    schema
    {
        textelement(axData)
        {
            tableelement("Axapta Items"; "Axapta Items")
            {
                XmlName = 'item';
                fieldelement(no; "Axapta Items".No)
                {
                }
                fieldelement(naviNo; "Axapta Items".NaviNo)
                {
                }
                fieldelement(descr; "Axapta Items".Description)
                {
                }
                fieldelement(grp; "Axapta Items".ItemGroup)
                {
                }
                fieldelement(uom; "Axapta Items".BomUOM)
                {
                }
                fieldelement(recId; "Axapta Items".RecId)
                {
                }
            }
            tableelement("ProdBom Axapta"; "ProdBom Axapta")
            {
                XmlName = 'prodBom';
                fieldelement(no; "ProdBom Axapta"."No.")
                {
                }
                fieldelement(descr; "ProdBom Axapta".Description)
                {
                }
                fieldelement(search; "ProdBom Axapta"."Search Name")
                {
                }
                fieldelement(apprBy; "ProdBom Axapta"."Approved By")
                {
                }
                fieldelement(fromDate; "ProdBom Axapta"."From Date")
                {
                }
                fieldelement(modDate; "ProdBom Axapta"."Last Date Modified")
                {
                }
                fieldelement(toDate; "ProdBom Axapta"."To Date")
                {
                }
            }
            tableelement("ProdBomLine Axapta"; "ProdBomLine Axapta")
            {
                XmlName = 'prodBomLine';
                fieldelement(no; "ProdBomLine Axapta"."No.")
                {
                }
                fieldelement(line; "ProdBomLine Axapta".Line)
                {
                }
                fieldelement(type; "ProdBomLine Axapta".Type)
                {
                }
                fieldelement(itemNo; "ProdBomLine Axapta".ItemNo)
                {
                }
                fieldelement(uom; "ProdBomLine Axapta".UOM)
                {
                }
                fieldelement(qty; "ProdBomLine Axapta".qty)
                {
                }
                fieldelement(pos; "ProdBomLine Axapta".Position)
                {
                }
                fieldelement(configGrp; "ProdBomLine Axapta".ConfigGroupId)
                {
                }
                fieldelement(inventDimGrp; "ProdBomLine Axapta".InventDimId)
                {
                }
                fieldelement(bomId; "ProdBomLine Axapta".ItemBomId)
                {
                }
                fieldelement(level; "ProdBomLine Axapta".level)
                {
                }
                fieldelement(recId; "ProdBomLine Axapta".seq)
                {
                }
            }
            tableelement("ProdBomVersion Axapta"; "ProdBomVersion Axapta")
            {
                XmlName = 'prodBomVersion';
                fieldelement(bomId; "ProdBomVersion Axapta".BomId)
                {
                }
                fieldelement(itemId; "ProdBomVersion Axapta".ItemId)
                {
                }
                fieldelement(name; "ProdBomVersion Axapta".Name)
                {
                }
                fieldelement(apprBy; "ProdBomVersion Axapta".ApprovedBy)
                {
                }
                fieldelement(modBy; "ProdBomVersion Axapta".ModifiedBy)
                {
                }
                fieldelement(recId; "ProdBomVersion Axapta".RecId)
                {
                }
                fieldelement(fromDate; "ProdBomVersion Axapta".FromDate)
                {
                }
                fieldelement(toDate; "ProdBomVersion Axapta".ToDate)
                {
                }
            }
            tableelement("Item Variant"; "Item Variant")
            {
                XmlName = 'itemVar';
                fieldelement(code; "Item Variant".Code)
                {
                }
                fieldelement(no; "Item Variant"."Item No.")
                {
                }
                fieldelement(descr; "Item Variant".Description)
                {
                }
                fieldelement(descr2; "Item Variant"."Description 2")
                {
                }
            }
            tableelement(Family; Family)
            {
                XmlName = 'family';
                fieldelement(no; Family."No.")
                {
                }
                fieldelement(descr; Family.Description)
                {
                }
                fieldelement(descr2; Family."Description 2")
                {
                }
                fieldelement(search; Family."Search Name")
                {
                }
                fieldelement(block; Family.Blocked)
                {
                }
                fieldelement(modDate; Family."Last Date Modified")
                {
                }
                fieldelement(route; Family."Routing No.")
                {
                }
            }
            tableelement("Standard Task"; "Standard Task")
            {
                XmlName = 'stdTask';
                fieldelement(code; "Standard Task".Code)
                {
                }
                fieldelement(descr; "Standard Task".Description)
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

