@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Intercface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z360_I_TRAVEL_MFA
provider contract transactional_interface 
  as projection on z360_r_travel_mfa
  
{
  key TravelUuid,
      TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking: redirected to composition child Z360_I_BOOKING_MFA,
      _Currency,
      _Customer,
      _OverallStatus
}
