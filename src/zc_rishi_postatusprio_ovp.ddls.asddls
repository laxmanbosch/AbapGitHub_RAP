@AbapCatalog.sqlViewName: 'ZC_POSTPRIO_OVP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'POs by Status & Priority OVP Donut Chart'
@Metadata.allowExtensions: true
define view zc_rishi_postatusprio_ovp
  as select from ZI_Rishi_PurchaseDoc
{
      //ZI_Rishi_PurchaseDoc
  key PurchaseDocument,
      PurchaseDesc,
      PurchaseStatus,
      _Status.text   as StatusText,
      PurchasePrio,
      _Priority.text as PriorityText,
      @Aggregation.default: #SUM
      1              as SumofDocuments,
      /* Associations */
      //ZI_Rishi_PurchaseDoc
      _Priority,
      _Status
}
