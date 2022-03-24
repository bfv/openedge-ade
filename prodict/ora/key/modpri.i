/*********************************************************************
* Copyright (C) 2011 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/

/*----------------------------------------------------------------------------

File: modpri.i

Description:   
   This file contains the form for modification of Primary Constraints.

HISTORY
Author: Kumar Mayur

Date Created:08/05/2011
----------------------------------------------------------------------------*/
{prodict/ora/key/modcons.i }

/* Query definitions                                                    */
DEFINE {1} QUERY BROWSE-PRIMARY FOR 
      temp SCROLLING.
      
            /* Browse definitions                                                   */
DEFINE {1} BROWSE BROWSE-PRIMARY
  QUERY BROWSE-PRIMARY NO-LOCK DISPLAY
      temp.ind FORMAT "x(20)":U
      temp.pri FORMAT "x(12)":U
      temp.uni FORMAT "x(12)":U
      temp.man FORMAT "x(15)":U
  WITH NO-ROW-MARKERS SEPARATORS
    &IF "{&WINDOW-SYSTEM}" <> "TTY"
    &THEN SIZE 75 BY 4.52 FIT-LAST-COLUMN.
    &ELSE SIZE 75 BY 8.3 FIT-LAST-COLUMN.
    &ENDIF 

/*    DEFINATION FOR PRIAMRY FRAME  */    
&Scoped-define FRAME-NAME frame_primary 
  
&Scoped-define BROWSE-NAME BROWSE-PRIMARY
&Scoped-define FIELDS-IN-QUERY-BROWSE-PRIMARY temp.pri temp.uni temp.ind  temp.man
&Scoped-define ENABLED-FIELDS-IN-QUERY-BROWSE-PRIMARY 
&Scoped-define QUERY-STRING-BROWSE-PRIMARY FOR EACH temp NO-LOCK.     
&Scoped-define OPEN-QUERY-BROWSE-PRIMARY OPEN QUERY BROWSE-PRIMARY FOR EACH temp NO-LOCK.
&Scoped-define TABLES-IN-QUERY-BROWSE-PRIMARY temp
&Scoped-define FIRST-TABLE-IN-QUERY-BROWSE-PRIMARY temp    

        DEF VAR pintSub AS INTEGER NO-UNDO.
        DEFINE VARIABLE pQuery AS HANDLE.
        DEFINE VARIABLE pBrowse AS HANDLE.
        DEFINE VARIABLE pBuffer AS HANDLE.
        DEFINE VARIABLE pField AS HANDLE.
        DEFINE VARIABLE pField1 AS HANDLE.
        DEFINE VARIABLE pField2 AS HANDLE.
        DEFINE VARIABLE pField3 AS HANDLE.
        DEFINE VARIABLE pField4 AS HANDLE.
        DEFINE VARIABLE pField5 AS HANDLE.
                
        pBrowse = BROWSE BROWSE-PRIMARY:HANDLE. 
        pQuery  = pBrowse:QUERY.
        pBuffer = pQuery:GET-BUFFER-HANDLE(1).

FORM
     &IF "{&WINDOW-SYSTEM}" <> "TTY"
     &THEN 
     name AT ROW 1.46 COL 17 COLON-ALIGNED WIDGET-ID 4
     BROWSE-PRIMARY AT ROW 3.36 COL 76 RIGHT-ALIGNED WIDGET-ID 200
     Active AT ROW 8.6 COL 2 WIDGET-ID 40
     DESC_EDIT2 AT ROW 10 COL 14 WIDGET-ID 36 NO-LABEL
     msg AT ROW 12.1 COL 2 WIDGET-ID 4 NO-LABEL
     OK_BUT AT ROW 13.3 COL 3
     CREATE_BUT AT ROW 13.3 COL 17
     CANCEL_BUT AT ROW 13.3 COL 31
     HELP_BUT  AT ROW 13.3 COL 60
     "Description:" VIEW-AS TEXT
          SIZE 11 BY .62 AT ROW 10.2 COL 2 WIDGET-ID 38
     "I  - Indicates Progress Index Property" VIEW-AS TEXT
          SIZE 50 BY .62 AT ROW 14.5 COL 2 WIDGET-ID 600
     "C - Indicates Constraint Property" VIEW-AS TEXT
          SIZE 50 BY .62 AT ROW 15.3 COL 2 WIDGET-ID 600
     WITH FRAME frame_primary
         NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 2.4
         SIZE 80 BY 16  WIDGET-ID 100.     
    &ELSE
     name AT ROW 2 COL 17 COLON-ALIGNED WIDGET-ID 4
     BROWSE-PRIMARY AT ROW 3.76 COL 76 RIGHT-ALIGNED WIDGET-ID 200
     Active AT ROW 13 COL 2 WIDGET-ID 40
     DESC_EDIT2 AT ROW 15 COL 2 WIDGET-ID 36
     OK_BUT AT ROW 20 COL 18 WIDGET-ID 26
     CREATE_BUT AT ROW 20 COL 35 WIDGET-ID 28
     CANCEL_BUT AT ROW 20 COL 52 WIDGET-ID 30
 
     WITH FRAME frame_primary
         NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 3
         SIZE 79 BY 21  WIDGET-ID 100.
    &ENDIF              
                      
 ASSIGN  BROWSE-PRIMARY:COLUMN-RESIZABLE IN FRAME frame_primary        = TRUE.         


