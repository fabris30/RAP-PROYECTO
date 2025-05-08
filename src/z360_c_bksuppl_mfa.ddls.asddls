@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking supplements- Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity Z360_C_BKSUPPL_MFA
  as projection on z360_r_bksuppl_mfa
{
  key BooksupplUuid,
      TraverlUuid,
      BookingUuid,

      @Search.defaultSearchElement: true
      BookingSupplementId,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Supplement_StdVH', element: 'SupplementID' },
                                                     additionalBinding: [{ localElement: 'Price',
                                                                                  element: 'Price',
                                                                                  usage: #FILTER_AND_RESULT },

                                                                                  { localElement: 'CurrencyCode',
                                                                                  element: 'CurrencyCode',
                                                                                  usage: #FILTER_AND_RESULT }],
                                                     useForValidation: true }]
      @ObjectModel.text.element: [ 'SupplementDescription' ]
      SupplementId,
      _SupplementText.Description as SupplementDescription : localized,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' }, useForValidation: true }]
      CurrencyCode,
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent Z360_C_BOOKING_MFA,
      _Product,
      _SupplementText,
      _Travel : redirected to Z360_C_TRAVEL_MFA
}
