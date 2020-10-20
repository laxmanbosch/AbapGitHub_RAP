@AbapCatalog.sqlViewName: 'ZRSH_POSTATUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Status Basic Viwe'
define view ZI_RSH_PurchaseStatus as select from zrishi_postatus {
    //zrishi_postatus
    key status,
    text
}
