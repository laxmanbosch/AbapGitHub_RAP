FUNCTION zrsh_purchase_save.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IT_PURCHASE_CREATE) TYPE
*"        ZRSH_IF_RAP_BATCH1_TYPES=>TT_PO_HEADER_DB OPTIONAL
*"     VALUE(IT_PURCHASE_ITEM) TYPE
*"        ZRSH_IF_RAP_BATCH1_TYPES=>TT_PO_ITEM_DB OPTIONAL
*"     VALUE(IT_PURCHASE_UPDATE) TYPE
*"        ZRSH_IF_RAP_BATCH1_TYPES=>TT_PO_HEADER_DB
*"----------------------------------------------------------------------
  IF it_purchase_create IS NOT INITIAL.
    INSERT zrishi_podoc FROM TABLE @it_purchase_create.
  ENDIF.
  IF it_purchase_item IS NOT INITIAL.

    INSERT zrishi_poitem FROM TABLE @it_purchase_item.
  ENDIF.
  IF it_purchase_update IS NOT INITIAL.
    UPDATE zrishi_podoc FROM TABLE @it_purchase_update.
  ENDIF.



ENDFUNCTION.
