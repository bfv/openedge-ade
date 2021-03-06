/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation ("PSC"),       *
* 14 Oak Park, Bedford, MA 01730, and other contributors as listed   *
* below.  All Rights Reserved.                                       *
*                                                                    *
* The Initial Developer of the Original Code is PSC.  The Original   *
* Code is Progress IDE code released to open source December 1, 2000.*
*                                                                    *
* The contents of this file are subject to the Possenet Public       *
* License Version 1.0 (the "License"); you may not use this file     *
* except in compliance with the License.  A copy of the License is   *
* available as of the date of this notice at                         *
* http://www.possenet.org/license.html                               *
*                                                                    *
* Software distributed under the License is distributed on an "AS IS"*
* basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. You*
* should refer to the License for the specific language governing    *
* rights and limitations under the License.                          *
*                                                                    *
* Contributors:                                                      *
*                                                                    *
*********************************************************************/
/*
 * Prototype include file: S:\astra\object\admenh\dev\src\adm2\toolprto.i
 * Created from procedure: S:\astra\object\admenh\dev\src\adm2\toolbar.p at 16:08 on 22/03/01
 * by the PROGRESS PRO*Tools Prototype Include File Generator
 */

PROCEDURE buildAllMenus IN SUPER:
END PROCEDURE.

PROCEDURE buildDynamicMenuLevel IN SUPER:
  DEFINE INPUT PARAMETER phContainer AS HANDLE.
  DEFINE INPUT PARAMETER pcContainerName AS CHARACTER.
  DEFINE INPUT PARAMETER phMenubar AS HANDLE.
  DEFINE INPUT PARAMETER pcStructureCode AS CHARACTER.
  DEFINE INPUT PARAMETER phParentHandle AS HANDLE.
  DEFINE INPUT PARAMETER phParentKey AS DECIMAL.
  DEFINE INPUT PARAMETER plRecurse AS LOGICAL.
  DEFINE INPUT PARAMETER plDisableAll AS LOGICAL.
  DEFINE INPUT PARAMETER pcToolbarBand AS CHARACTER.
  DEFINE OUTPUT PARAMETER pcError AS CHARACTER.
END PROCEDURE.

PROCEDURE buildDynamicMenus IN SUPER:
END PROCEDURE.

PROCEDURE buildToolbar IN SUPER:
  DEFINE OUTPUT PARAMETER plOk AS LOGICAL.
END PROCEDURE.

PROCEDURE deleteMenu2 IN SUPER:
END PROCEDURE.

PROCEDURE deletetoolbar2 IN SUPER:
END PROCEDURE.

PROCEDURE destroyObject IN SUPER:
END PROCEDURE.

PROCEDURE disableToolbar IN SUPER:
END PROCEDURE.

PROCEDURE displayBandActions IN SUPER:
END PROCEDURE.

PROCEDURE enableToolbar IN SUPER:
END PROCEDURE.

PROCEDURE enterUpdateMode IN SUPER:
END PROCEDURE.

PROCEDURE filterState IN SUPER:
  DEFINE INPUT PARAMETER pcState AS CHARACTER.
END PROCEDURE.

PROCEDURE findMenuItem IN SUPER:
  DEFINE INPUT PARAMETER pcType AS CHARACTER.
  DEFINE INPUT PARAMETER pcLabel AS CHARACTER.
  DEFINE INPUT PARAMETER phStart AS HANDLE.
  DEFINE INPUT PARAMETER plRecurse AS LOGICAL.
  DEFINE INPUT-OUTPUT PARAMETER phMenuItem AS HANDLE.
END PROCEDURE.

PROCEDURE getMinHeight IN SUPER:
  DEFINE OUTPUT PARAMETER pdValue AS DECIMAL.
END PROCEDURE.

PROCEDURE getMinWidth IN SUPER:
  DEFINE OUTPUT PARAMETER pdValue AS DECIMAL.
END PROCEDURE.

PROCEDURE hideObject IN SUPER:
END PROCEDURE.

PROCEDURE initializeObject IN SUPER:
END PROCEDURE.

PROCEDURE linkState IN SUPER:
  DEFINE INPUT PARAMETER pcState AS CHARACTER.
END PROCEDURE.

PROCEDURE loadBandActions IN SUPER:
  DEFINE INPUT PARAMETER pcBands AS CHARACTER.
END PROCEDURE.

PROCEDURE moveButtons IN SUPER:
  DEFINE INPUT PARAMETER pcForceMove AS LOGICAL.
END PROCEDURE.

PROCEDURE onChoose IN SUPER:
  DEFINE INPUT PARAMETER pcAction AS CHARACTER.
END PROCEDURE.

