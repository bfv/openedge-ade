/*********************************************************************
* Copyright (C) 2005 by Progress Software Corporation. All rights    *
* reserved.  Prior versions of this work may contain portions        *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/

TRIGGER PROCEDURE FOR DELETE OF gsc_document_type .

/* Created automatically using ERwin ICF Trigger template db/af/erw/afercustrg.i
   Do not change manually. Customisations to triggers should be placed in separate
   include files pulled into the trigger. ICF auto generates write trigger custom
   include files. Delete or create customisation include files need to be created
   manually. Be sure to put the hook in ERwin directly so as not to have you changes
   overwritten.
   User defined Macro (UDP) Summary (case sensitive)
   gsc_document_type           Expands to full table name, e.g. gsm_user
   %TableFLA            Expands to table unique code, e.g. gsmus
   %TableObj            If blank or not defined expands to table_obj with no prefix (framework standard)
                        If defined, uses this field as the object field
                        If set to "none" then indicates table does not have an object field
   XYZ                  Do not define so we can compare against an empty string

   See docs for explanation of replication macros 
*/   

&SCOPED-DEFINE TRIGGER_TABLE gsc_document_type
&SCOPED-DEFINE TRIGGER_FLA gscdt
&SCOPED-DEFINE TRIGGER_OBJ document_type_obj


DEFINE BUFFER lb_table FOR gsc_document_type.      /* Used for recursive relationships */
DEFINE BUFFER lb1_table FOR gsc_document_type.     /* Used for lock upgrades */

DEFINE BUFFER o_gsc_document_type FOR gsc_document_type.

/* Standard top of DELETE trigger code */
{af/sup/aftrigtopd.i}

  




/* Generated by ICF ERwin Template */
/* gsc_document_type has gsm_report_definition ON PARENT DELETE RESTRICT */
IF CAN-FIND(FIRST gsm_report_definition WHERE
    gsm_report_definition.document_type_obj = gsc_document_type.document_type_obj) THEN
    DO:
      /* Cannot delete parent because child exists! */
      ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 101 lv-include = "gsc_document_type|gsm_report_definition":U.
      RUN error-message (lv-errgrp, lv-errnum, lv-include).
    END.



/* Generated by ICF ERwin Template */
/* gsc_document_type uses gsm_default_report_format ON PARENT DELETE RESTRICT */
IF CAN-FIND(FIRST gsm_default_report_format WHERE
    gsm_default_report_format.document_type_obj = gsc_document_type.document_type_obj) THEN
    DO:
      /* Cannot delete parent because child exists! */
      ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 101 lv-include = "gsc_document_type|gsm_default_report_format":U.
      RUN error-message (lv-errgrp, lv-errnum, lv-include).
    END.












/* Update Audit Log */
IF CAN-FIND(FIRST gsc_entity_mnemonic
            WHERE gsc_entity_mnemonic.entity_mnemonic = 'gscdt':U
              AND gsc_entity_mnemonic.auditing_enabled = YES) THEN
  RUN af/app/afauditlgp.p (INPUT "DELETE":U, INPUT "gscdt":U, INPUT BUFFER gsc_document_type:HANDLE, INPUT BUFFER o_gsc_document_type:HANDLE).

/* Standard bottom of DELETE trigger code */
{af/sup/aftrigendd.i}


/* Place any specific DELETE trigger customisations here */