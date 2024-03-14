PageExtension 73028 pageextension73028 extends "Service Orders"
{
    layout
    {
        addafter("Service Time (Hours)")
        {
            field(Description; Rec.Description)
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
    }
    actions
    {

    }
}

