@EndUserText.label: 'Projection on Purchase'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_AFG_PurchaseDocs_Proj as projection on ZI_AFG_PurchaseDocs {
     @UI.facet: [
      {

      id:'PurchaseInfo',
      type:#IDENTIFICATION_REFERENCE,
      label:'Purchase Info',
      purpose: #STANDARD
       },

       {

       id:'ItemInfo',
       type:#LINEITEM_REFERENCE,
       label:'Item Data',
       purpose: #STANDARD,
       targetElement: '_Items'
       }
      ]
      
      @UI.lineItem: [{ position: 10,label: 'Purchase Document' }]
      @UI.identification: [{position: 10,label: 'Purchase Document' }]
  key PurchaseDocument,
      @UI.lineItem: [{ position: 20,label: 'Total Pirce' }]
      @UI.identification: [{ position: 20,label: 'Total Price' }]
      TotalPrice,
      @UI.lineItem: [{ position: 30,label: 'Currency' }]
      @UI.identification: [{ position: 30,label: 'Currency' }]
      
      Currency,
      @UI.lineItem: [{ position: 40,label: 'Description' }]
      @UI.identification: [{ position: 40,label: 'Description' }]
      PurchaseDesc,
      @UI.lineItem: [{ position: 50,label: 'Status' }]
      @UI.identification: [{ position: 50,label: 'Status' }]
      PurchaseStatus,
      @UI.lineItem: [{ position: 60,label: 'Priority' }]
      @UI.identification: [{ position: 60,label: 'Priority' }]
      PurchasePrio,
      @UI.lineItem: [{ position:70,label: 'Created By' }]
      @UI.identification: [{ position: 70,label: 'Created By' }]
      CreatedBy,
      @UI.lineItem: [{ position: 80,label: 'Created on' }]
      @UI.identification: [{ position: 80,label: 'Created on' }]
      CreatedOn,
      @UI.lineItem: [{ position: 90,label: 'Changed By' }]
      @UI.identification: [{ position: 90,label: 'Changed By' }]
      ChangedBy,
      /* Associations */
      //ZI_AFG_PURCHASEDOCS
      _Currency,
      _Items:redirected to composition child ZC_AFG_PURCHASEITEMS_Proj,
      _Priority,
      
      _Status
}
