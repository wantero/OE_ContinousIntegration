@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
 
/*------------------------------------------------------------------------
   File        : SI_getZipCode
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : William
   Created     : Wed May 23 12:05:54 BRT 2018
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS SI_getZipCode: 
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    
    {"SI_getZipCode.i"}
        
    CONSTRUCTOR PUBLIC SI_getZipCode (  ):
        SUPER ().
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    METHOD PUBLIC INTEGER getZipCode( 
        INPUT pais   AS CHARACTER,
        INPUT codPos AS CHARACTER,
        INPUT lang   AS CHARACTER,
        OUTPUT dataset dsZipCode,
        OUTPUT dataset dsError  ):
            
        DEFINE VARIABLE result AS INTEGER NO-UNDO INITIAL 200.
        
        EMPTY TEMP-TABLE ttZipCode.
        EMPTY TEMP-TABLE ttError.
        
        IF pais = "" OR pais = ? THEN 
        DO:
            RESULT = 404.
            CREATE ttError.
            ASSIGN 
                ttError.codError = 1
                ttError.desError = "PAIS no existe.".
            RETURN result.
        END.
        
        IF codPos = "" OR codPos = ? THEN 
        DO:
            RESULT = 404.
            CREATE ttError.
            ASSIGN 
                ttError.codError = 1
                ttError.desError = "COD_POS no existe.".
            RETURN result.
        END.
        
        IF lang = "" OR lang = ? THEN 
        DO:
            RESULT = 404.
            CREATE ttError.
            ASSIGN 
                ttError.codError = 1
                ttError.desError = "LANG no existe.".
            RETURN result.
        END.        
        
        CREATE ttZipCode.
        ASSIGN 
            ttZipCode.zipCode     = codPos
            ttZipCode.descZipCode = "Codigo Postal".

        RETURN result.

    END METHOD.

    DESTRUCTOR PUBLIC SI_getZipCode ( ):

    END DESTRUCTOR.
    
    

END CLASS.