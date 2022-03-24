&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME CURRENT-WINDOW
&Scoped-define FRAME-NAME QueryTablefrmAttributes
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS QueryTablefrmAttributes 
/* Copyright (C) 2005-2007 by Progress Software Corporation. All rights
   reserved. Prior versions of this work may contain portions
   contributed by participants of Possenet. */
/*------------------------------------------------------------------------
  File: adeuib/_dynamiclookupd.w 
  Description: Instance Attributes Dialog for Astra2 Dynamic Lookups.
  Input Parameters:
     p_hSMO -- Procedure Handle of calling SmartObject.
  Output Parameters:
      <none>
     Modifed:  08/28/2001       Mark Davies (MIP)
               The Dynamic Lookup and Combo's Base Query String editor 
               concatenates the whole query string and thus causes the 
               string to be invalid. Make sure that when enter was pressed 
               that spaces are left in its place.
    Modified: 09/25/2001         Mark Davies (MIP)
              1. Allow detaching of lookup from template if properties
                 were changed.
              2. Remove references to KeyFieldValue and SavedScreenValue
              3. Reposition Product and Product module combos to template
                 lookup or lookup smartobject.
              4. Grey-out object description when disabled.
              5. Default tooltip to 'Press F4 For Lookup' if left empty.
    Modified: 10/01/2001        Mark Davies (MIP)
              Resized the dialog to fit in 800x600
    Modified: 10/22/2001        Mark Davies (MIP)
              The displayed field data type and format and the key field
              data type and format attribute values were incorrectly
              written to the database.
    Modified: 01/16/2002        Mark Davies (MIP)
              Fixed issue #3683 - Data is lost have it has been saved when 
              dismissing a window
    Modified: 03/15/2002        Mark Davies (MIP)
              Added custom super procedure support for Dynamic Lookups
              Fix for issue #3420 - Dynamic Lookups (and Combos) should 
              have "CustomSuperProc" properties, and should launch this 
              procedure.
    Modified: 06/21/2002        Mark Davies (MIP)
              Made changes to comply with V2 Repository changes.
------------------------------------------------------------------------*/
/*          This .W file was created with the Progress UIB.             */
/*----------------------------------------------------------------------*/
/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

DEFINE INPUT PARAMETER p_hSMO                   AS HANDLE     NO-UNDO.

{src/adm2/globals.i}

DEFINE VARIABLE ghSDFMaintWindow AS HANDLE     NO-UNDO.
DEFINE VARIABLE ghChooseWindow   AS HANDLE     NO-UNDO.
DEFINE VARIABLE gdRow            AS DECIMAL    NO-UNDO.
DEFINE VARIABLE gdColumn         AS DECIMAL    NO-UNDO.
DEFINE VARIABLE gdHeight         AS DECIMAL    NO-UNDO.
DEFINE VARIABLE gdWidth          AS DECIMAL    NO-UNDO.
DEFINE VARIABLE ghFrame          AS HANDLE     NO-UNDO.
DEFINE VARIABLE ghAppBuilder     AS HANDLE     NO-UNDO.
DEFINE VARIABLE glClosing        AS LOGICAL    NO-UNDO.

{adeuib/sharvars.i}  /* Shared variables of the AppBuilder */
{adeuib/uniwidg.i}   /* Temp-tables of the AppBuilder       */

 /* Stores a delimited string of all window handles of the session */
DEFINE VARIABLE gcWindowHandles AS CHARACTER  NO-UNDO.
/* Stores a delimited string indicating whether the window was sensitive or not corresponding 
   to the gcWindowHandles string */
DEFINE VARIABLE gcWindowState   AS CHARACTER  NO-UNDO.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE DIALOG-BOX
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME QueryTablefrmAttributes

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME


/* ************************  Function Prototypes ********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD closeObject QueryTablefrmAttributes 
FUNCTION closeObject RETURNS LOGICAL
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD getObjectClosing QueryTablefrmAttributes 
FUNCTION getObjectClosing RETURNS LOGICAL
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD getSDFType QueryTablefrmAttributes 
FUNCTION getSDFType RETURNS CHARACTER
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD getViewerType QueryTablefrmAttributes 
FUNCTION getViewerType RETURNS CHARACTER
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD isOnLocalField QueryTablefrmAttributes 
FUNCTION isOnLocalField RETURNS LOGICAL
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* ***********************  Control Definitions  ********************** */

/* Define a dialog box                                                  */

/* ************************  Frame Definitions  *********************** */

DEFINE FRAME QueryTablefrmAttributes
     SPACE(35.69) SKIP(1.77)
    WITH VIEW-AS DIALOG-BOX KEEP-TAB-ORDER 
         SIDE-LABELS NO-UNDERLINE THREE-D  SCROLLABLE 
         TITLE "Dynamic Lookup Properties":L.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: DIALOG-BOX
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR DIALOG-BOX QueryTablefrmAttributes
   FRAME-NAME Custom                                                    */
