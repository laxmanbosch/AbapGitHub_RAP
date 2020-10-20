CLASS zcl_rishi_demo_github DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  methods: get_invoice_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rishi_demo_github IMPLEMENTATION.
  METHOD get_invoice_data.
data(lv_test) = abap_true.
  ENDMETHOD.

ENDCLASS.
