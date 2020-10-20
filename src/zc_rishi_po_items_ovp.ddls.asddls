@AbapCatalog.sqlViewName: 'ZCPOITEM_OVP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Item Details OVP'
@Metadata.allowExtensions: true
define view ZC_Rishi_PO_Items_OVP as select from ZI_Rishi_PurchaseItems {
    //ZI_Rishi_PurchaseItems
    key PurchaseDocument,
    key PurchaseItem,
    ItemDesc,
    Vendor,
    Price,
    TotalPrice,
    Currency,
    Quantity,
    Unit,
    ChangeDateTime,
    /* Associations */
    //ZI_Rishi_PurchaseItems
    _Currency,
    _PurchaseHeader,
    _QuantityMeasure,
    _Vendor
}
