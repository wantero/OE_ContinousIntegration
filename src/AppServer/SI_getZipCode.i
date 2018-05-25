
/*------------------------------------------------------------------------
    File        : SI_getZipCode.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed May 23 12:13:23 BRT 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttZipCode NO-UNDO
    FIELD zipCode     AS CHARACTER
    FIELD descZipCode AS CHARACTER.
    
DEFINE TEMP-TABLE ttError NO-UNDO
    FIELD codError AS INTEGER
    FIELD desError AS CHARACTER.
    
DEFINE DATASET dsZipCode FOR ttZipCode.
DEFINE DATASET dsError   FOR ttError.        