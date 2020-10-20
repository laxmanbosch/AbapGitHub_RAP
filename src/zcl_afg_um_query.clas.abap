CLASS zcl_afg_um_query DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_afg_um_query IMPLEMENTATION.
  METHOD if_rap_query_provider~select.
*//Your code here
*select po_document,
    CASE io_request->get_entity_id( ).
      WHEN 'ZC_AFG_QUERY_U'.

        "Response with count.
        IF io_request->is_total_numb_of_rec_requested(  ).
          SELECT COUNT( * ) FROM zrishi_podoc INTO @DATA(lv_count).
          io_response->set_total_number_of_records( lv_count ).

        ENDIF.
        "Response with data.
        IF io_request->is_data_requested(  ).
          "Requested elements
          DATA(lt_req_elements) = io_request->get_requested_elements(  ).
          DATA(lv_req_elements) = concat_lines_of( table = lt_req_elements sep = ',' ).

          "get filter as SQL string.
          DATA(lv_sql_filter) = io_request->get_filter(  )->get_as_sql_string(  ).

          "Paging to restricted number records to be sent to UI.
          DATA(lv_offset) = io_request->get_paging( )->get_offset( ).
          DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).
          DATA(lv_max_rows) = COND #( WHEN lv_page_size = if_rap_query_paging=>page_size_unlimited
                                      THEN 0 ELSE lv_page_size ).
*          **search
          DATA(lv_search_string) = io_request->get_search_expression( ).
          DATA(lv_search_sql) = |PO_DESC LIKE '%{ cl_abap_dyn_prg=>escape_quotes( lv_search_string ) }%'|.

          "Finalizing the filter
          IF lv_sql_filter IS INITIAL.
            lv_sql_filter = lv_search_sql.
          ELSE.
            lv_sql_filter = | ( { lv_sql_filter } AND { lv_search_sql } )|.
          ENDIF.

          DATA: lt_purchase_docs TYPE STANDARD TABLE OF zrishi_podoc.

          SELECT (lv_req_elements)
                 FROM zrishi_podoc
                 WHERE (lv_sql_filter)
                 ORDER BY po_document
                 INTO CORRESPONDING FIELDS OF TABLE @lt_purchase_docs
                 OFFSET @lv_offset UP TO @lv_max_rows ROWS.
          io_response->set_data( lt_purchase_docs ).
*          cl_dd_ddl_annotation_service

        ENDIF.

    ENDCASE..
  ENDMETHOD.

ENDCLASS.
