/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*               PSC                                                  *
*                                                                    *
*********************************************************************/
TRIGGER PROCEDURE FOR REPLICATION-CREATE OF gsm_session_service.

{af/sup/afreplicat.i  &TABLE-NAME   = "gsm_session_service"
                      &TABLE-FLA    = "gsmsv"
                      &TABLE-PK     = "session_service_obj"
                      &ACTION       = "CREATE"
                      
                      
                      &VERSION-DATA = "YES"
}