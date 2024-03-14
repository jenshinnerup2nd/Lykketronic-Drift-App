//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50007 "Serienummer - liste"
{
    PageType = List;
    SourceTable = Serienummerrelaton;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Færdigvare serienr."; Rec."Færdigvare serienr.")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        //Serienummerelation2.SerieNr(Serienummerelation3);
                    end;
                }
                field("Færdigvarebeskrivelse"; Rec.Færdigvarebeskrivelse)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Råvare serienr."; Rec."Råvare serienr.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Vis faktura")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    if BogfFaktura.Get(FindFaktura.FindFaktura(Rec."Færdigvarenr.", Rec."Færdigvare serienr."))
                      then
                        Page.RunModal(132, BogfFaktura)
                    else
                        Message('Ingen faktura fundet på serienr. %1', Rec."Færdigvare serienr.");
                end;
            }
        }
    }

    var
        Serienummerelation: Page "Opret serienummerrelation";
        Serienummerelation2: Codeunit Serienummerrelation;
        Serienummerelation3: Record Serienummerrelaton;
        FindFaktura: Codeunit Serienummerrelation;
        BogfFaktura: Record "Sales Invoice Header";


    procedure DYNRefreshPage(Fserial: Code[20])
    begin
        Rec.SetFilter(Rec."Færdigvare serienr.", Fserial);
    end;
}

