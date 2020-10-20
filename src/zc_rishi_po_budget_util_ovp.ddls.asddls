@AbapCatalog.sqlViewName: 'ZCPO_BUDGETOVP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Order Budget Utilization'
@Metadata.allowExtensions: true
define view ZC_Rishi_PO_Budget_Util_OVP
  as select from ZI_Rishi_PurchaseDocTotalPrice
{
      //ZI_Rishi_PurchaseDocTotalPrice
  key PurchaseDocument,
      TotalPrice,
      Currency,
      PurchaseDesc,
      PurchaseStatus,
      PurchasePrio,
      CreatedBy,
      CreatedOn,
      ChangedBy,
//      @Semantics.quantity.unitOfMeasure: 'Percentage'
      cast( division(TotalPrice * 100, 1000, 2) as abap.int2 ) as BudgentUsage,
//      @Semantics.unitOfMeasure: true
//      cast( ' % ' as abap.unit( 3 ))                              as Percentage,
      /* Associations */
      //ZI_Rishi_PurchaseDocTotalPrice
      _Currency,
      _Priority,
      _PurchaseItems,
      _Status
}where PurchaseDocument != ''
