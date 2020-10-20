FUNCTION zrsh_set_po_status_close.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IT_PURCHASE_DOC) TYPE  ZRSH_IF_RAP_BATCH1_TYPES=>TT_PO_DOC
*"       OPTIONAL
*"----------------------------------------------------------------------
  SELECT * FROM zrishi_podoc
  FOR ALL ENTRIES IN @it_purchase_doc
  WHERE po_document EQ @it_purchase_doc-po_document
  INTO TABLE @DATA(lt_po_statuses) .
  IF sy-subrc EQ 0.

    LOOP AT lt_po_statuses ASSIGNING FIELD-SYMBOL(<lfs_status>).
      <lfs_status>-po_status = '3'.
    ENDLOOP.
  ENDIF.

  IF lt_po_statuses IS NOT INITIAL.
    UPDATE zrishi_podoc FROM TABLE @lt_po_statuses.

  ENDIF..



ENDFUNCTION.
