@AbapCatalog.sqlViewName: 'ZIPURCHORGA_MO'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Organization'
@Analytics.dataCategory: #DIMENSION


define view Z_I_PURORGAN_MO
  as select from zpurchorg_mo
{

      @ObjectModel.text.element: [ 'Description' ]
  key purchasingorganization as PurchasingOrganization,

      @Semantics.text: true
      description            as Description,

      emailaddress           as Email,
      phonenumber            as Phone,
      faxnumber              as Fax

}
