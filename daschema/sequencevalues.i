/*************************************************************/
/* Copyright (c) 2011,2012 by Progress Software Corporation. */
/*                                                           */
/* All rights reserved.  No part of this program or document */
/* may be  reproduced in  any form  or by  any means without */
/* permission in writing from Progress Software Corporation. */
/*************************************************************/
/*------------------------------------------------------------------------
    File        : sequencevalues.i
    Author(s)   : hdaniels
    Created     :  
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */
 define temp-table ttSequenceValue no-undo serialize-name "sequenceValues"  {1} before-table ttSequenceValueCopy
     field SchemaName       as character serialize-name "schemaName"
     field SequenceName     as character serialize-name "sequenceName"
     field TenantName       as character serialize-name "tenantName"
     field TenantId         as integer   serialize-hidden  
     field SequenceUrl      as character serialize-name "sequence_url"
     field TenantUrl        as character serialize-name "tenant_url"
     field CurrentValue     as int64     serialize-name "currentValue"
     field Url              as character serialize-name "url"

     {daschema/entity.i}
     index idxSchemaName as unique primary SchemaName SequenceName TenantName
     index idxTenantName TenantName
     index idxTenantId TenantId.
    