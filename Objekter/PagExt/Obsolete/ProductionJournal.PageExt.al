PageExtension 73019 pageextension73019 extends "Production Journal"
{



    //Unsupported feature: Code Modification on "Setup(PROCEDURE 2)".

    //procedure Setup();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ToTemplateName := TemplateName;
    ToBatchName := BatchName;
    ProdOrder := ProductionOrder;
    ProdOrderLineNo := ProdLineNo;
    PostingDate := PostDate;
    xPostingDate := PostingDate;

    FlushingFilter := FlushingFilter::Manual;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    "Production Journal"
    //Dynalogic - JHH - 2018 - Sætter til alle metoder
    //FlushingFilter := FlushingFilter::Manual;
    FlushingFilter := FlushingFilter::"All Methods";
    */
    //end;
    //Unsupported feature: Code Modification on "SetFlushingFilter(PROCEDURE 8)".
    //procedure SetFlushingFilter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF FlushingFilter <> FlushingFilter::"All Methods" THEN
      SETRANGE("Flushing Method",FlushingFilter)
    ELSE
      SETRANGE("Flushing Method");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //Dynalogic - jhh - 2018 , sætter altid til alle metoder

    #1..4



    */
    //end;
}

