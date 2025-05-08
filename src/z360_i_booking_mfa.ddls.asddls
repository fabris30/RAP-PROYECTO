@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z360_I_BOOKING_MFA
  as projection on z360_r_booking_mfa
{
  key BookingUuid,
      TravelUuid,
      BookingId,
      BookingDate,
      CustomerId,
      AirlineId,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _Bksuppl : redirected to composition child Z360_I_BKSUPPL_MFA,
      _BookingStatus,
      _Carrier,
      _Connection,
      _Customer,
      _Travel  : redirected to parent Z360_I_TRAVEL_MFA
}
