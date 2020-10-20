@AbapCatalog.sqlViewName: 'ZAFG_POITEMS'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Items'
define  view  ZI_AFG_PurchaseItems as select from ZI_Rishi_PurchaseItems 
association to parent ZI_AFG_PurchaseDocs as _PurchaseHeader on $projection.PurchaseDocument = _PurchaseHeader.PurchaseDocument
{
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
