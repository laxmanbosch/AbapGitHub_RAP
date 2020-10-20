@AbapCatalog.sqlViewName: 'ZRSH_POTOTPRICE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Document Total Price'
//@VDM.viewType: #COMPOSITE
define view ZI_RSH_PurchaseTotalPrice as select from ZI_RSH_PurchaseDoc 
{
    //ZI_RSH_PurchaseDoc
    key PurchaseDocument,
    PurchaseDescription,
    sum (_Items.ItemPrice ) as TotalPrice,
    _Items.Currency as Currency,
    Status,
    _Status.text as StatusText,
    Priority,
    _Priority.text as PriorityText,
    CompanyCode,
    
    CreatedBy,
    CreatedDatetime,
    ChangedDateTime,
    /* Associations */
    //ZI_RSH_PurchaseDoc
    _Items,
    _Priority,
    _Status
}group by PurchaseDocument,
    PurchaseDescription,
     Status,
     _Status.text,
    Priority,
    _Priority.text,
    _Items.Currency,
    CompanyCode,
    CreatedBy,
    CreatedDatetime,
    ChangedDateTime;