ASSIGN 
       FRAME QueryTablefrmAttributes:SCROLLABLE       = FALSE
       FRAME QueryTablefrmAttributes:HIDDEN           = TRUE.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK DIALOG-BOX QueryTablefrmAttributes
/* Query rebuild information for DIALOG-BOX QueryTablefrmAttributes
     _Options          = "SHARE-LOCK"
     _Query            is NOT OPENED
*/  /* DIALOG-BOX QueryTablefrmAttributes */
&ANALYZE-RESUME

 


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK QueryTablefrmAttributes 


/* **************** Standard Buttons and Help Setup ******************* */

/* Parent the dialog-box to the ACTIVE-WINDOW, if there is no parent.   */
IF VALID-HANDLE(ACTIVE-WINDOW) AND FRAME {&FRAME-NAME}:PARENT eq ?
THEN FRAME {&FRAME-NAME}:PARENT = ACTIVE-WINDOW.

/* ***************************  Main Block  *************************** */

IF VALID-HANDLE(_h_win) THEN
  _h_win:SENSITIVE = FALSE.

RUN setModal (SESSION, YES).

/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
   ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK:
  RUN adecomm/_setcurs.p ("GENERAL":U).  
  
  ASSIGN gdColumn = ?
         gdRow    = ?
         gdHeight = ?
         gdWidth  = ?.
  IF DYNAMIC-FUNCTION('getBaseQueryString':U IN p_hSMO) = "":U THEN
    RUN chooseExisting.
  ELSE
    RUN sdfMaintWindow (INPUT ?).

  /* Set the cursor */
  RUN adecomm/_setcurs.p ("":U).  
  WAIT-FOR CLOSE OF THIS-PROCEDURE. 
END.
glClosing = TRUE.
RUN setModal (SESSION,NO).
DYNAMIC-FUNCTION('shutdown-sdo':U IN _h_func_lib,THIS-PROCEDURE).

IF VALID-HANDLE(ghChooseWindow) THEN DO:
  RUN destroyObject IN ghChooseWindow.
  ghChooseWindow = ?.
END.

/* 
IF VALID-HANDLE(ghAppBuilder) THEN
  ghAppBuilder:SENSITIVE = TRUE.
*/

RUN disable_UI.

IF VALID-HANDLE(_h_win) THEN
  _h_win:SENSITIVE = TRUE. 

/* This will ensure that the Label is viewed */
RUN initializeObject IN p_hSMO.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE chooseExisting QueryTablefrmAttributes 
PROCEDURE chooseExisting :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE VARIABLE lMultiInstance          AS LOGICAL    NO-UNDO.
  DEFINE VARIABLE cChildDataKey           AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE cRunAttribute           AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE hContainerWindow        AS HANDLE     NO-UNDO.
  DEFINE VARIABLE hContainerSource        AS HANDLE     NO-UNDO.
  DEFINE VARIABLE hObject                 AS HANDLE     NO-UNDO.
  DEFINE VARIABLE cRunContainerType       AS CHARACTER  NO-UNDO.

  ASSIGN
    lMultiInstance    = NO
    cChildDataKey     = "":U
    cRunAttribute     = STRING(THIS-PROCEDURE)
    hContainerWindow  = ?
    hContainerSource  = ?
    hObject           = ?
    hContainerWindow  = ?
    cRunContainerType = "":U
    .
  IF VALID-HANDLE(gshSessionManager)
  THEN DO:
                                 
    RUN clearClientCache IN gshRepositoryManager.
    RUN launchContainer IN gshSessionManager 
                        (INPUT  "rysdfchsew"        /* object filename if physical/logical names unknown */
                        ,INPUT  "":U                 /* physical object name (with path and extension) if known */
                        ,INPUT  ""                   /* logical object name if applicable and known */
                        ,INPUT  (NOT lMultiInstance) /* run once only flag YES/NO */
                        ,INPUT  "":U                 /* instance attributes to pass to container */
                        ,INPUT  cChildDataKey        /* child data key if applicable */
                        ,INPUT  cRunAttribute        /* run attribute if required to post into container run */
                        ,INPUT  "":U                 /* container mode, e.g. modify, view, add or copy */
                        ,INPUT  hContainerWindow     /* parent (caller) window handle if known (container window handle) */
                        ,INPUT  hContainerSource     /* parent (caller) procedure handle if known (container procedure handle) */
                        ,INPUT  hObject              /* parent (caller) object handle if known (handle at end of toolbar link, e.g. browser) */
                        ,OUTPUT ghChooseWindow       /* procedure handle of object run/running */
                        ,OUTPUT cRunContainerType    /* procedure type (e.g ADM1, Astra1, ADM2, ICF, "") */
                        ).
  END.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI QueryTablefrmAttributes  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Hide all frames. */
  HIDE FRAME QueryTablefrmAttributes.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE populateSDFData QueryTablefrmAttributes 
