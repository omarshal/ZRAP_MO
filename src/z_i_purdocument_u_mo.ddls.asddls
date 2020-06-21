@AbapCatalog.sqlViewName: 'ZIPURDOCUMO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Document Unamanaged'
//@ObjectModel.modelCategory: #BUSINESS_OBJECT
//@ObjectModel.compositionRoot: true
//@ObjectModel.writeActivePersistence: 'ZPURCHDOCUMENT'
//@VDM.viewType: #COMPOSITE
define root view Z_I_PURDOCUMENT_U_MO
  as select from Z_I_PURCHDOCOVPRICE_MO
  composition [0..*] of Z_I_PURCHASEDOC_ITEM_U_MO as _PurchaseDocumentItem
  association [0..1] to Z_I_INDICATOR_MO          as _IsApprovalRequired   on $projection.IsApprovalRequired = _IsApprovalRequired.IndicatorValue
{
  key purchasedocument,
      Description,
      Status,
      Priority,
      //      @ObjectModel.foreignKey.association: '_IsApprovalRequired'
      case when OverallPrice > 1000 then 'X' else '' end as IsApprovalRequired,

      case when OverallPrice >= 0 and OverallPrice < 1000 then 3
      when OverallPrice >= 1000 and OverallPrice <= 10000 then 2
      when OverallPrice > 10000 then 1
      else 0 end as OverallPriceCriticality,

      OverallPrice,
      Currency,
      PurchasingOrganization,
      PurchaseDocumentImageURL,

      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      /* Associations */
      _PurchaseDocumentItem,
      _Currency,
      _Priority,
      _Status,
      _IsApprovalRequired,
      _PurchasingOrganization

}
