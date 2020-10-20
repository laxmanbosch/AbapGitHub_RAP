CLASS lhc_ZI_AFG_PurchaseItems DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR PurchaseItems~calculateTotalPrice.

ENDCLASS.

CLASS lhc_ZI_AFG_PurchaseItems IMPLEMENTATION.

  METHOD calculateTotalPrice.
    DATA(lv_test) = abap_true.

    READ ENTITIES OF ZI_AFG_PurchaseDocs
    ENTITY PurchaseDoc
     FROM VALUE #( FOR lv_purchase_doc IN
     keys ( purchasedocument = lv_purchase_doc  %control-currency = if_abap_behv=>mk-on  )  )
     RESULT DATA(lt_purchase_doc).

  ENDMETHOD.

ENDCLASS.
