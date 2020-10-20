@AbapCatalog.sqlViewName: 'ZCRSH_OVPFILTER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Filter Bar for OVP'
define view ZC_RISHI_POFilter_OVP1
  as select from ZI_Rishi_PurchaseDoc
{

  key PurchaseDocument,

       @UI.selectionField: [{ position: 10 }]
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZC_RISHI_POPriority',element: 'priority' } }]
      ' ' as Priority,
      @UI.selectionField: [{ position: 20 }]
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'zc_rishi_POStatusVH',element: 'status' } }]
      ' ' as Status
}
