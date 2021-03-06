@AbapCatalog.sqlViewName: 'ZIPURDOCITEMUMO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Document Item Unamanaged'
//@ObjectModel.writeActivePersistence: 'ZPURCHDOCITEM'
//@VDM.viewType: #COMPOSITE
define view Z_I_PURCHASEDOC_ITEM_U_MO
  as select from Z_I_PURCHASEDOC_ITEM_MO
  association to parent Z_I_PURDOCUMENT_U_MO as _PurchaseDocument on $projection.PurchaseDocument = _PurchaseDocument.purchasedocument
{

  key PurchaseDocumentItem,
  key PurchaseDocument,
      Description,
      Vendor,
      VendorType,
      Price,
      Currency,
      Quantity,
      QuantityUnit,
      OverallItemPrice,
      PurchaseDocumentItemImageURL,

      // BOPF Admin Data
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      /* Associations */
      _Currency,
      _PurchaseDocument,
      _QuantityUnitOfMeasure,
      _VendorType
}
