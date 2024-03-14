tableextension 50008 DynCommentLineExt extends "Comment Line"
{
    fields
    {
        field(50151; "Afd."; Option)
        {
            Caption = 'Afd.';
            FieldClass = Normal;
            DataClassification = CustomerContent;
            OptionMembers = Produktion,Indkøb,Salg,StykListe,Administration,Forsendelse,Modtagelse,Værktøj,Reperation,Udført;
            OptionCaption = 'Produktion,Indkøb,Salg,StykListe,Administration,Forsendelse,Modtagelse,Værktøj,Reperation,Udført';
        }
    }
}
