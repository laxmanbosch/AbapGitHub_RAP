FUNCTION zrap17_prepare_purchase_doc.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IT_PURCHASEDOC) TYPE  ANY TABLE
*"  EXPORTING
*"     VALUE(ET_FINAL_PURCHASE_DATA) TYPE
*"        ZRAP17_IF_CDS1_TYPE=>TT_PURCHASE_CREATE
*"     VALUE(ET_MESSAGES) TYPE  BAPIRETTAB
*"----------------------------------------------------------------------
  DATA:ls_purchase_doc TYPE ZI_RAP17_PurchaseDoc_U.

  "Step1: Determine Purchase Document number

  SELECT MAX( PurchaseDocument ) FROM zi_rap17_purchasedoc INTO @DATA(lv_max_purchasedoc).
  DATA(lv_purchasedoc) = lv_max_purchasedoc + 1 .

  "Step2: Prepare final internal table
  LOOP AT it_purchasedoc ASSIGNING FIELD-SYMBOL(<lfs_purchase>).
    MOVE-CORRESPONDING <lfs_purchase> TO ls_purchase_doc.
    GET TIME STAMP FIELD DATA(lv_cr_datetime).
    ls_purchase_doc-createdby = sy-uname.
    ls_purchase_doc-createddatetime = lv_cr_datetime.
    ls_purchase_doc-changeddatetime = lv_cr_datetime.
    ls_purchase_doc-purchasedocument = lv_purchasedoc.

    APPEND ls_purchase_doc TO et_final_purchase_data.
  ENDLOOP.
  "Step3: Message handling


ENDFUNCTION.
