@EndUserText.label: 'Projection on Purchase Items'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_RSH_POITEM_VALDET_M as projection on ZI_RISHI_POITEM_VALDET_M
 {
    //ZI_RSH_PurchaseItems_U
    key PurchaseDocument,
    key PurchaseItem,
    ItemDesc,
    TotalPrice,
    Vendor,
    Price,
    Currency,
    Quantity,
    Unit,
    ChangeDateTime,
    /* Associations */
    //ZI_RSH_PurchaseItems_U
    _Currency,
    _POHeader: redirected to parent ZC_RISHI_PO_VALDET_DEMO,
    
    _QuantityMeasure,
    _Vendor
}
