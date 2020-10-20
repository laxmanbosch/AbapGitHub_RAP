CLASS lcl_tbuffer DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA: mt_purchase_create TYPE zrsh_if_rap_batch1_types=>tt_po_header_db.
    CLASS-DATA: mt_purchase_update TYPE zrsh_if_rap_batch1_types=>tt_po_header_db.
    CLASS-DATA: mt_po_doc   TYPE zrsh_if_rap_batch1_types=>tt_po_doc,
                mt_po_items TYPE zrsh_if_rap_batch1_types=>tt_po_item_db.

ENDCLASS.

CLASS lhc_ZI_RSH_PurchaseDoc_U DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create_purchasedoc FOR MODIFY
      IMPORTING it_purchase_create FOR CREATE PurchaseHeader.

    METHODS set_status_process FOR MODIFY IMPORTING it_purchase_doc FOR ACTION PurchaseHeader~set_status_inprocess
                                          RESULT    et_purchase_doc.

    METHODS create_header_item FOR MODIFY
      IMPORTING it_purchase_item FOR CREATE PurchaseHeader\_Items.

    METHODS update_purchasedoc FOR MODIFY
      IMPORTING it_purchase_update FOR UPDATE PurchaseHeader.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE PurchaseHeader.


    METHODS read FOR READ
      IMPORTING keys FOR READ PurchaseHeader RESULT result.


    METHODS rba_Items FOR READ
      IMPORTING keys_rba FOR READ PurchaseHeader\_Items FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZI_RSH_PurchaseDoc_U IMPLEMENTATION.

  METHOD create_purchasedoc.
    DATA: lt_final_purchase_data TYPE TABLE OF ZI_RSH_PurchaseDoc_U,
          ls_purchase_data_db    TYPE zrishi_podoc,

          lt_messages            TYPE bapirettab.

*    READ  TABLE it_purchase_create INDEX 1 INTO DATA(ls_cidd).
*    lv_cid = ls_cidd-%cid.
    DATA(lv_cid) = it_purchase_create[ 1 ]-%cid.


    CALL FUNCTION 'ZRSH_PREPARE_PURCHASE_DOC'
      EXPORTING
        it_purchasedoc         = it_purchase_create
      IMPORTING
        et_final_purchase_data = lt_final_purchase_data
        et_messages            = lt_messages.

    IF NOT line_exists( lt_messages[ type = 'E' ] ).
      "step4: Map CDS View fields to our DB.
      DATA(lv_purchasedoc) = lt_final_purchase_data[ 1 ]-PurchaseDocument.

      LOOP AT lt_final_purchase_data ASSIGNING FIELD-SYMBOL(<lfs_final_data>).

        ls_purchase_data_db = CORRESPONDING #( <lfs_final_data>
        MAPPING FROM ENTITY ).
        APPEND ls_purchase_data_db TO lcl_tbuffer=>mt_purchase_create.

      ENDLOOP.

      APPEND VALUE #( %cid = lv_cid purchasedocument = lv_purchasedoc  ) TO mapped-purchaseheader.
      DATA(lref_message) = NEW cl_abap_behv( )->new_message(
                                                        id       =  'ZRISHI_MSG'
                                                        number   = '001'
                                                        severity = if_abap_behv_message=>severity-success ).
      APPEND VALUE #( %cid = lv_cid purchasedocument = lv_purchasedoc  %msg = lref_message ) TO reported-purchaseheader.
