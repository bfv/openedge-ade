/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/
/* t-q-dan.p - Danish language definitions for Foresp�rgsel module */

{ prores/t-define.i }

DEFINE INPUT PARAMETER qbf-s AS INTEGER NO-UNDO.

IF qbf-s < 0 THEN RETURN.
qbf-lang = "".

IF qbf-s = 1 THEN
  ASSIGN
    qbf-lang[ 1] = 'Ingen record fundet benyttende kriteriet.'
    qbf-lang[ 2] = 'Alle data,Relaterede,Udvalgte data'
    qbf-lang[ 3] = 'Alle vist,Ved toppen,Ved slutningen'
    qbf-lang[ 4] = 'Der er ingen index defineret for denne fil.'
    qbf-lang[ 5] = 'Er du sikker p� du �nsker at slette denne record?'
    qbf-lang[ 6] = '' /* special total message: created from #7 or #8 */
    qbf-lang[ 7] = 'Total operationen stoppet.'
    qbf-lang[ 8] = 'Total antal records tilg�ngeligt '
    qbf-lang[ 9] = 'Total k�rer...   Tryk [' + KBLABEL("END-ERROR")
		 + '] for stop.'
    qbf-lang[10] = 'lig med,er mindre end,er mindre end eller lig med,'
		 + 'er st�rre end,er st�rre end eller lig med,'
		 + 'er forskellig fra,indeholder,begynder med'
    qbf-lang[11] = 'Der er ingen records tilg�ngelige.'
    qbf-lang[13] = 'Du er allerede p� den f�rste record i filen.'
    qbf-lang[14] = 'Du er allerede p� den sidste record i filen.'
    qbf-lang[15] = 'Der er aktuelt ingen foresp�rgsels sk�rme defineret.'
    qbf-lang[16] = 'Foresp�rgsel'
    qbf-lang[17] = 'V�lg navnet p� den Foresp�rgsels sk�rm der skal benyttes.'
    qbf-lang[18] = 'Tryk [' + KBLABEL("GO")
		 + '] eller [' + KBLABEL("RETURN")
		 + '] for udv�lg sk�rm, eller [' + KBLABEL("END-ERROR")
		 + '] for afslut.'
    qbf-lang[19] = 'L�ser foresp�rgsels sk�rm...'
    qbf-lang[20] = 'Den kompilerede foresp�rgsels sk�rm til denne procedure mangler.  '
		 + 'Problemet kan v�re:^1) ukorrekt PROPATH,^2) manglende '
		 + 'foresp�rgsel .r fil, eller^3) ukompileret .r fil.^(Kontroller '
		 + '<dbnavn>.ql filen for kompilerings fejlmeddelelser).^^Du '
		 + 'kan fors�ge at forts�tte, men det kan give yderligere fejl meddelelser. '
		 + '�nsker du at forts�tte?'
    qbf-lang[21] = 'Der er en WHERE betingelse i den aktuelle foresp�rgsel der '
		 + 'benytter v�rdier spurgt efter p� RUN-TIME tidspunktet.  Dette '
		 + 'er ikke supporteret i Foresp�rgsels modulet.  Ignorer WHERE '
		 + 'betingelsen og forts�t?'
    qbf-lang[22] = 'Tryk [' + KBLABEL("GET")
		 + '] for at ops�tte andre liste felter.'.

ELSE

IF qbf-s = 2 THEN
  ASSIGN
    qbf-lang[ 1] = 'N�ste,N�ste record.'
    qbf-lang[ 2] = 'Forrige,Forrige record.'
    qbf-lang[ 3] = 'F�rste,F�rste record.'
    qbf-lang[ 4] = 'Sidste,Sidste record.'
    qbf-lang[ 5] = 'Inds�t,Inds�t en ny record.'
    qbf-lang[ 6] = 'Opdater,Opdater den nu viste record.'
    qbf-lang[ 7] = 'Kopi,Kopi af den nu viste record til en ny.'
    qbf-lang[ 8] = 'Blank,Slet den nu viste record.'
    qbf-lang[ 9] = 'Vis,Vis en anden Foresp�rgsel sk�rm.'
    qbf-lang[10] = 'List,List gennem en liste af record.'
    qbf-lang[11] = 'Relation,Relation til sammenk�det fil.'
    qbf-lang[12] = 'QBE,Query by Example udv�lgelse af record.'
    qbf-lang[13] = 'Udv�lg,Udv�lgelse betingelses editor udv�lgelse af record.'
    qbf-lang[14] = 'Total,Antal af record i den aktuelle m�ngde eller delm�ngde.'
    qbf-lang[15] = 'R�kkef�lge,Skift til et andet index.'
    qbf-lang[16] = 'Modul,Skift til et anden modul.'
    qbf-lang[17] = 'Info,Information om aktuelle ops�tning.'
    qbf-lang[18] = 'Extern,Skift til det externe bruger specifikke modul.'
    qbf-lang[19] = 'Afslut,Afslut.'
    qbf-lang[20] = ''. /* terminator */

RETURN.