PROCEDURE onMenuDrop IN SUPER:
  DEFINE INPUT PARAMETER pcBand AS CHARACTER.
END PROCEDURE.

PROCEDURE onValueChanged IN SUPER:
  DEFINE INPUT PARAMETER pcAction AS CHARACTER.
END PROCEDURE.

PROCEDURE queryPosition IN SUPER:
  DEFINE INPUT PARAMETER pcState AS CHARACTER.
END PROCEDURE.

PROCEDURE queryPositionImpl IN SUPER:
  DEFINE INPUT PARAMETER pcState AS CHARACTER.
  DEFINE INPUT PARAMETER phSourceProcedure AS HANDLE.
  DEFINE INPUT PARAMETER phTargetProcedure AS HANDLE.
END PROCEDURE.

PROCEDURE repositionObject IN SUPER:
  DEFINE INPUT PARAMETER pdRow AS DECIMAL.
  DEFINE INPUT PARAMETER pdCol AS DECIMAL.
END PROCEDURE.

PROCEDURE resetBandActions IN SUPER:
  DEFINE INPUT PARAMETER pcBands AS CHARACTER.
END PROCEDURE.

PROCEDURE resetRecord IN SUPER:
END PROCEDURE.

PROCEDURE resizeObject IN SUPER:
  DEFINE INPUT PARAMETER pdHeight AS DECIMAL.
  DEFINE INPUT PARAMETER pdWidth AS DECIMAL.
END PROCEDURE.

PROCEDURE rollForwardPendingImages IN SUPER:
  DEFINE INPUT PARAMETER phTarget AS HANDLE.
END PROCEDURE.

PROCEDURE rollforwardPendingSensitivity IN SUPER:
  DEFINE INPUT PARAMETER phTargetProcedure AS HANDLE.
END PROCEDURE.

PROCEDURE rollforwardPendingStates IN SUPER:
  DEFINE INPUT PARAMETER phTargetProcedure AS HANDLE.
END PROCEDURE.

PROCEDURE rowObjectState IN SUPER:
  DEFINE INPUT PARAMETER pcState AS CHARACTER.
END PROCEDURE.

PROCEDURE runInfo IN SUPER:
  DEFINE INPUT PARAMETER pcAction AS CHARACTER.
  DEFINE OUTPUT PARAMETER pocProcedure AS CHARACTER.
  DEFINE OUTPUT PARAMETER pocParam AS CHARACTER.
END PROCEDURE.

PROCEDURE setButtons IN SUPER:
  DEFINE INPUT PARAMETER pcPanelState AS CHARACTER.
END PROCEDURE.

PROCEDURE setImage IN SUPER:
  DEFINE INPUT PARAMETER pcActionReference AS CHARACTER.
  DEFINE INPUT PARAMETER piImageNumber AS INTEGER.
END PROCEDURE.

PROCEDURE storePendingSensitivity IN SUPER:
  DEFINE INPUT PARAMETER pcActions AS CHARACTER.
  DEFINE INPUT PARAMETER plSensitive AS LOGICAL.
END PROCEDURE.

PROCEDURE updateState IN SUPER:
  DEFINE INPUT PARAMETER pcState AS CHARACTER.
END PROCEDURE.

PROCEDURE updateStates IN SUPER:
  DEFINE INPUT PARAMETER pcState AS CHARACTER.
END PROCEDURE.

PROCEDURE viewHideActions IN SUPER:
  DEFINE INPUT PARAMETER pcViewActions AS CHARACTER.
  DEFINE INPUT PARAMETER pcHideActions AS CHARACTER.
END PROCEDURE.

PROCEDURE viewObject IN SUPER:
END PROCEDURE.

PROCEDURE windowDropDownList IN SUPER:
  DEFINE INPUT PARAMETER phSubMenu AS HANDLE.
END PROCEDURE.

PROCEDURE WindowEnabled IN SUPER:
  DEFINE INPUT PARAMETER phHandle AS HANDLE.
  DEFINE OUTPUT PARAMETER plEnabled AS LOGICAL.
END PROCEDURE.

PROCEDURE WindowFocus IN SUPER:
  DEFINE INPUT PARAMETER phHandle AS HANDLE.
END PROCEDURE.

PROCEDURE WindowListMenu IN SUPER:
  DEFINE INPUT PARAMETER phSubMenu AS HANDLE.
  DEFINE INPUT PARAMETER phContainer AS HANDLE.
  DEFINE INPUT PARAMETER phStart AS HANDLE.
  DEFINE INPUT PARAMETER piCount AS INTEGER.
END PROCEDURE.

FUNCTION actionCanRun RETURNS LOGICAL
  (INPUT pcAction AS CHARACTER) IN SUPER.

