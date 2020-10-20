@EndUserText.label: 'Projection on Purchase Items'
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_AFG_PURCHASEITEMS_Proj as projection on ZI_AFG_PurchaseItems {
      //ZI_AFG_PURCHASEITEMS
      @UI.facet: [
      {

      id:'ItemData',
      purpose: #STANDARD,
      type:#IDENTIFICATION_REFERENCE,
      label:'Item Info'
        }

      ]
      @UI.lineItem: [{ position: 10,label: 'Purchase Document' }]
      @UI.identification: [{ position: 10,label: 'Purchase Document' }]
  key PurchaseDocument,
      @UI.lineItem: [{ position: 20,label: 'Purchase Item' }]
      @UI.identification: [{ position: 10,label: 'Purchase Item' }]
  key PurchaseItem,
      @UI.lineItem: [{ position: 30,label: 'Item Description' }]
      @UI.identification: [{ position: 30,label: 'Item Description' }]
      ItemDesc,
      @UI.lineItem: [{ position: 40,label: 'Vendor' }]
      @UI.identification: [{ position: 40,label: 'Vendor' }]
      Vendor,
      @UI.lineItem: [{ position: 50,label: 'Price' }]
      @UI.identification: [{ position: 50,label: 'Price' }]
      Price,
      @UI.lineItem: [{ position: 60,label: 'Total Price' }]
      @UI.identification: [{ position: 60,label: 'Total Price' }]
      TotalPrice,
      @UI.lineItem: [{ position: 70,label: 'Currency' }]
      @UI.identification: [{ position: 70,label: 'Currency' }]
      Currency,
      @UI.lineItem: [{ position: 80,label: 'Quantity' }]
      @UI.identification: [{ position: 80,label: 'Quantity' }]
      Quantity,
      @UI.lineItem: [{ position: 90,label: 'Unit' }]
      @UI.identification: [{ position: 90,label: 'Unit' }]
      Unit,
      @UI.lineItem: [{ position: 91,label: 'Changed On' }]
      @UI.identification: [{ position: 92,label: 'Changed On' }]
      ChangeDateTime,
      /* Associations */
      //ZI_AFG_PURCHASEITEMS
      _Currency,
      _PurchaseHeader:redirected to parent ZC_AFG_PurchaseDocs_Proj,
      _QuantityMeasure,
      _Vendor
}
