@EndUserText.label: 'Projection on Purchase Items'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_RSH_PurchaseItems_V2_Proj as projection on ZI_RSH_PurchaseItems_U {
    //ZI_RSH_PurchaseItems_U
    key PurchaseDocument,
    key PurchaseItem,
    ItemDescription,
    ItemPrice,
    Vendor,
    Price,
    Currency,
    Quantity,
    Unit,
    ChangeDateTime,
    /* Associations */
    //ZI_RSH_PurchaseItems_U
    _Currency,
    _Header: redirected to parent ZC_RSH_PurchaseDoc_V2_Proj,
    
    _UnitofMeasure,
    _Vendor
}
