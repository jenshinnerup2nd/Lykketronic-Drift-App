pageextension 50006 DynCustomerList extends "Customer List"
{
    layout
    {

    }
    actions
    {
        addlast(Reports)
        {

            action(PakkeListe)
            {
                Caption = 'PakkeListe';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                Image = "8ball";
                RunObject = Report 50108;
            }
            action(CustomerOrderDetail)
            {
                Caption = 'Debitor - Ordrebeholdning';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                Image = "8ball";
                RunObject = Report 55108;
            }
        }
    }
}
