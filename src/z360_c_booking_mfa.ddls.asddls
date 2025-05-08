@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking -Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity Z360_C_BOOKING_MFA
  as projection on z360_r_booking_mfa
{
  key BookingUuid,
      TravelUuid,

      @Search.defaultSearchElement: true
      BookingId,
      BookingDate,

      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer_StdVH', element: 'CustomerID' }, useForValidation: true }]
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName        as CustomerName,

      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH', element: 'AirlineID' },

                                                            additionalBinding: [{ localElement: 'ConnectionId',
                                                                                  element: 'ConnectionID',
                                                                                  usage: #RESULT },

                                                                                  { localElement: 'FlightDate',
                                                                                  element: 'FlightDate',
                                                                                  usage: #RESULT },

                                                                                  { localElement: 'FlightPrice',
                                                                                  element: 'Price',
                                                                                  usage: #RESULT },

                                                                                  { localElement: 'CurrencyCode',
                                                                                  element: 'CurrencyCode',
                                                                                  usage: #RESULT }],

                                                            useForValidation: true }]
      @ObjectModel.text.element: [ 'CarrierName' ]
      AirlineId,
      _Carrier.Name             as CarrierName,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH', element: 'ConnectionID' },

                                                            additionalBinding: [{ localElement: 'AirlineId',
                                                                                  element: 'AirlineID',
                                                                                  usage: #FILTER_AND_RESULT },

                                                                                  { localElement: 'FlightDate',
                                                                                  element: 'FlightDate',
                                                                                  usage: #RESULT },

                                                                                  { localElement: 'FlightPrice',
                                                                                  element: 'Price',
                                                                                  usage: #RESULT },

                                                                                  { localElement: 'CurrencyCode',
                                                                                  element: 'CurrencyCode',
                                                                                  usage: #RESULT }],

                                                            useForValidation: true }]
      ConnectionId,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH', element: 'FlightDate' },

                                                            additionalBinding: [{ localElement: 'AirlineId',
                                                                                  element: 'AirlineID',
                                                                                  usage: #FILTER_AND_RESULT },

                                                                                  { localElement: 'ConnectionId',
                                                                                  element: 'ConnectionID',
                                                                                  usage: #FILTER_AND_RESULT },

                                                                                  { localElement: 'FlightPrice',
                                                                                  element: 'Price',
                                                                                  usage: #RESULT },

                                                                                  { localElement: 'CurrencyCode',
                                                                                  element: 'CurrencyCode',
                                                                                  usage: #RESULT }],

                                                            useForValidation: true }]
      FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' }, useForValidation: true }]
      CurrencyCode,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Booking_Status_VH', element: 'BookingStatus' }, useForValidation: true }]
      @ObjectModel.text.element: [ 'BookingStatusText' ]
      BookingStatus,
      _BookingStatus._Text.Text as BookingStatusText : localized,


      LocalLastChangedAt,
      /* Associations */
      _Bksuppl : redirected to composition child Z360_C_BKSUPPL_MFA,
      _BookingStatus,
      _Carrier,
      _Connection,
      _Customer,
      _Travel: redirected to parent Z360_C_TRAVEL_MFA
}
