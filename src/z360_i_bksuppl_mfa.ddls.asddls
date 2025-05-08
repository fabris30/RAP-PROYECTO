@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking supplements- Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z360_I_BKSUPPL_MFA
  as projection on z360_r_bksuppl_mfa
{
  key BooksupplUuid,
      TraverlUuid,
      BookingUuid,
      BookingSupplementId,
      SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent Z360_I_BOOKING_MFA,
      _Product,
      _SupplementText,
      _Travel  : redirected to Z360_I_TRAVEL_MFA
}
