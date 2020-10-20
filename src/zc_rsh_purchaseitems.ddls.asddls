@AbapCatalog.sqlViewName: 'ZRSH_POITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Document Items'
define view ZC_RSH_PurchaseItems as select from ZI_RSH_PurchaseItems {
    //ZI_RSH_PurchaseItems
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
    //ZI_RSH_PurchaseItems
    _Currency,
    _Header,
    _UnitofMeasure,
    _Vendor
}
