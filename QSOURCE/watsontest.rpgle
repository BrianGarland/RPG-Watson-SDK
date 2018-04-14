**FREE

CTL-OPT BNDDIR('WATSON') ACTGRP(*NEW);

/INCLUDE watson_h.rpgle

DCL-C Language1 CONST('en');
DCL-C Language2 CONST('es');

DCL-S Text1 VARCHAR(10000) INZ('Hello world.  One, Two, Three.');
DCL-S Text2 VARCHAR(10000);
DCL-S Text3 VARCHAR(10000);

*INLR = *ON;

Text2 = WatsonTranslate(Text1:Language1:Language2);

Text3 = WatsonTranslate(Text2:Language2:Language1);

IF Text1 = Text3;

ENDIF;

RETURN;
