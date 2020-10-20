@AbapCatalog.sqlViewName: 'ZRSH_PODOC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Document Details'
//@VDM.viewType: #BASIC
define view ZI_RSH_PurchaseDoc as select from zrishi_podoc 
association[0..*] to ZI_RSH_PurchaseItems as _Items on $projection.PurchaseDocument = _Items.PurchaseDocument
association[0..1] to ZI_RSH_PurchaseStatus as _Status on $projection.Status = _Status.status
association[0..1] to ZI_RSH_PurchasePriority as _Priority on $projection.Priority = _Priority.priority
{
    //zrishi_podoc
    key po_document as PurchaseDocument,
    po_desc as PurchaseDescription,
    po_status as Status,
    po_priority as Priority,
    ccode as CompanyCode,
    create_by as CreatedBy,
    created_date_time as CreatedDatetime,
    changed_date_time as ChangedDateTime,
    
    _Items,
    _Priority,
    _Status
}
