PageExtension 73010 pageextension73010 extends "Posted Sales Shipment"
{
    actions
    {
        addfirst(Navigation)
        {
            // group("E-Mail")
            // {
            //     Caption = 'E-Mail';
            //     action("E-mail - This")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'E-mail - This';
            //         Image = Invoice;
            //         Promoted = true;
            //         PromotedCategory = Process;

            //         trigger OnAction()
            //         var
            //             CompanyInformation: Record "Company Information";
            //         begin
            //             CompanyInformation.EmailPostedSalesShipment_L(Rec);
            //         end;
            //     }
            //     action(Action1160520000)
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'E-Mail';
            //         Promoted = true;
            //         PromotedCategory = Process;

            //         trigger OnAction()
            //         var
            //             CompanyInformation: Record "Company Information";
            //         begin
            //             CompanyInformation.EmailPostedSalesShipment_C(Rec);
            //         end;
            //     }
            // }
        }
    }
}

