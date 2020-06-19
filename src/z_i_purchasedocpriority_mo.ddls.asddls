@AbapCatalog.sqlViewName: 'ZIPURCHDOCPR_MO'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Purchase Document Priority'
@Analytics.dataCategory: #DIMENSION
@ObjectModel.resultSet.sizeCategory: #XS

define view Z_I_PURCHASEDOCPRIORITY_MO
  as select from zpurdocprio_mo
{

      @ObjectModel.text.element: ['PriorityText']
      @EndUserText.label: 'Priority'
  key priority     as Priority,

      @Semantics.text: true
      @EndUserText.label: 'Priority Text'
      prioritytext as PriorityText
}
