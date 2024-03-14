pageextension 50000 DynDataUpgrade extends "Company Information"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Application Settings")
        {
            action(ActionName)
            {
                Caption = 'Dataupgrade';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //Run(page::"Field Compare Table");
                end;
            }    // Add changes to page actions here
        }
    }

    var
        myInt: Integer;
}