PROCEDURE populateSDFData :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT-OUTPUT PARAMETER phDataTable AS HANDLE     NO-UNDO.
  
  DEFINE VARIABLE lOk    AS LOGICAL    NO-UNDO.
  DEFINE VARIABLE hFrame AS HANDLE     NO-UNDO.
  
  IF NOT VALID-HANDLE(p_hSMO) THEN RETURN.
  
  ASSIGN hFrame  = DYNAMIC-FUNCTION("getContainerHandle":U   IN p_hSMO)
         gdColumn = hFrame:COL
         gdRow    = hFrame:ROW
         gdHeight = hFrame:HEIGHT
         gdWidth  = hFrame:WIDTH.
  
  phDataTable:FIND-FIRST().
  
  ASSIGN phDataTable:BUFFER-FIELD("cActualField":U):BUFFER-VALUE                 = DYNAMIC-FUNCTION('getFieldName':U                   IN p_hSMO)
         phDataTable:BUFFER-FIELD("cSDFFileName":U):BUFFER-VALUE                 = DYNAMIC-FUNCTION('getSDFFileName':U                 IN p_hSMO) 
         phDataTable:BUFFER-FIELD("cSDFTemplate":U):BUFFER-VALUE                 = DYNAMIC-FUNCTION('getSDFTemplate':U                 IN p_hSMO) 
         phDataTable:BUFFER-FIELD("cCustomSuperProc":U):BUFFER-VALUE             = DYNAMIC-FUNCTION('getCustomSuperProc':U             IN p_hSMO) 
         phDataTable:BUFFER-FIELD("cBaseQueryString":U):BUFFER-VALUE             = DYNAMIC-FUNCTION('getBaseQueryString':U             IN p_hSMO) 
         phDataTable:BUFFER-FIELD('cQueryTables':U):BUFFER-VALUE                 = DYNAMIC-FUNCTION('getQueryTables':U                 IN p_hSMO) 
         phDataTable:BUFFER-FIELD("cBrowseFields":U):BUFFER-VALUE                = DYNAMIC-FUNCTION('getBrowseFields':U                IN p_hSMO) 
         phDataTable:BUFFER-FIELD("cBrowseFieldDataTypes":U):BUFFER-VALUE        = DYNAMIC-FUNCTION('getBrowseFieldDataTypes':U        IN p_hSMO) 
         phDataTable:BUFFER-FIELD("cBrowseFieldFormats":U):BUFFER-VALUE          = DYNAMIC-FUNCTION('getBrowseFieldFormats':U          IN p_hSMO) 
         phDataTable:BUFFER-FIELD("cViewerLinkedFields":U):BUFFER-VALUE          = DYNAMIC-FUNCTION('getViewerLinkedFields':U          IN p_hSMO) 
         phDataTable:BUFFER-FIELD("cViewerLinkedWidgets":U):BUFFER-VALUE         = DYNAMIC-FUNCTION('getViewerLinkedWidgets':U         IN p_hSMO) 
         phDataTable:BUFFER-FIELD("cLinkedFieldDataTypes":U):BUFFER-VALUE        = DYNAMIC-FUNCTION('getLinkedFieldDataTypes':U        IN p_hSMO)
         phDataTable:BUFFER-FIELD("cLinkedFieldFormats":U):BUFFER-VALUE          = DYNAMIC-FUNCTION('getLinkedFieldFormats':U          IN p_hSMO)
         phDataTable:BUFFER-FIELD("cColumnLabels":U):BUFFER-VALUE                = DYNAMIC-FUNCTION('getColumnLabels':U                IN p_hSMO) 
         phDataTable:BUFFER-FIELD("cColumnFormat":U):BUFFER-VALUE                = DYNAMIC-FUNCTION('getColumnFormat':U                IN p_hSMO) 
         phDataTable:BUFFER-FIELD('cKeyField':U):BUFFER-VALUE                    = DYNAMIC-FUNCTION('getKeyField':U                    IN p_hSMO)
         phDataTable:BUFFER-FIELD("cKeyFormat":U):BUFFER-VALUE                   = DYNAMIC-FUNCTION('getKeyFormat':U                   IN p_hSMO)
         phDataTable:BUFFER-FIELD('cKeyDataType':U):BUFFER-VALUE                 = DYNAMIC-FUNCTION('getKeyDataType':U                 IN p_hSMO)
         phDataTable:BUFFER-FIELD('cDisplayedField':U):BUFFER-VALUE              = DYNAMIC-FUNCTION('getDisplayedField':U              IN p_hSMO)
         phDataTable:BUFFER-FIELD("cDisplayDataType":U):BUFFER-VALUE             = DYNAMIC-FUNCTION('getDisplayDataType':U             IN p_hSMO)
         phDataTable:BUFFER-FIELD('cDisplayFormat':U):BUFFER-VALUE               = DYNAMIC-FUNCTION('getDisplayFormat':U               IN p_hSMO)
         phDataTable:BUFFER-FIELD('cFieldLabel':U):BUFFER-VALUE                  = DYNAMIC-FUNCTION('getFieldLabel':U                  IN p_hSMO)
         phDataTable:BUFFER-FIELD('cFieldTooltip':U):BUFFER-VALUE                = DYNAMIC-FUNCTION('getFieldTooltip':U                IN p_hSMO)
         phDataTable:BUFFER-FIELD('cBrowseTitle':U):BUFFER-VALUE                 = DYNAMIC-FUNCTION('getBrowseTitle':U                 IN p_hSMO)
         phDataTable:BUFFER-FIELD('iRowsToBatch':U):BUFFER-VALUE                 = DYNAMIC-FUNCTION('getRowsToBatch':U                 IN p_hSMO)
         phDataTable:BUFFER-FIELD('cParentFilterQuery':U):BUFFER-VALUE           = DYNAMIC-FUNCTION('getParentFilterQuery':U           IN p_hSMO)
         phDataTable:BUFFER-FIELD('cParentField':U):BUFFER-VALUE                 = DYNAMIC-FUNCTION('getParentField':U                 IN p_hSMO)
         phDataTable:BUFFER-FIELD('cMaintenanceObject':U):BUFFER-VALUE           = DYNAMIC-FUNCTION('getMaintenanceObject':U           IN p_hSMO)
         phDataTable:BUFFER-FIELD('cMaintenanceSDO':U):BUFFER-VALUE              = DYNAMIC-FUNCTION('getMaintenanceSDO':U              IN p_hSMO)
         phDataTable:BUFFER-FIELD('cPhysicalTableNames':U):BUFFER-VALUE          = DYNAMIC-FUNCTION('getPhysicalTableNames':U          IN p_hSMO)
         phDataTable:BUFFER-FIELD('cTempTables':U):BUFFER-VALUE                  = DYNAMIC-FUNCTION('getTempTables':U                  IN p_hSMO)
         phDataTable:BUFFER-FIELD('cQueryBuilderJoinCode':U):BUFFER-VALUE        = DYNAMIC-FUNCTION('getQueryBuilderJoinCode':U        IN p_hSMO)
         phDataTable:BUFFER-FIELD('cQueryBuilderOptionList':U):BUFFER-VALUE      = DYNAMIC-FUNCTION('getQueryBuilderOptionList':U      IN p_hSMO)
         phDataTable:BUFFER-FIELD('cQueryBuilderTableOptionList':U):BUFFER-VALUE = DYNAMIC-FUNCTION('getQueryBuilderTableOptionList':U IN p_hSMO)
         phDataTable:BUFFER-FIELD('cQueryBuilderOrderList':U):BUFFER-VALUE       = DYNAMIC-FUNCTION('getQueryBuilderOrderList':U       IN p_hSMO)
         phDataTable:BUFFER-FIELD('cQueryBuilderTuneOptions':U):BUFFER-VALUE     = DYNAMIC-FUNCTION('getQueryBuilderTuneOptions':U     IN p_hSMO)
         phDataTable:BUFFER-FIELD('cQueryBuilderWhereClauses':U):BUFFER-VALUE    = DYNAMIC-FUNCTION('getQueryBuilderWhereClauses':U    IN p_hSMO)
         phDataTable:BUFFER-FIELD('lPopupOnAmbiguous':U):BUFFER-VALUE            = DYNAMIC-FUNCTION('getPopupOnAmbiguous':U            IN p_hSMO)
         phDataTable:BUFFER-FIELD('lPopupOnUniqueAmbiguous':U):BUFFER-VALUE      = DYNAMIC-FUNCTION('getPopupOnUniqueAmbiguous':U      IN p_hSMO)
         phDataTable:BUFFER-FIELD('lPopupOnNotAvail':U):BUFFER-VALUE             = DYNAMIC-FUNCTION('getPopupOnNotAvail':U             IN p_hSMO)
         phDataTable:BUFFER-FIELD('lBlankOnNotAvail':U):BUFFER-VALUE             = DYNAMIC-FUNCTION('getBlankOnNotAvail':U             IN p_hSMO)
         phDataTable:BUFFER-FIELD('lEnableField':U):BUFFER-VALUE                 = DYNAMIC-FUNCTION('getEnableField':U                 IN p_hSMO)
         phDataTable:BUFFER-FIELD('lDisplayField':U):BUFFER-VALUE                = DYNAMIC-FUNCTION('getDisplayField':U                IN p_hSMO)
         phDataTable:BUFFER-FIELD('dFieldWidth':U):BUFFER-VALUE                  = hFrame:WIDTH
         phDataTable:BUFFER-FIELD('lLocalField':U):BUFFER-VALUE                  = DYNAMIC-FUNCTION('getLocalField':U                  IN p_hSMO)
         phDataTable:BUFFER-FIELD('cMappedFields':U):BUFFER-VALUE                = DYNAMIC-FUNCTION('getMappedFields':U                IN p_hSMO)
         phDataTable:BUFFER-FIELD('lUseCache':U):BUFFER-VALUE                    = DYNAMIC-FUNCTION('getUseCache':U                    IN p_hSMO)
         .
  IF phDataTable:BUFFER-FIELD("cCustomSuperProc":U):BUFFER-VALUE = "":U THEN
    phDataTable:BUFFER-FIELD("cCustomSuperProc":U):BUFFER-VALUE = DYNAMIC-FUNCTION('getSuperProcedure':U IN p_hSMO).


  IF phDataTable:BUFFER-FIELD("cSDFFileName":U):BUFFER-VALUE = "Static_DynLookup":U THEN
    phDataTable:BUFFER-FIELD("cSDFFileName":U):BUFFER-VALUE = "":U.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE returnDataSourceHandle QueryTablefrmAttributes 
