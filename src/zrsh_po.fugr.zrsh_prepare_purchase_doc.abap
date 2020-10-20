FUNCTION zrsh_prepare_purchase_doc.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IT_PURCHASEDOC) TYPE  ANY TABLE
*"  EXPORTING
*"     VALUE(ET_FINAL_PURCHASE_DATA) TYPE
*"        ZRSH_IF_RAP_BATCH1_TYPES=>TT_PURCHASE_CREATE
*"     VALUE(ET_MESSAGES) TYPE  BAPIRETTAB
*"----------------------------------------------------------------------
  DATA: lv_purchasedoc TYPE zebeln.
  DATA: ls_purchase_doc TYPE zi_rsh_purchasedoc_u.

  "Step1: Determine Purchase document number.
  SELECT MAX( PurchaseDocument ) FROM zi_rsh_purchasedoc INTO @DATA(lv_max_purchasedoc).
  lv_PURCHASEDOC = lv_max_purchasedoc + 1.


  "Step2:Prepare the final internal table.
  LOOP AT it_purchasedoc ASSIGNING FIELD-SYMBOL(<lfs_purchase>).
    MOVE-CORRESPONDING <lfs_purchase> TO ls_purchase_doc.
    GET TIME STAMP FIELD DATA(lv_cr_datetime).
    ls_purchase_doc-createdby = sy-uname.
    ls_purchase_doc-createddatetime = lv_cr_datetime.
    ls_purchase_doc-changeddatetime = lv_cr_datetime.
    ls_purchase_doc-purchasedocument = condense(  lv_purchasedoc ).
    APPEND ls_purchase_doc TO et_final_purchase_data.
  ENDLOOP.


  "Step3: Message handling


ENDFUNCTION.
