@AbapCatalog.sqlViewName: 'ZCPENDINGAPR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Pending for Approval'
@Metadata.allowExtensions: true
define view ZC_Rishi_PO_PendingAppr_OVP as select from ZI_RISHI_PURCHASEDOC_U {
    //ZI_RISHI_PURCHASEDOC_U
    key PurchaseDocument,
    TotalPrice,
    PoPriceCriticality,
    IsApprovalReqiored,
    Currency,
    PurchaseDesc,
    PurchaseStatus,
    PurchasePrio,
    CreatedBy,
    CreatedOn,
    ChangedBy,
    /* Associations */
    //ZI_RISHI_PURCHASEDOC_U
    _Currency,
    _Priority,
    _PurchaseItems,
    _Status
}where IsApprovalReqiored = 'X' and TotalPrice > 1000