PROCEDURE returnDataSourceHandle :
/*------------------------------------------------------------------------------
  Purpose:     This procedure will return the data source handle of the current
               viewer that this lookup is being added to.
  Parameters:  phDataSource - The handle of the data source of the current
                              viewer
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE OUTPUT PARAMETER phDataSource AS HANDLE     NO-UNDO.
  
  DEFINE BUFFER B_P FOR _P.

  FIND FIRST B_P 
       WHERE B_P._WINDOW-HANDLE = _h_win
       NO-LOCK NO-ERROR.
  IF AVAILABLE B_P THEN
    phDataSource = DYNAMIC-FUNCTION('get-sdo-hdl':U IN _h_func_lib, 
                                     B_P._data-object,THIS-PROCEDURE).

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE returnViewerFields QueryTablefrmAttributes 
PROCEDURE returnViewerFields :
/*------------------------------------------------------------------------------
  Purpose:     This procedure will return the names of all the fields of the
               viewer.
  Parameters:  pcFields - A comma seperated list of widget names on the viewer
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE OUTPUT PARAMETER pcFields AS CHARACTER  NO-UNDO.
  
  DEFINE VARIABLE cFieldName    AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE cViewerField  AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE hParent       AS WIDGET     NO-UNDO.

  DEFINE BUFFER B_U FOR _U.
  DEFINE BUFFER B_S FOR _S.

  FIND FIRST B_S WHERE B_S._Handle = p_hSMO NO-LOCK NO-ERROR.
  IF NOT AVAILABLE B_S THEN
    RETURN.
  
  FIND FIRST B_U WHERE B_U._x-recid = RECID(B_S) NO-LOCK NO-ERROR.
  IF NOT AVAILABLE B_U THEN
    RETURN.

  cFieldName = DYNAMIC-FUNCTION("getFieldname" IN p_hSMO) NO-ERROR.
  
  hParent = B_U._Parent.
  
  pcFields = "":U.
  FOR EACH B_U
      WHERE B_U._PARENT = hParent
      AND   B_U._NAME  <> cFieldName:
    
    cViewerField = B_U._NAME.
    IF LOOKUP(B_U._TYPE,"FILL-IN,SELECTION-LIST,COMBO-BOX,EDITOR,TOGGLE-BOX,RADIO-SET,EDITOR,SmartObject":U) > 0 THEN DO:
      IF B_U._TYPE = "SmartObject":U THEN DO:
        FIND FIRST B_S
             WHERE RECID(B_S) = B_U._x-recid
             NO-LOCK NO-ERROR.
        IF AVAILABLE B_S and
           VALID-HANDLE(B_S._HANDLE) THEN
          cViewerField = DYNAMIC-FUNCTION("getFieldName":U IN B_S._HANDLE) NO-ERROR.
      END.
      pcFields = IF pcFields = "":U THEN B_U._NAME ELSE pcFields + ",":U + cViewerField.
    END.
                                                       
  END.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE saveSDFDetails QueryTablefrmAttributes 
PROCEDURE saveSDFDetails :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT  PARAMETER phDataTable AS HANDLE     NO-UNDO.
  
  DEFINE VARIABLE hFrame              AS HANDLE     NO-UNDO.
  DEFINE VARIABLE cFieldLabel         AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE dSuperProcObjectObj AS DECIMAL    NO-UNDO.

  IF NOT VALID-HANDLE(phDataTable) THEN
    RETURN "Invalid handle to Data Table".

  IF NOT VALID-HANDLE(p_hSMO) THEN RETURN.
  phDataTable:FIND-FIRST().
  cFieldLabel = phDataTable:BUFFER-FIELD("cFieldLabel":U):BUFFER-VALUE.
  
  /* Add pathed name for super proc */
  IF phDataTable:BUFFER-FIELD("cCustomSuperProc":U):BUFFER-VALUE <> "":U THEN 
  DO:
    ASSIGN dSuperProcObjectObj = DYNAMIC-FUNCTION("getSmartObjectObj":U IN gshRepositoryManager,
                                                  INPUT phDataTable:BUFFER-FIELD("cCustomSuperProc":U):BUFFER-VALUE, INPUT 0).
    IF dSuperProcObjectObj EQ 0 THEN
      phDataTable:BUFFER-FIELD("cCustomSuperProc":U):BUFFER-VALUE = "":U.

    /* Store the relatively pathed object name */
    ASSIGN phDataTable:BUFFER-FIELD("cCustomSuperProc":U):BUFFER-VALUE = DYNAMIC-FUNCTION("getObjectPathedName":U IN gshRepositoryManager,
                                                                         INPUT dSuperProcObjectObj).
  END.

  DYNAMIC-FUNCTION('setSDFFileName':U                 IN p_hSMO, phDataTable:BUFFER-FIELD("cSDFFileName":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setSDFTemplate':U                 IN p_hSMO, phDataTable:BUFFER-FIELD("cSDFTemplate":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setSuperProcedure':U              IN p_hSMO, phDataTable:BUFFER-FIELD("cCustomSuperProc":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setBaseQueryString':U             IN p_hSMO, phDataTable:BUFFER-FIELD("cBaseQueryString":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setQueryTables':U                 IN p_hSMO, phDataTable:BUFFER-FIELD('cQueryTables':U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setBrowseFields':U                IN p_hSMO, phDataTable:BUFFER-FIELD("cBrowseFields":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setBrowseFieldDataTypes':U        IN p_hSMO, phDataTable:BUFFER-FIELD("cBrowseFieldDataTypes":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setBrowseFieldFormats':U          IN p_hSMO, phDataTable:BUFFER-FIELD("cBrowseFieldFormats":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setViewerLinkedFields':U          IN p_hSMO, phDataTable:BUFFER-FIELD("cViewerLinkedFields":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setViewerLinkedWidgets':U         IN p_hSMO, phDataTable:BUFFER-FIELD("cViewerLinkedWidgets":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setLinkedFieldDataTypes':U        IN p_hSMO, phDataTable:BUFFER-FIELD("cLinkedFieldDataTypes":U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setLinkedFieldFormats':U          IN p_hSMO, phDataTable:BUFFER-FIELD("cLinkedFieldFormats":U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setColumnLabels':U                IN p_hSMO, phDataTable:BUFFER-FIELD("cColumnLabels":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setColumnFormat':U                IN p_hSMO, phDataTable:BUFFER-FIELD("cColumnFormat":U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setKeyField':U                    IN p_hSMO, phDataTable:BUFFER-FIELD('cKeyField':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setKeyFormat':U                   IN p_hSMO, phDataTable:BUFFER-FIELD("cKeyFormat":U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setKeyDataType':U                 IN p_hSMO, phDataTable:BUFFER-FIELD('cKeyDataType':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setDisplayedField':U              IN p_hSMO, phDataTable:BUFFER-FIELD('cDisplayedField':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setDisplayDataType':U             IN p_hSMO, phDataTable:BUFFER-FIELD("cDisplayDataType":U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setDisplayFormat':U               IN p_hSMO, phDataTable:BUFFER-FIELD('cDisplayFormat':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setFieldLabel':U                  IN p_hSMO, cFieldLabel).
  DYNAMIC-FUNCTION('setFieldTooltip':U                IN p_hSMO, phDataTable:BUFFER-FIELD('cFieldTooltip':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setBrowseTitle':U                 IN p_hSMO, phDataTable:BUFFER-FIELD('cBrowseTitle':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setRowsToBatch':U                 IN p_hSMO, phDataTable:BUFFER-FIELD('iRowsToBatch':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setParentFilterQuery':U           IN p_hSMO, phDataTable:BUFFER-FIELD('cParentFilterQuery':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setParentField':U                 IN p_hSMO, phDataTable:BUFFER-FIELD('cParentField':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setMaintenanceObject':U           IN p_hSMO, phDataTable:BUFFER-FIELD('cMaintenanceObject':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setMaintenanceSDO':U              IN p_hSMO, phDataTable:BUFFER-FIELD('cMaintenanceSDO':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setLookupImage':U                 IN p_hSMO, phDataTable:BUFFER-FIELD('cLookupImage':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setPhysicalTableNames':U          IN p_hSMO, phDataTable:BUFFER-FIELD('cPhysicalTableNames':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setTempTables':U                  IN p_hSMO, phDataTable:BUFFER-FIELD('cTempTables':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setQueryBuilderJoinCode':U        IN p_hSMO, phDataTable:BUFFER-FIELD('cQueryBuilderJoinCode':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setQueryBuilderOptionList':U      IN p_hSMO, phDataTable:BUFFER-FIELD('cQueryBuilderOptionList':U):BUFFER-VALUE). 
  DYNAMIC-FUNCTION('setQueryBuilderTableOptionList':U IN p_hSMO, phDataTable:BUFFER-FIELD('cQueryBuilderTableOptionList':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setQueryBuilderOrderList':U       IN p_hSMO, phDataTable:BUFFER-FIELD('cQueryBuilderOrderList':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setQueryBuilderTuneOptions':U     IN p_hSMO, phDataTable:BUFFER-FIELD('cQueryBuilderTuneOptions':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setQueryBuilderWhereClauses':U    IN p_hSMO, phDataTable:BUFFER-FIELD('cQueryBuilderWhereClauses':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setPopupOnAmbiguous':U            IN p_hSMO, phDataTable:BUFFER-FIELD('lPopupOnAmbiguous':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setPopupOnUniqueAmbiguous':U      IN p_hSMO, phDataTable:BUFFER-FIELD('lPopupOnUniqueAmbiguous':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setPopupOnNotAvail':U             IN p_hSMO, phDataTable:BUFFER-FIELD('lPopupOnNotAvail':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setBlankOnNotAvail':U             IN p_hSMO, phDataTable:BUFFER-FIELD('lBlankOnNotAvail':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setEnableField':U                 IN p_hSMO, phDataTable:BUFFER-FIELD('lEnableField':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setDisplayField':U                IN p_hSMO, phDataTable:BUFFER-FIELD('lDisplayField':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setMappedFields':U                IN p_hSMO, phDataTable:BUFFER-FIELD('cMappedFields':U):BUFFER-VALUE).
  DYNAMIC-FUNCTION('setUseCache':U                    IN p_hSMO, phDataTable:BUFFER-FIELD('lUseCache':U):BUFFER-VALUE).
  
  IF phDataTable:BUFFER-FIELD('lLocalField':U):BUFFER-VALUE THEN
    DYNAMIC-FUNCTION('setFieldName':U IN p_hSMO, phDataTable:BUFFER-FIELD('cActualField':U):BUFFER-VALUE).

  
  IF gdRow <> ? AND 
     gdColumn <> ? THEN
    RUN repositionObject IN p_hSMO (INPUT gdRow, INPUT gdColumn).
  
  DYNAMIC-FUNCTION("createLabel":U IN p_hSMO,cFieldLabel).
  ASSIGN
    hFrame        = DYNAMIC-FUNCTION("getContainerHandle" IN p_hSMO)
    hFrame:HEIGHT = IF gdHeight <> ? THEN gdHeight ELSE 1
    hFrame:WIDTH  = phDataTable:BUFFER-FIELD("dFieldWidth":U):BUFFER-VALUE NO-ERROR.

  /* Notify AppBuilder that size or position values has changed.
     The AB will run resizeObject which will run initializeObject */
  APPLY "END-RESIZE" TO hFrame.


END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE sdfMaintWindow QueryTablefrmAttributes 
PROCEDURE sdfMaintWindow :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT  PARAMETER pcChoise   AS CHARACTER  NO-UNDO.
  
  DEFINE VARIABLE lMultiInstance          AS LOGICAL    NO-UNDO.
  DEFINE VARIABLE cChildDataKey           AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE cRunAttribute           AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE hContainerWindow        AS HANDLE     NO-UNDO.
  DEFINE VARIABLE hContainerSource        AS HANDLE     NO-UNDO.
  DEFINE VARIABLE hObject                 AS HANDLE     NO-UNDO.
  DEFINE VARIABLE cRunContainerType       AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE cFieldName              AS CHARACTER  NO-UNDO.

  IF pcChoise = "CANCEL":U THEN DO:
    closeObject().
    RETURN.
  END.

  cFieldName = DYNAMIC-FUNCTION('getFieldName':U IN p_hSMO).

  ASSIGN
    lMultiInstance    = NO
    cChildDataKey     = "":U
    cRunAttribute     = IF pcChoise = ? THEN STRING(THIS-PROCEDURE) ELSE STRING(THIS-PROCEDURE) + CHR(3) + pcChoise + CHR(3) + cFieldName
    hContainerWindow  = ?
    hContainerSource  = ?
    hObject           = ?
    hContainerWindow  = ?
    cRunContainerType = "":U
    .
  IF VALID-HANDLE(gshSessionManager)
  THEN DO:
                                 
    RUN clearClientCache IN gshRepositoryManager.
    RUN launchContainer IN gshSessionManager 
                        (INPUT  "rysdfmaintw"        /* object filename if physical/logical names unknown */
                        ,INPUT  "":U                 /* physical object name (with path and extension) if known */
                        ,INPUT  ""                   /* logical object name if applicable and known */
                        ,INPUT  (NOT lMultiInstance) /* run once only flag YES/NO */
                        ,INPUT  "":U                 /* instance attributes to pass to container */
                        ,INPUT  cChildDataKey        /* child data key if applicable */
                        ,INPUT  cRunAttribute        /* run attribute if required to post into container run */
                        ,INPUT  "":U                 /* container mode, e.g. modify, view, add or copy */
                        ,INPUT  hContainerWindow     /* parent (caller) window handle if known (container window handle) */
                        ,INPUT  hContainerSource     /* parent (caller) procedure handle if known (container procedure handle) */
                        ,INPUT  hObject              /* parent (caller) object handle if known (handle at end of toolbar link, e.g. browser) */
                        ,OUTPUT ghSDFMaintWindow        /* procedure handle of object run/running */
                        ,OUTPUT cRunContainerType    /* procedure type (e.g ADM1, Astra1, ADM2, ICF, "") */
                        ).
  END.
  IF VALID-HANDLE(ghChooseWindow) THEN 
    RUN hideObject IN ghChooseWindow.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE setModal QueryTablefrmAttributes 
PROCEDURE setModal :
/*------------------------------------------------------------------------------
  Purpose:     Emulates a modal dialog by making all visible windows
               insensitive
  Parameters:   phWindow  Handle of Window containing a first child.
                plType    YES  Make all windows insensitive
                          NO Return all windows to their previous state
  Notes:       This is called from the choose trigger on the OK and Cancel buttons
               and on the Close of the window.  
------------------------------------------------------------------------------*/
  DEFINE INPUT  PARAMETER phWindow  AS HANDLE     NO-UNDO.
  DEFINE INPUT  PARAMETER plType    AS LOGICAL    NO-UNDO.
  
  DEFINE VARIABLE hWindow          AS HANDLE     NO-UNDO.
  DEFINE VARIABLE iPos             AS INTEGER    NO-UNDO.
  
  /* Make all windows insensitive except for current window */
  IF plType THEN DO:
     hWindow = phWindow:FIRST-CHILD.
     DO WHILE VALID-HANDLE(hWindow):
        IF hWindow:TYPE = "WINDOW":U THEN
        DO:
          ASSIGN
             gcWindowState   = gcWindowState + (IF gcWindowState = "" THEN "" ELSE ",") 
                                         + STRING(hWindow:SENSITIVE,"yes/no":U)
             gcWindowHandles = gcWindowHandles + (IF gcWindowHandles = "" THEN "" ELSE ",") 
                                         + STRING(hWindow) .
          IF hWindow <> {&WINDOW-NAME} THEN
              hWindow:SENSITIVE = FALSE.
        END.
        IF CAN-QUERY(hWindow,"FIRST-CHILD":U) THEN 
           RUN setModal IN THIS-PROCEDURE (hWindow,YES).
        hWindow = hWindow:NEXT-SIBLING.
     END.
  END.
  ELSE DO:
   /* Return all windows to their original state */
    hWindow = phWindow:FIRST-CHILD.
    DO WHILE VALID-HANDLE(hWindow):
       IF hWindow:TYPE = "WINDOW":U THEN
       DO:
          iPos = LOOKUP(STRING(hWindow),gcWindowHandles) .
          IF iPos > 0 THEN
             hWindow:SENSITIVE = (ENTRY(ipos,gcWindowState) = "yes":U).
       END.
       IF CAN-QUERY(hWindow,"FIRST-CHILD":U) THEN 
              RUN setModal IN THIS-PROCEDURE (hWindow,NO).
       hWindow = hWindow:NEXT-SIBLING.
    END.
  END.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

/* ************************  Function Implementations ***************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION closeObject QueryTablefrmAttributes 
FUNCTION closeObject RETURNS LOGICAL
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  
  APPLY "CLOSE":U TO THIS-PROCEDURE.
  RETURN TRUE.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION getObjectClosing QueryTablefrmAttributes 
FUNCTION getObjectClosing RETURNS LOGICAL
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/

  RETURN glClosing.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION getSDFType QueryTablefrmAttributes 
FUNCTION getSDFType RETURNS CHARACTER
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE cFieldName      AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE cSDFType        AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE cLookupClasses  AS CHARACTER  NO-UNDO.

  ASSIGN cFieldName = DYNAMIC-FUNCTION('getFieldName':U IN p_hSMO)
         cSDFType   = "DynLookup":U. /* Set to default */

  ASSIGN cLookupClasses = DYNAMIC-FUNCTION("getClassChildrenFromDB":U IN gshRepositoryManager, INPUT cSDFType).
  
  FIND_LOOP:
  FOR EACH _U
      WHERE _U._Name = cFieldName:
    IF VALID-HANDLE(_U._HANDLE) AND
       _U._HANDLE:NAME = "frLookup" THEN DO:
      cSDFType = _U._Class-Name.
      LEAVE FIND_LOOP.
    END.
  END.

  /* Lastly ensure it is a valid Dynamic Lookup Class */
  IF LOOKUP(cSDFType,cLookupClasses) = 0 THEN
    cSDFType = "DynLookup".
  
  RETURN cSDFType.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION getViewerType QueryTablefrmAttributes 
FUNCTION getViewerType RETURNS CHARACTER
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/

  FIND _P WHERE _P._WINDOW-HANDLE = _h_win NO-ERROR.

  IF AVAILABLE _P THEN
    RETURN _P.object_type_code.   /* Function return value. */
  ELSE
    RETURN "":U.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION isOnLocalField QueryTablefrmAttributes 
FUNCTION isOnLocalField RETURNS LOGICAL
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE lLocalField AS LOGICAL    NO-UNDO.
  lLocalField = DYNAMIC-FUNCTION('getLocalField':U IN p_hSMO) NO-ERROR.

  IF ERROR-STATUS:ERROR THEN
    lLocalField = FALSE.

  RETURN lLocalField.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

