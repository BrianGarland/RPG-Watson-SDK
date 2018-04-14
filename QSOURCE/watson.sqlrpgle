**FREE



// Compile parameters
CTL-OPT NOMAIN;



//------------------------------------------------------------------------------
// Procedure
//     WatsonTranslate
//
// Description
//     Translate between two languages using IBM Watson
//
// Parameters
//     FromText - text to be translated
//     FromLang - 2-character language code for from language
//     ToLang   - 2-character language code for translated text
//
// Return Value
//     Translated text
//
//------------------------------------------------------------------------------
DCL-PROC WatsonTranslate EXPORT;
    DCL-PI *N VARCHAR(10000);
        FromText VARCHAR(10000) CONST;
        FromLang CHAR(2) CONST;
        ToLang   CHAR(2) CONST;
    END-PI;

    DCL-C Languages 'enesfritpt';

    DCL-S WorkString VARCHAR(10000);
    DCL-S ReturnString VARCHAR(10000);
    DCL-S TextBack SQLType(CLOB:10000);


    IF FromLang = ToLang;
        RETURN FromText;
    ENDIF;

    EXEC SQL VALUES TRIM(systools.urlencode(:FromText,'')) INTO :WorkString;

    WorkString = 'https://watson-api-explorer.mybluemix.net/'
               + 'language-translator/api/v2/translate?model_id='
               + FromLang + '-' + ToLang + '&text=' + WorkString;

    EXEC SQL VALUES CHAR(systools.httpgetclob(:WorkString,''),10000) INTO :TextBack;

    IF (TextBack_Len > 0);
        ReturnString = %SUBST(TextBack_Data:1:TextBack_Len);
    endIf;

    RETURN %TRIMR(ReturnString);

END-PROC;

