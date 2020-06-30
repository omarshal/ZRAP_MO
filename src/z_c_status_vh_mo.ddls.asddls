@AbapCatalog.sqlViewName: 'ZCSTATUSVHMO'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Status'

@Search.searchable: true

@ObjectModel.semanticKey:  [ 'status' ]
//@ObjectModel.representativeKey: ['status']
//@VDM.viewType: #CONSUMPTION

@ObjectModel.resultSet.sizeCategory: #XS
//@ObjectModel.dataCategory: #VALUE_HELP
define view Z_C_STATUS_VH_MO as select from Z_I_PURCHASEDOCSTATUS_MO {
@ObjectModel.text.element: ['StatusText']
key Status,
@Search: { defaultSearchElement: true, ranking: #HIGH, fuzzinessThreshold: 0.7 }
    StatusText
}
