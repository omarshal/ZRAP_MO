@AbapCatalog.sqlViewName: 'ZPRCHVNDRTYPE_MO'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Vendor Type'
@Analytics.dataCategory: #DIMENSION
@ObjectModel.resultSet.sizeCategory: #XS
define view Z_I_VENDORTYPE_MO   as select from zpurvendtyp_mo
{

      @ObjectModel.text.element: ['VendorTypeText']
      @EndUserText.label: 'Vendor Type'
  key vendortype     as VendorType,

      @Semantics.text: true
      @EndUserText.label: 'Vendor Type Text'
      vendortypetext as VendorTypeText
}
