@AbapCatalog.sqlViewName: 'ZRSH_POITEMS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Item Details'
define view ZI_RSH_PurchaseItems as select from zrishi_poitem
association[1..1] to ZI_RSH_PurchaseDoc as _Header on $projection.PurchaseDocument = _Header.PurchaseDocument 
association[1..1] to I_Currency as _Currency on $projection.Currency = _Currency.Currency
association[1..1] to I_UnitOfMeasure as _UnitofMeasure on $projection.Unit = _UnitofMeasure.UnitOfMeasure
association[1..*] to ZI_Rishi_Vendor as _Vendor on $projection.Vendor = _Vendor.VendorId
{
    //zrishi_poitem
    key po_document as PurchaseDocument,
    key po_item as PurchaseItem,
    item_desc as ItemDescription,
    price * quantity as ItemPrice,
    vendor as Vendor,
    price as Price,
    currency as Currency,
    quantity as Quantity,
    unit as Unit,
    change_date_time as ChangeDateTime,
    
    _Header,
    _Currency,
    _UnitofMeasure,
    _Vendor
   
}
