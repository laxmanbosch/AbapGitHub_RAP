@AbapCatalog.sqlViewName: 'ZRSH_POPRIO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Document Priority Basic View'
define view ZI_RSH_PurchasePriority as select from zrishi_poprio {
    //zrishi_poprio
    key priority,
    text
}
