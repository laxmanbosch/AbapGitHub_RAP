@AbapCatalog.sqlViewName: 'ZRSH_POREPORT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Document Report'
@Metadata.allowExtensions: true
@Search.searchable: true
define view ZC_RSH_PurchaseDocReport
  as select from ZI_RSH_PurchaseTotalPrice
{
      //ZI_RSH_PurchaseTotalPrice
      @ObjectModel.text.element: ['PurchaseDescription']
  key PurchaseDocument,
      @Semantics.text: true

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.70
      @Search.ranking: #HIGH
      PurchaseDescription,
      TotalPrice,
      @ObjectModel.text.element: ['StatusText']
      @Consumption.valueHelpDefinition: [{ entity:{ name:'zc_rishi_POStatusVH',element: 'status' } }]
      Status,
      @Semantics.text: true
      StatusText,

      @ObjectModel.text.element: ['PriorityText']
      Priority,
      @Semantics.text: true
      PriorityText,
      CompanyCode,
      CreatedBy,
      CreatedDatetime,
      ChangedDateTime,
      /* Associations */
      //ZI_RSH_PurchaseTotalPrice
      _Items,
      _Priority,
      _Status
}
