FUNCTION zrap17_purchase_save.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IT_PURCHASE_CREATE) TYPE
*"        ZRAP17_IF_CDS1_TYPE=>TT_DB_PURCHASE OPTIONAL
*"----------------------------------------------------------------------
  IF  it_purchase_create IS NOT INITIAL.
    INSERT zir17_purchasedc FROM TABLE @it_purchase_create.
  ENDIF.

ENDFUNCTION.