ON CHOOSE OF OK_BUT IN FRAME frame_primary
  DO:  
         RUN primary_save.
         APPLY "CLOSE":U TO THIS-PROCEDURE.
         RETURN NO-APPLY.      
  END.

ON CHOOSE OF CREATE_BUT IN FRAME frame_primary
 DO:
         RUN primary_save.
         RUN TEMP1.
         RUN primary.
         &IF "{&WINDOW-SYSTEM}" <> "TTY"  &THEN
         ASSIGN msg:SCREEN-VALUE ="Constraint Modified".  &ENDIF 
 END. 
 
 
ON CHOOSE OF CANCEL_BUT IN FRAME frame_primary
 DO:     
           APPLY "CLOSE":U TO THIS-PROCEDURE.
           RETURN NO-APPLY.      
 END. 

ON VALUE-CHANGED OF Active IN FRAME frame_primary
DO:
   IF active:screen-value in frame frame_primary eq "yes" THEN DO:
     FIND DICTDB._INDEX of DICTDB._constraint NO-LOCK.
     FOR EACH DICTDB._INDEX-Field of DICTDB._INDEX NO-LOCK:
       FIND DICTDB._Field WHERE RECID(DICTDB._Field) = DICTDB._Index-field._Field-recid NO-LOCK.
       IF NOT DICTDB._Field._mandatory THEN DO:
          MESSAGE "This Primary Constraint cannot be activated. It has a non-mandatory field " +
                     TRIM(DICTDB._Field._field-name) "." VIEW-AS ALERT-BOX ERROR BUTTONS OK.
         /* set active attribute back to its current value */
         active:SCREEN-VALUE IN FRAME frame_primary = "no".
         RETURN NO-APPLY.
       END.
     END.
   END.
 END.

ON ENTRY OF DESC_EDIT2 IN FRAME frame_primary
 DO:
  &IF "{&WINDOW-SYSTEM}" <> "TTY"  &THEN
  ASSIGN msg:SCREEN-VALUE IN FRAME frame_primary ="". 
  &ENDIF
END.

PROCEDURE primary :
           &Scoped-define OPEN-BROWSERS-IN-QUERY-frame_primary ~
           ~{&OPEN-QUERY-BROWSE-PRIMARY}
           
           HIDE FRAME frame_foreign.   
           HIDE FRAME frame_unique.     
           HIDE FRAME frame_check.     
           VIEW FRAME frame_primary.
           DISPLAY  name BROWSE-PRIMARY Active DESC_EDIT2 
               &IF "{&WINDOW-SYSTEM}" <> "TTY"  &THEN msg &ENDIF           
                   WITH FRAME frame_primary.
           ASSIGN name:SCREEN-VALUE IN FRAME frame_primary =  constr_name.
           IF act = "t" THEN Active:SCREEN-VALUE IN FRAME frame_primary ="yes".
           ASSIGN DESC_EDIT2:SCREEN-VALUE IN FRAME frame_primary = descrip.
           IF user_dbtype    NE "oracle" then           
               ENABLE  BROWSE-PRIMARY Active DESC_EDIT2 
                 OK_BUT CREATE_BUT CANCEL_BUT 
                 &IF "{&WINDOW-SYSTEM}" <> "TTY"
                 &THEN HELP_BUT  
                 &ENDIF   
                  WITH FRAME frame_primary.
           ELSE
               ENABLE  BROWSE-PRIMARY DESC_EDIT2 
                 OK_BUT CREATE_BUT CANCEL_BUT 
                 &IF "{&WINDOW-SYSTEM}" <> "TTY"
                 &THEN HELP_BUT  
                 &ENDIF   
                  WITH FRAME frame_primary.

          {&OPEN-BROWSERS-IN-QUERY-frame_primary}
          FIND FIRST  DICTDB._constraint where _con-name = constr_name AND DICTDB._Constraint._Db-Recid = DbRecid  NO-LOCK NO-ERROR.
          FOR EACH temp WHERE rec = _constraint._index-recid NO-LOCK:
             curr-rec = ROWID(temp).
             REPOSITION BROWSE-PRIMARY TO ROWID curr-rec.
          END.
END PROCEDURE.

PROCEDURE primary_save:
           FOR EACH _constraint where _con-name = constr_name AND DICTDB._constraint._Db-Recid = DbRecid:
             IF ACTIVE:SCREEN-VALUE IN FRAME frame_primary = "yes" THEN
             ASSIGN _Con-Active = TRUE.
             ELSE ASSIGN _Con-Active = FALSE. 
             ASSIGN _Con-Desc = DESC_EDIT2:SCREEN-VALUE IN FRAME frame_primary. 
             ASSIGN _Con-Status = "C".                    
           END.  
END PROCEDURE.           
