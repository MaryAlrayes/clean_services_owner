// ignore_for_file: constant_identifier_names

enum NavigationLabelsDrawer {
  comingOrders,
  profile,
  statistics,
  settings,
}

enum OrderType{
  oneWay,
  twoWay
}

enum OrderStatus {
  all,

  pending_laundry_acceptance,

  //accept and reject from laundry

  pending_acceptance_delivery,

  //accept btn from delivery

  onWay_to_recieve_from_client,

  //recieved btn from delivery

  onWay_to_deliver_to_laundry,

  //recieved btn from laundry

  pre_processing,

  //start from laundry

  processing,

  //done from laundry

  ready_to_deliver,//---> one way (done from laundry)


  //ask delivery to take them from laundry

  pending_acceptance_from_delivery_to_recieve_from_laundry,

  //okay from delivery to recieve from laundry

  onWay_to_recieve_from_laundry,

  //done from laundry

  onWay_to_deliver_to_client,

  //delivery done(two way) or laundry done(one way)
  recieved,
}


enum ItemWeight { heavy, light }


enum UserLevels{
  bronze,
  silver,
  gold,
  diamond,

}

enum OfferStatus{
  accepted,
  pending,
}