*
    ENDIF.



  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD update_purchasedoc.
    DATA: ls_purchase_control TYPE zrsh_if_rap_batch1=>ts_purchase_control.
    DATA: lt_purchase_control TYPE zrsh_if_rap_batch1=>tt_purchase_control.

    DATA: lt_update_purchase TYPE zrsh_if_rap_batch1=>tt_db_purchase.
    DATA: ls_purchase_data TYPE zrishi_podoc.

    DATA: lt_messages TYPE bapirettab.

    LOOP AT it_purchase_update  ASSIGNING FIELD-SYMBOL(<lfs_update_po>).

      ls_purchase_control-purchasedocument = <lfs_update_po>-PurchaseDocument.
      ls_purchase_control-purchasedesc = xsdbool( <lfs_update_po>-%control-PurchaseDescription = cl_abap_behv=>flag_changed ).
      ls_purchase_control-currency = xsdbool( <lfs_update_po>-%control-Currency =  cl_abap_behv=>flag_changed ).
      ls_purchase_control-purchaseprio = xsdbool( <lfs_update_po>-%control-Priority = cl_abap_behv=>flag_changed ).
      ls_purchase_control-purchasestatus = xsdbool( <lfs_update_po>-%control-Status = cl_abap_behv=>flag_changed ).

      APPEND ls_purchase_control TO lt_purchase_control.

      ls_purchase_data = CORRESPONDING #(  <lfs_update_po> MAPPING FROM ENTITY ).
      APPEND ls_purchase_data TO lt_update_purchase.
    ENDLOOP.
    CALL FUNCTION 'ZRISHI_PURCHASE_UPDATE'
      EXPORTING
        it_purchase_doc     = lt_update_purchase
        it_purchase_control = lt_purchase_control
      IMPORTING
        et_purchase_update  = lcl_tbuffer=>mt_purchase_update
        et_messages         = lt_messages.
    APPEND VALUE #( purchasedocument = <lfs_update_po>-PurchaseDocument  ) TO mapped-purchaseheader.

    DATA(lref_message) = NEW cl_abap_behv( )->new_message(
                                                     id       =  'ZRISHI_MSG'
                                                     number   = '007'
                                                     severity = if_abap_behv_message=>severity-success
                                                     v1 =  <lfs_update_po>-PurchaseDocument ).
    APPEND VALUE #(
                     purchasedocument =  <lfs_update_po>-PurchaseDocument
                      %msg = lref_message ) TO reported-purchaseheader.


  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD create_header_item.

    DATA: lv_itemno TYPE zpo_item.
    DATA(lv_purchasedoc) = it_purchase_item[ 1 ]-PurchaseDocument.

    DATA: ls_purchase_item TYPE zrishi_poitem.

    "fetch max item no for this po
    SELECT MAX( po_item ) FROM zrishi_poitem
    WHERE po_document EQ @lv_purchasedoc
    INTO @lv_itemno.

    LOOP AT it_purchase_item ASSIGNING FIELD-SYMBOL(<lfs_header>).

      LOOP AT <lfs_header>-%target ASSIGNING FIELD-SYMBOL(<lfs_item_data>).
        GET TIME STAMP FIELD DATA(lv_changetimedate).
        DATA(lv_cid) = <lfs_item_data>-%cid.
        lv_itemno = lv_itemno + 1.
        ls_purchase_item = CORRESPONDING #( <lfs_item_data> MAPPING FROM ENTITY ).
        ls_purchase_item-po_item = lv_itemno .
        ls_purchase_item-change_date_time = lv_changetimedate.
        ls_purchase_item-po_document = <lfs_header>-PurchaseDocument.

        APPEND ls_purchase_item TO lcl_tbuffer=>mt_po_items.

      ENDLOOP.
      APPEND VALUE #( %cid = lv_cid purchasedocument = lv_purchasedoc purchaseitem = lv_itemno ) TO mapped-purchaseitems.

    ENDLOOP.

  ENDMETHOD.

  METHOD rba_Items.
  ENDMETHOD.

  METHOD set_status_process.
    LOOP AT it_purchase_doc ASSIGNING FIELD-SYMBOL(<lfs_purchase_doc>).
      DATA(lv_purchasedoc) = <lfs_purchase_doc>-PurchaseDocument.
      APPEND VALUE #( po_document = condense( lv_purchasedoc ) ) TO lcl_tbuffer=>mt_po_doc.
      APPEND VALUE #( %cid_ref = <lfs_purchase_doc>-%cid_ref purchasedocument = condense( lv_purchasedoc )
                      %param-purchasedocument = condense( lv_purchasedoc )
                        ) TO et_purchase_doc.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZI_RSH_PurchaseItems_U DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE PurchaseItems.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE PurchaseItems.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE PurchaseItems.

    METHODS read FOR READ
      IMPORTING keys FOR READ PurchaseItems RESULT result.

ENDCLASS.

CLASS lhc_ZI_RSH_PurchaseItems_U IMPLEMENTATION.

  METHOD create.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_RSH_PurchaseDoc_U DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS check_before_save REDEFINITION.

*    METHODS finalize          REDEFINITION.

    METHODS save              REDEFINITION.
    METHODS cleanup REDEFINITION.
*    methods initialize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_RSH_PurchaseDoc_U IMPLEMENTATION.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD cleanup.
    CLEAR: lcl_tbuffer=>mt_po_doc,lcl_tbuffer=>mt_po_doc.
  ENDMETHOD.

  METHOD save.
    IF lcl_tbuffer=>mt_purchase_create IS NOT INITIAL OR lcl_tbuffer=>mt_po_items IS NOT INITIAL
    OR lcl_tbuffer=>mt_purchase_update IS NOT INITIAL.
      CALL FUNCTION 'ZRSH_PURCHASE_SAVE'
        EXPORTING
          it_purchase_create = lcl_tbuffer=>mt_purchase_create
          it_purchase_item   = lcl_tbuffer=>mt_po_items
          it_purchase_update = lcl_tbuffer=>mt_purchase_update.

    ENDIF.

    IF lcl_tbuffer=>mt_po_doc IS NOT INITIAL.
      CALL FUNCTION 'ZRSH_SET_PO_STATUS_CLOSE'
        EXPORTING
          it_purchase_doc = lcl_tbuffer=>mt_po_doc.


    ENDIF.
  ENDMETHOD.

ENDCLASS.
