@AbapCatalog.sqlViewName: 'ZRSH_POITEM_U'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Items'
define view ZI_RSH_PurchaseItems_U as select from ZI_RSH_PurchaseItems 
association to parent ZI_RSH_PurchaseDoc_U as _Header on $projection.PurchaseDocument = _Header.PurchaseDocument{
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
