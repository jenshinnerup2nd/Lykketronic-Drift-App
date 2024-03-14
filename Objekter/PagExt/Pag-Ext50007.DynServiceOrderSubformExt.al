pageextension 50007 DynServiceOrderSubformExt extends "Service Order Subform"
{
    layout
    {

    }
    actions
    {
        addafter("Create Service Item")
        {
            action(OpenServiceItem)
            {
                Caption = 'Hop til Servicevare';
                ToolTip = 'Åbner og viser liste med Service vare (lykketronic)';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Run(page::"Service Item List");
                end;
            }
        }
    }
}
