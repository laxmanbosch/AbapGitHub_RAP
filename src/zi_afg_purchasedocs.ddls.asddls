@AbapCatalog.sqlViewName: 'ZAFG_PO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Docs'
define root view ZI_AFG_PurchaseDocs as select from ZI_Rishi_PurchaseDocTotalPrice 
composition[0..*] of ZI_AFG_PurchaseItems as _Items{
    //ZI_Rishi_PurchaseDocTotalPrice
    key PurchaseDocument,
    TotalPrice,
    Currency,
    PurchaseDesc,
    PurchaseStatus,
    PurchasePrio,
    CreatedBy,
    CreatedOn,
    ChangedBy,
    /* Associations */
    //ZI_Rishi_PurchaseDocTotalPrice
    _Currency,
    _Priority,
    _Items,
    _Status
}
