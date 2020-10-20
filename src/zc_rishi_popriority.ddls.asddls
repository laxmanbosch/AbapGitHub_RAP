@AbapCatalog.sqlViewName: 'ZRSH_POPRIVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Prioirty F4 Help'
@Search.searchable: true
define view ZC_RISHI_POPriority as select from zrishi_poprio {
    //zrishi_poprio
    @ObjectModel.text.element: ['text']
    key priority,
    @Search.defaultSearchElement: true
    text
}
