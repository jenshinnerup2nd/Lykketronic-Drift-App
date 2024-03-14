tableextension 50005 DynCompanyInformationExt extends "Company Information"
{
    fields
    {
        field(50000; "Posted Service Inv.Report ID"; Integer)
        {
            Caption = 'Bogf. Servicefakt. Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50001; "Posted Service Inv.Rep Cap"; Text[100])
        {
            Caption = 'Bogf. Servicefakt. Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;
        }
        field(50002; "Posted Service Shpm. Report ID"; Integer)
        {
            Caption = 'Bogf. servicelev. - Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50003; "Posted Service Shpm. Rep. Cap"; Text[100])
        {
            Caption = 'Bogf. servicelev. - Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;
        }
        field(50004; "Service Order Report ID"; Integer)
        {
            Caption = 'Serviceordre Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(50005; "Service Order Report Caption"; Text[100])
        {
            Caption = 'Serviceordre Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;
        }
        field(76001; "What to Include"; Option)
        {
            Caption = 'Indsæt';
            FieldClass = Normal;
            DataClassification = CustomerContent;
            OptionMembers = Both,PDF,Image;
            OptionCaption = 'Both,PDF,Image';
        }
        field(76003; "PDF Printer"; Text[30])
        {
            Caption = 'PDF Printer';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76004; "Demo Mode"; Boolean)
        {
            Caption = 'Demonstration';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76005; "From E-mail"; Text[250])
        {
            Caption = 'Fra E-mail';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76006; "BCC E-mail"; Text[250])
        {
            Caption = 'BCC E-mail';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76007; "Send Method for Card"; Option)
        {
            Caption = 'Afsendelsesmetode for kort';
            FieldClass = Normal;
            DataClassification = CustomerContent;
            OptionMembers = OutlookManual,,,MAPIManual,,NotesManual;
            OptionCaption = 'OutlookManual,,,MAPIManual,,NotesManual';
        }
        field(76008; "Send Method for List"; Option)
        {
            Caption = 'Afsendelsesmetode for lister';
            FieldClass = Normal;
            DataClassification = CustomerContent;
            OptionMembers = OutlookManual,OutlookDirect,SMTP,MAPIManual,MAPIDirect,NotesManual;
            OptionCaption = 'OutlookManual,OutlookDirect,SMTP,MAPIManual,MAPIDirect,NotesManual';
        }
        field(76010; "SMTP Mail Server";
        Text[80])
        {
            Caption = 'SMTP Mail-server';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76011; "Mail Server Port"; Integer)
        {
            Caption = 'Mail-server port';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76012; "Mail Server User Name"; Text[30])
        {
            Caption = 'Mail-server brugernavn';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76013; "Mail Server Password"; Text[30])
        {
            Caption = 'Mail-server password';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76014; "Certificate File"; Text[250])
        {
            Caption = 'Certifikatfil';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76015; "Certificate Password"; Text[50])
        {
            Caption = 'Certifikatkodeord';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76031; "Sales Quote Report ID"; Integer)
        {
            Caption = 'Salgstilbud Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76032; "Sales Quote Report Caption"; Text[100])
        {
            Caption = 'Salgstilbud Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;           
        }
        field(76041; "Sales Order Report ID"; Integer)
        {
            Caption = 'Salgsordre Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76042; "Sales Order Report Caption"; Text[100])
        {
            Caption = 'Salgsordre Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;
        }
        field(76051; "Posted Sales Invoice Report ID"; Integer)
        {
            Caption = 'Bogf. Salgsfakt. Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76052; "Posted Sales Inv. Rep.  Capt."; Text[100])
        {
            Caption = 'Bogf. Salgsfakt. Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;
        }
        field(76061; "Posted Sales Shpm. Report ID"; Integer)
        {
            Caption = 'Bogf. salgslev. - Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76062; "Posted Sales  Shpm. Rep  Capt."; Text[100])
        {
            Caption = 'Bogf. salgslev. - Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;
        }
        field(76071; "Posted Sales Cr. Memo Rep. ID"; Integer)
        {
            Caption = 'Bogf. salgskr.nota Rapport-id';
            FieldClass = Normal;

            DataClassification = CustomerContent;
        }
        field(76072; "Posted Sales Cr. M. Rep.  Capt"; Text[100])
        {
            Caption = 'Bogf. salgskr.nota Rapp.navn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;
        }
        field(76131; "Purchase Quote Report ID"; Integer)
        {
            Caption = 'Købsrekvisition Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76132; "Purchase Quote Report Caption"; Text[100])
        {
            Caption = 'Købsrekvisition Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;
        }
        field(76141; "Purchase Order Report ID"; Integer)
        {
            Caption = 'Købsordre Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76142; "Purchase Order Report Caption"; Text[100])
        {
            Caption = 'Købsordre Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;

        }
        field(76201; "Customer Statement Report ID"; Integer)
        {
            Caption = 'Kontoudtog Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76202; "Customer Statement Rep.  Capt."; Text[100])
        {
            Caption = 'Kontoudtog Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;

        }
        field(76211; "Issued Reminder Report ID"; Integer)
        {
            Caption = 'Udstedt rykker Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76212; "Issued Reminder Report  Capt."; Text[100])
        {
            Caption = 'Udstedt rykker Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;

        }
        field(76221; "Issued Fin. Chrg. M. Report ID"; Integer)
        {
            Caption = 'Udstedt rentenota Rapport-id';
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(76222; "Issued Fin. Chrg. M  Rep  Capt"; Text[100])
        {
            Caption = 'Udstedt rentenota Rapportnavn';
            FieldClass = FlowField;
            //NAL-JHHCalcFormula = Missing;

        }
    }
}
