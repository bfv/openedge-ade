/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/
/* b-debug.i - used for debugging and timing */

IF qbf-u THEN
  PUT UNFORMATTED '{&when} {&what}  ' ({ prores/s-etime.i } - qbf-x) * .001 SKIP.
