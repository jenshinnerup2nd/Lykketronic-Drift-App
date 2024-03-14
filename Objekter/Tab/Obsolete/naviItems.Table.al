//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50010 naviItems
{
    Caption = 'Navision-varer';

    fields
    {
        field(1; no; Code[20])
        {
            Caption = 'NaviNo';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Beskrivelse';
        }
        field(3; Description2; Text[50])
        {
            Caption = 'Beskrivelse 2';
        }
        field(4; note; Text[30])
        {
        }
        field(5; naviDescription; Text[100])
        {
            Caption = 'navi-Beskrivelse';
        }
        field(6; noNow; Code[20])
        {
            Caption = 'nyt Nr';
            TableRelation = Item;
        }
    }

    keys
    {
        key(Key1; no)
        {
            Clustered = true;
        }
        key(Key2; noNow)
        {
        }
    }

    fieldgroups
    {
    }
}

