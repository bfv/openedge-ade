/*********************************************************************
* Copyright (C) 2005 by Progress Software Corporation. All rights    *
* reserved.  Prior versions of this work may contain portions        *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/
/*
 * Prototype include file: C:\Work\Dyn\src\adm2\lookprto.i
 * Created from procedure: C:\Work\Dyn\src\adm2\lookup.p at 15:19 on 09/10/04
 * by the PROGRESS PRO*Tools Prototype Include File Generator
 */

PROCEDURE destroyObject IN SUPER:
END PROCEDURE.

PROCEDURE disable_UI IN SUPER:
END PROCEDURE.

PROCEDURE endMove IN SUPER:
END PROCEDURE.

PROCEDURE hideObject IN SUPER:
END PROCEDURE.

PROCEDURE repositionObject IN SUPER:
  DEFINE INPUT PARAMETER pdRow AS DECIMAL.
  DEFINE INPUT PARAMETER pdColumn AS DECIMAL.
END PROCEDURE.

PROCEDURE returnParentFieldValues IN SUPER:
  DEFINE OUTPUT PARAMETER pcNewQuery AS CHARACTER.
END PROCEDURE.

PROCEDURE shortCutKey IN SUPER:
END PROCEDURE.

PROCEDURE viewObject IN SUPER:
END PROCEDURE.

FUNCTION getBaseQueryString RETURNS CHARACTER IN SUPER.

FUNCTION getDisplayDataType RETURNS CHARACTER IN SUPER.

FUNCTION getDisplayedField RETURNS CHARACTER IN SUPER.

FUNCTION getDisplayFormat RETURNS CHARACTER IN SUPER.

FUNCTION getFieldLabel RETURNS CHARACTER IN SUPER.

FUNCTION getFieldToolTip RETURNS CHARACTER IN SUPER.

FUNCTION getKeyDataType RETURNS CHARACTER IN SUPER.

FUNCTION getKeyField RETURNS CHARACTER IN SUPER.

FUNCTION getKeyFormat RETURNS CHARACTER IN SUPER.

FUNCTION getLabel RETURNS CHARACTER IN SUPER.

FUNCTION getLabelHandle RETURNS HANDLE IN SUPER.

FUNCTION getParentField RETURNS CHARACTER IN SUPER.

FUNCTION getParentFilterQuery RETURNS CHARACTER IN SUPER.

FUNCTION getPhysicalTableNames RETURNS CHARACTER IN SUPER.

FUNCTION getQueryBuilderJoinCode RETURNS CHARACTER IN SUPER.

FUNCTION getQueryBuilderOptionList RETURNS CHARACTER IN SUPER.

FUNCTION getQueryBuilderOrderList RETURNS CHARACTER IN SUPER.

FUNCTION getQueryBuilderTableOptionList RETURNS CHARACTER IN SUPER.

FUNCTION getQueryBuilderTuneOptions RETURNS CHARACTER IN SUPER.

FUNCTION getQueryBuilderWhereClauses RETURNS CHARACTER IN SUPER.

FUNCTION getQueryTables RETURNS CHARACTER IN SUPER.

FUNCTION getSDFFileName RETURNS CHARACTER IN SUPER.

FUNCTION getSDFTemplate RETURNS CHARACTER IN SUPER.

FUNCTION getTempTables RETURNS CHARACTER IN SUPER.

FUNCTION getUseCache RETURNS LOGICAL IN SUPER.

FUNCTION newQueryString RETURNS CHARACTER
  (INPUT pcColumns AS CHARACTER,
   INPUT pcValues AS CHARACTER,
   INPUT pcDataTypes AS CHARACTER,
   INPUT pcOperators AS CHARACTER,
   INPUT pcQueryString AS CHARACTER,
   INPUT pcAndOr AS CHARACTER) IN SUPER.

FUNCTION newWhereClause RETURNS CHARACTER
  (INPUT pcBuffer AS CHARACTER,
   INPUT pcExpression AS CHARACTER,
   INPUT pcWhere AS CHARACTER,
   INPUT pcAndOr AS CHARACTER) IN SUPER.

FUNCTION returnTableIOType RETURNS CHARACTER IN SUPER.

FUNCTION setBaseQueryString RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setDisplayDataType RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setDisplayedField RETURNS LOGICAL
  (INPUT pcDisplayedField AS CHARACTER) IN SUPER.

FUNCTION setDisplayFormat RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setFieldHidden RETURNS LOGICAL
  (INPUT plHide AS LOGICAL) IN SUPER.

FUNCTION setFieldLabel RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setFieldToolTip RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setKeyDataType RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setKeyField RETURNS LOGICAL
  (INPUT pcKeyField AS CHARACTER) IN SUPER.

FUNCTION setKeyFormat RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setLabel RETURNS LOGICAL
  (INPUT pcLabel AS CHARACTER) IN SUPER.

FUNCTION setLabelHandle RETURNS LOGICAL
  (INPUT phValue AS HANDLE) IN SUPER.

FUNCTION setParentField RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setParentFilterQuery RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setPhysicalTableNames RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setQueryBuilderJoinCode RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setQueryBuilderOptionList RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setQueryBuilderOrderList RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setQueryBuilderTableOptionList RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setQueryBuilderTuneOptions RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setQueryBuilderWhereClauses RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setQueryTables RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setSDFFileName RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setSDFTemplate RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setTempTables RETURNS LOGICAL
  (INPUT pcValue AS CHARACTER) IN SUPER.

FUNCTION setUseCache RETURNS LOGICAL
  (INPUT plValue AS LOGICAL) IN SUPER.

FUNCTION getObjectType RETURNS CHARACTER IN SUPER.