FUNCTION actionChecked RETURNS LOGICAL
  (INPUT pcAction AS CHARACTER) IN SUPER.

FUNCTION actionPublishCreate RETURNS LOGICAL
  (INPUT pcAction AS CHARACTER) IN SUPER.

FUNCTION actionTarget RETURNS HANDLE
  (INPUT pcAction AS CHARACTER) IN SUPER.

FUNCTION buildMenu RETURNS LOGICAL
  (INPUT pcParent AS CHARACTER) IN SUPER.

FUNCTION constructMenu RETURNS LOGICAL IN SUPER.

FUNCTION constructMenuItems RETURNS LOGICAL
  (INPUT pcBand AS CHARACTER,
   INPUT pcState AS CHARACTER) IN SUPER.

FUNCTION create3DRule RETURNS HANDLE
  (INPUT phParent AS HANDLE,
   INPUT-OUTPUT piX AS INTEGER) IN SUPER.

FUNCTION create3DRuleXY RETURNS HANDLE
  (INPUT phParent AS HANDLE,
   INPUT-OUTPUT piX AS INTEGER,
   INPUT-OUTPUT piY AS INTEGER) IN SUPER.

FUNCTION createButton RETURNS HANDLE
  (INPUT phParent AS HANDLE,
   INPUT-OUTPUT piX AS INTEGER,
   INPUT pcName AS CHARACTER,
   INPUT pcLabel AS CHARACTER,
   INPUT pcCaption AS CHARACTER,
   INPUT pcBitmap AS CHARACTER,
   INPUT plSensitive AS LOGICAL) IN SUPER.

FUNCTION createButtonXY RETURNS HANDLE
  (INPUT phParent AS HANDLE,
   INPUT-OUTPUT piX AS INTEGER,
   INPUT-OUTPUT piY AS INTEGER,
   INPUT pcName AS CHARACTER,
   INPUT pcLabel AS CHARACTER,
   INPUT pcTooltip AS CHARACTER,
   INPUT pcBitmap AS CHARACTER,
   INPUT plSensitive AS LOGICAL,
   INPUT plHidden AS LOGICAL) IN SUPER.

FUNCTION createMenuBar RETURNS HANDLE IN SUPER.

FUNCTION createMenuItem RETURNS HANDLE
  (INPUT phParent AS HANDLE,
   INPUT pcName AS CHARACTER,
   INPUT pcCaption AS CHARACTER,
   INPUT pcAccelerator AS CHARACTER,
   INPUT plSensitive AS LOGICAL) IN SUPER.

FUNCTION createMenuToggle RETURNS HANDLE
  (INPUT phParent AS HANDLE,
   INPUT pcName AS CHARACTER,
   INPUT pcCaption AS CHARACTER,
   INPUT pcAccelerator AS CHARACTER,
   INPUT plSensitive AS LOGICAL) IN SUPER.

FUNCTION createRule RETURNS HANDLE
  (INPUT phParent AS HANDLE) IN SUPER.

FUNCTION createSubMenu RETURNS HANDLE
  (INPUT phParent AS HANDLE,
   INPUT pcName AS CHARACTER,
   INPUT pcCaption AS CHARACTER,
   INPUT plSensitive AS LOGICAL) IN SUPER.

FUNCTION createToolBar RETURNS LOGICAL
  (INPUT pcActions AS CHARACTER) IN SUPER.

FUNCTION deleteMenu RETURNS LOGICAL IN SUPER.

FUNCTION deleteToolbar RETURNS LOGICAL IN SUPER.

FUNCTION disableActions RETURNS LOGICAL
  (INPUT pcActions AS CHARACTER) IN SUPER.

FUNCTION enableActions RETURNS LOGICAL
  (INPUT pcActions AS CHARACTER) IN SUPER.

FUNCTION findActionTarget RETURNS HANDLE
  (INPUT pcAction AS CHARACTER,
   INPUT pcActionLink AS CHARACTER,
   INPUT pcBandLink AS CHARACTER) IN SUPER.

FUNCTION findToolbarParentMenu RETURNS HANDLE
  (INPUT phMenuBar AS HANDLE) IN SUPER.

FUNCTION getTargetProcedure RETURNS HANDLE IN SUPER.

FUNCTION insertMenu RETURNS LOGICAL
  (INPUT pcParent AS CHARACTER,
   INPUT pcActions AS CHARACTER,
   INPUT plExpand AS LOGICAL,
   INPUT pcBefore AS CHARACTER) IN SUPER.

FUNCTION modifyDisabledActions RETURNS LOGICAL
  (INPUT pcMode AS CHARACTER,
   INPUT pcActions AS CHARACTER) IN SUPER.

FUNCTION getObjectType RETURNS CHARACTER IN SUPER.

