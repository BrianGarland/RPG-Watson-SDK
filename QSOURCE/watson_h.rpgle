**FREE

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
DCL-PR WatsonTranslate VARCHAR(10000);
    FromText VARCHAR(10000) CONST;
    FromLang CHAR(2) CONST;
    ToLang   CHAR(2) CONST;
END-PR;

