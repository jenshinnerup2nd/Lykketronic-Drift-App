codeunit 50008 DynFindAndUpdatePos30
{
    // î
    trigger OnRun()
    begin
        IF SearchNonWindowsText() = true THEN
            EXIT;


    end;

    procedure SearchNonWindowsText(): Boolean;
    var
        ProdOrderLine: Record "Prod. Order Line";
        ProdBOMLine: Record "Production BOM Line";
        ProdComp: Record "Prod. Order Component";
        NonWindowsTextFound: Boolean;
    begin
        NonWindowsTextFound := false;
        if ProdBOMLine.FindSet() then begin
            repeat
                if (ProdBOMLine.Pos30 <> '') then begin
                    CheckAndUpdatePos30(ProdBOMLine);
                end;
            until ProdBOMLine.Next() = 0;
        end;


        If ProdComp.FindSet() then begin
            repeat
                if (ProdComp.pos30 <> '') then begin
                    CheckAndUpdatePos30Comp(ProdComp);
                end;
            until ProdComp.Next() = 0;
        end;
        exit(NonWindowsTextFound);
    end;

    procedure IsWindowsText(Text: Text): Boolean;
    var
        i: Integer;
    begin
        for i := 1 to StrLen(Text) do
            if Text[i] < ' ' then
                exit(false);
        exit(true);
    end;

    procedure CheckAndUpdatePos30(var ProdBOMLine: Record "Production BOM Line");
    var
        Text: Text[30];
        i: Integer;
        Char: Char;
        ToString: Text;
        Str: Char;
    begin
        Text := ProdBOMLine.Pos30;
        Text := ConvertStr(text, 'î', 'Ø');
        Text := ConvertStr(text, '', 'Å');
        Text := ConvertStr(text, '’', 'Æ');
        ProdBOMLine.Pos30 := Text;
        ProdBOMLine.Modify();
    end;

    procedure CheckAndUpdatePos30Comp(var Line: Record "Prod. Order Component");
    var
        Text: Text[30];
        i: Integer;
        Char: Char;
        ToString: Text;
        Str: Char;
    begin
        Text := Line.Pos30;
        Text := ConvertStr(text, 'î', 'Ø');
        Text := ConvertStr(text, '', 'Å');
        Text := ConvertStr(text, '’', 'Æ');
        Line.Pos30 := Text;
        Line.Modify();
    end;


}
