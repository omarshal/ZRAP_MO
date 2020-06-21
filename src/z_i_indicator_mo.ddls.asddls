@AbapCatalog.sqlViewName: 'ZIINDICATORMO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Indicator view'
define view Z_I_INDICATOR_MO as select from zindicator_mo {
    key indicatorvalue as IndicatorValue,
        indicatortext  as IndicatorText
}
