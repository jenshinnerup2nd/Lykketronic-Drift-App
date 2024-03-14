//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50020 "Rename Record Link"
{

    trigger OnRun()
    begin
        Var_RecordLink.SetRange(Type, Var_RecordLink.Type::Link);
        Var_RecordLink.SetRange(Company, '300914  Lykketronic A/S');

        Message('Antal Records %1', Var_RecordLink.Count);

        Var_RecordLink.ModifyAll(Company, 'Lykketronic A/S', true)
    end;

    var
        Var_RecordLink: Record "Record Link";
}

