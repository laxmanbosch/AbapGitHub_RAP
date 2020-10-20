INTERFACE zrsh_if_rap_batch1_types
  PUBLIC .
  TYPES: BEGIN OF lty_purchase_header.
           INCLUDE TYPE ZI_RSH_PurchaseDoc_U AS data.
  TYPES:END OF lty_purchase_header.

  TYPES: BEGIN OF lty_po_doc,
         po_document TYPE zebeln,
         END OF lty_po_doc.

  TYPES: tt_po_doc TYPE TABLE of lty_po_doc.

TYPES: tt_po_header_db TYPE TABLE of zrishi_podoc,
       ts_po_header_db TYPE zrishi_podoc .

TYPES: tt_po_item_db TYPE TABLE of zrishi_poitem.

TYPES: tt_purchase_create TYPE TABLE of lty_purchase_header.
       TYPES: ts_purchase_create TYPE lty_purchase_header.
ENDINTERFACE.
