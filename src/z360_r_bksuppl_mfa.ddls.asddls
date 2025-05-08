@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking supplements- Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z360_r_bksuppl_mfa
  as select from z360_bksuppl_mfa
  association to parent z360_r_booking_mfa as _Booking on $projection.BookingUuid = _Booking.BookingUuid
  association [1..1] to z360_r_travel_mfa as _Travel on $projection.TraverlUuid = _Travel.TravelUuid
  
  association [1..1] to /DMO/I_Supplement         as _Product        on $projection.SupplementId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText     as _SupplementText on $projection.SupplementId = _SupplementText.SupplementID
  
{
  key booksuppl_uuid        as BooksupplUuid,
      root_uuid             as TraverlUuid,
      parent_uuid           as BookingUuid,
      booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      //local Etag field
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt, 
      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
