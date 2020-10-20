@AbapCatalog.sqlViewName: 'ZRSH_PODOC_U'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Document Report'
define root view ZI_RSH_PurchaseDoc_U as select from ZI_RSH_PurchaseTotalPrice 
 composition[0..*] of ZI_RSH_PurchaseItems_U as _Items
 {
    //ZI_RSH_PurchaseTotalPrice
    key PurchaseDocument,
    PurchaseDescription,
    TotalPrice,
    
    
    case when TotalPrice >= 0 and TotalPrice < 250 then 3
    when TotalPrice >=250 and TotalPrice < 500 then 2
    when TotalPrice >= 500 then 1
    else 0 end as PriceCriticality,
    
    case when TotalPrice >= 500 then 'Yes'
    else 'No' end as IsApprovalRequired,
     
    Currency,
    Status,
    StatusText,
    Priority,
    PriorityText,
    CompanyCode,
    CreatedBy,
    CreatedDatetime,
    ChangedDateTime,
    /* Associations */
    //ZI_RSH_PurchaseTotalPrice
    _Priority,
    _Items,
    _Status
}
