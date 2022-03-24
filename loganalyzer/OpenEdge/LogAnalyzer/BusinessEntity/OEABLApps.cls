 
/*------------------------------------------------------------------------
   File        : OEABLApps
   Syntax      : 
   Author(s)   : isyed
   Created     : Mon Jan 01 23:21:42 EST 2018
   Notes       : 
 ----------------------------------------------------------------------*/
  
@program FILE(name="OEABLApps.cls", module="AppServer").
@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
@progress.service.resource FILE(name="OEABLApps", URI="/OEABLApps", schemaName="dsOEABLApps", schemaFile="LogAnalyzer/PASOEContent/WEB-INF/openedge/OpenEdge/LogAnalyzer/Include/eOEABLapps.i").

USING Progress.Lang.*.
USING OpenEdge.BusinessLogic.BusinessEntity.
USING OpenEdge.LogAnalyzer.BusinessEntity.OEABLApps FROM PROPATH.
USING Progress.Json.ObjectModel.ObjectModelParser FROM PROPATH.
USING Progress.Json.ObjectModel.JsonObject FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS OpenEdge.LogAnalyzer.BusinessEntity.OEABLApps INHERITS BusinessEntity:
    /*------------------------------------------------------------------------------
            Purpose:                                                                      
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    
    {"OpenEdge/LogAnalyzer/Include/eOEABLapps.i"}
    
    DEFINE DATA-SOURCE srcOEABLApps FOR logdb.OEABLApps.
    
    
    /*------------------------------------------------------------------------------
            Purpose:                                                                      
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OEABLApps():
        
        DEFINE VARIABLE hDataSourceArray AS HANDLE    NO-UNDO EXTENT 1.
        DEFINE VARIABLE cSkipListArray   AS CHARACTER NO-UNDO EXTENT 1.
        
        SUPER (DATASET dsOEABLApps:HANDLE).
        
        /* Data Source for each table in dataset. Should be in table order as defined 
            in DataSet */     
        hDataSourceArray[1] =  DATA-SOURCE srcOEABLApps:HANDLE.
         
                  
        /* Skip-list entry for each table in dataset. Should be in temp-table order 
          as defined in DataSet */
        /* Each skip-list entry is a comma-separated list of field names, to be
            ignored in create stmt */
             
        cSkipListArray[1] = "".
         
         
        THIS-OBJECT:ProDataSource = hDataSourceArray.
        THIS-OBJECT:SkipList = cSkipListArray.
                 
    END CONSTRUCTOR.
        
    /*------------------------------------------------------------------------------
            Purpose:  Get one or more records, based on a filter string                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="read", URI="?filter=~{filter~}", alias="", mediaType="application/json"). 
   
    METHOD PUBLIC VOID ReadOEABLApps(
        INPUT filter AS CHARACTER, 
        OUTPUT DATASET dsOEABLApps):
        
        SUPER:ReadData(filter).
              
    END METHOD.
      
     
       
END CLASS.