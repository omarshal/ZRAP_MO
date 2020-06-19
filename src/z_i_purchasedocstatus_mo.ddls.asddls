@AbapCatalog.sqlViewName: 'ZIPURDOCSTAT_MO'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Purchase Document Status'
@Analytics.dataCategory: #DIMENSION
@ObjectModel.resultSet.sizeCategory: #XS

define view Z_I_PURCHASEDOCSTATUS_MO
  as select from zpurdocstatus_mo
{

      @ObjectModel.text.element: ['StatusText']
      @EndUserText.label: 'Status'
  key status     as Status,

      @Semantics.text: true
      @EndUserText.label: 'Status Text'
      statustext as StatusText
}
