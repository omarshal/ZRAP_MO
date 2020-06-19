@AbapCatalog.sqlViewName: 'ZIPURDOC_MO'
@EndUserText.label: 'Purchase Document'
@AccessControl.authorizationCheck: #CHECK
//@VDM.viewType: #BASIC
//@ObjectModel.representativeKey: 'PurchaseDocument'
//@ObjectModel.semanticKey: ['PurchaseDocument']
define view Z_I_PURCHASEDOC_MO
  as select from zpurdocum_mo
  association [0..*] to Z_I_PURCHASEDOC_ITEM_MO    as _PurchaseDocumentItem   on $projection.purchasedocument = _PurchaseDocumentItem.PurchaseDocument
  association [0..1] to Z_I_PURCHASEDOCPRIORITY_MO as _Priority               on $projection.Priority = _Priority.Priority
  association [0..1] to Z_I_PURCHASEDOCSTATUS_MO   as _Status                 on $projection.Status = _Status.Status
  association [0..1] to Z_I_PURORGAN_MO            as _PurchasingOrganization on $projection.PurchasingOrganization = _PurchasingOrganization.PurchasingOrganization
{
      @ObjectModel.text.element: ['Description']
  key purchasedocument,
      @Semantics.text: true
      description              as Description,
      //      @ObjectModel.foreignKey.association: '_Status'
      status                   as Status,
      //      @ObjectModel.foreignKey.association: '_Priority'
      priority                 as Priority,
      //      @ObjectModel.foreignKey.association: '_PurchasingOrganization'
      purchasingorganization   as PurchasingOrganization,
      //      @Semantics.imageUrl: true
      purchasedocumentimageurl as PurchaseDocumentImageURL,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      // Associations _PurchaseDocumentItem, _Priority, _Status, _PurchasingOrganization
      _PurchaseDocumentItem,
      _Priority,
      _Status,
      _PurchasingOrganization
}
