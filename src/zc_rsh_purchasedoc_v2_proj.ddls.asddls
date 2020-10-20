@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Doc Business Object'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_RSH_PurchaseDoc_V2_Proj
  as projection on ZI_RSH_PurchaseDoc_U
{

      @ObjectModel.text.element: ['PurchaseDescription']
  key PurchaseDocument,
      @Semantics.text: true

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.70
      @Search.ranking: #HIGH
      PurchaseDescription,
      @Semantics.amount.currencyCode: 'Currency'
      TotalPrice,
      @ObjectModel.text.element: ['StatusText']
      @Consumption.valueHelpDefinition: [{ entity:{ name:'zc_rishi_POStatusVH',element: 'status' } }]
      //      @Consumption.filter.mandatory: true
      //    @Consumption.defaultValue: '1'

      Status,
      @Semantics.text: true
      StatusText,

      @ObjectModel.text.element: ['PriorityText']
      Priority,
      @Semantics.text: true
      PriorityText,
      CompanyCode,
      PriceCriticality,
      IsApprovalRequired,
      CreatedBy,
      @Semantics.currencyCode: true
      Currency,
      CreatedDatetime,
      ChangedDateTime,
      /* Associations */
      //ZI_RSH_PurchaseTotalPrice
      
      _Items:redirected to composition child ZC_RSH_PurchaseItems_V2_Proj,
      _Priority,
      _Status
}
