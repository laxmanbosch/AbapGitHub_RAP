@EndUserText.label: 'Unmanaged Query'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_AFG_UM_QUERY'
@Search.searchable: true
define root custom entity ZC_AFG_Query_U 

{
@UI.lineItem: [{ position: 10,label: 'Purchase Document' }]
@UI.selectionField: [{ position: 10 }]
  key po_document : zpurchasedocumentdtel;
  @UI.lineItem: [{ position: 20,label: 'Purchase Desc' }]
@UI.selectionField: [{ position: 20 }]
  @Search.defaultSearchElement: true
  po_desc : zpo_desc;
  @UI.lineItem: [{ position: 30,label: 'Status' }]
  @UI.selectionField: [{ position: 30 }]
  po_status : zpo_status;
  @UI.lineItem: [{ position: 50,label: 'Prioirty' }]
  po_priority : zpo_priority;
  @UI.lineItem: [{ position: 60,label: 'Priority Text' }]
  create_by : zcreated_by;
  @UI.lineItem: [{ position: 80,label: 'Create On' }]
  created_date_time : timestampl;
  

  
}
