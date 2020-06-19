@AbapCatalog.sqlViewName: 'ZIPURDOCITEM_MO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Document Item'

define view Z_I_PURCHASEDOC_ITEM_MO
  as select from zpurdocitem_mo
  association [1..1] to Z_I_PURCHASEDOC_MO as _PurchaseDocument      on $projection.PurchaseDocument = _PurchaseDocument.purchasedocument
  association [0..1] to I_UnitOfMeasure    as _QuantityUnitOfMeasure on $projection.QuantityUnit = _QuantityUnitOfMeasure.UnitOfMeasure
  association [0..1] to Z_I_VENDORTYPE_MO  as _VendorType            on $projection.VendorType = _VendorType.VendorType
  association [0..1] to I_Currency         as _Currency              on $projection.Currency = _Currency.Currency
{
      @ObjectModel.text.element: ['Description']
  key purchasedocumentitem         as PurchaseDocumentItem,
      //      @ObjectModel.foreignKey.association: '_PurchaseDocument'
  key purchasedocument             as PurchaseDocument,
      @Semantics.text: true
      description                  as Description,
      vendor                       as Vendor,
      vendortype                   as VendorType,
      @Semantics.amount.currencyCode: 'Currency'
      price                        as Price,
      @Semantics.currencyCode: true
      //      @ObjectModel.foreignKey.association: '_Currency'
      currency                     as Currency,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      //      @DefaultAggregation: #NONE
      quantity                     as Quantity,
      @Semantics.unitOfMeasure: true
      //      @ObjectModel.foreignKey.association: '_QuantityUnitOfMeasure'
      quantityunit                 as QuantityUnit,


      @Semantics.amount.currencyCode: 'Currency'
      //      @DefaultAggregation: #NONE
      quantity * price             as OverallItemPrice,

      //      @Semantics.imageUrl: true
      purchasedocumentitemimageurl as PurchaseDocumentItemImageURL,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,
      // Associations
      _PurchaseDocument,
      _QuantityUnitOfMeasure,
      _Currency,
      _VendorType
}
