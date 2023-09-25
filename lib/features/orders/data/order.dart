// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:saudi_clean_services_owner/features/orders/data/service.dart';

class Order extends Equatable {
  final String id;
  final OrderStatus orderStatus;
  final String user = 'اسم المستخدم';
  final OrderType orderType ;
  final List<Service> services;
  final num price = 135;
  Order({
    required this.id,
    required this.orderStatus,
    this.orderType=OrderType.twoWay,
    required this.services,
  });
  @override
  List<Object?> get props => [orderStatus, id, user];
}

List<Order> orders = [
  Order(
    id: '123',
    orderStatus: OrderStatus.pre_processing,
    services: [
      Service(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20),
      Service(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45),
      Service(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20),
      Service(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20),
      Service(
          serviceId: '5',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'طقم',
          price: 30),
    ],
  ),
  Order(id: '334', orderStatus: OrderStatus.processing,
  services: [
    Service(
        serviceId: '1',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'كنزة',
        price: 20),
    Service(
        serviceId: '2',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'بنطلون',
        price: 45),
    Service(
        serviceId: '3',
        serviceType: [
          'كوي',
        ],
        item: 'كنزة',
        price: 20),
    Service(
        serviceId: '4',
        serviceType: [
          'غسيل',
        ],
        item: 'جاكيت',
        price: 20),
    Service(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30),
  ]),
  Order(id: '224', orderStatus: OrderStatus.recieved,
   services: [
    Service(
        serviceId: '1',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'كنزة',
        price: 20),
    Service(
        serviceId: '2',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'بنطلون',
        price: 45),
    Service(
        serviceId: '3',
        serviceType: [
          'كوي',
        ],
        item: 'كنزة',
        price: 20),
    Service(
        serviceId: '4',
        serviceType: [
          'غسيل',
        ],
        item: 'جاكيت',
        price: 20),
    Service(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30),
  ]),
  Order(
      id: '6567',
      orderStatus: OrderStatus.onWay_to_deliver_to_client,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),
  Order(
      id: '213',
      orderStatus:
          OrderStatus.pending_acceptance_from_delivery_to_recieve_from_laundry,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),
  Order(id: '112', orderStatus: OrderStatus.ready_to_deliver, services: [
    Service(
        serviceId: '1',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'كنزة',
        price: 20),
    Service(
        serviceId: '2',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'بنطلون',
        price: 45),
    Service(
        serviceId: '3',
        serviceType: [
          'كوي',
        ],
        item: 'كنزة',
        price: 20),
    Service(
        serviceId: '4',
        serviceType: [
          'غسيل',
        ],
        item: 'جاكيت',
        price: 20),
    Service(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30),
  ]),
    Order(
      id: '46',
      orderStatus: OrderStatus.ready_to_deliver,
      orderType:OrderType.oneWay,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),
  Order(id: '33', orderStatus: OrderStatus.processing, services: [
    Service(
        serviceId: '1',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'كنزة',
        price: 20),
    Service(
        serviceId: '2',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'بنطلون',
        price: 45),
    Service(
        serviceId: '3',
        serviceType: [
          'كوي',
        ],
        item: 'كنزة',
        price: 20),
    Service(
        serviceId: '4',
        serviceType: [
          'غسيل',
        ],
        item: 'جاكيت',
        price: 20),
    Service(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30),
  ]),
  Order(id: '464', orderStatus: OrderStatus.pre_processing, services: [
    Service(
        serviceId: '1',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'كنزة',
        price: 20),
    Service(
        serviceId: '2',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'بنطلون',
        price: 45),
    Service(
        serviceId: '3',
        serviceType: [
          'كوي',
        ],
        item: 'كنزة',
        price: 20),
    Service(
        serviceId: '4',
        serviceType: [
          'غسيل',
        ],
        item: 'جاكيت',
        price: 20),
    Service(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30),
  ]),
  Order(
      id: '67',
      orderStatus: OrderStatus.onWay_to_deliver_to_laundry,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),
  Order(
      id: '3211',
      orderStatus: OrderStatus.onWay_to_recieve_from_client,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),
  Order(
      id: '334',
      orderStatus: OrderStatus.pending_acceptance_delivery,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),
  Order(
      id: '56',
      orderStatus: OrderStatus.pending_laundry_acceptance,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),
  Order(
      id: '64',
      orderStatus: OrderStatus.pending_laundry_acceptance,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),
  Order(
      id: '46',
      orderStatus: OrderStatus.pending_laundry_acceptance,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),

        Order(
      id: '46',
      orderStatus: OrderStatus.pending_laundry_acceptance,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),
       Order(
      id: '46',
      orderStatus: OrderStatus.onWay_to_recieve_from_laundry,
      orderType:OrderType.twoWay,
      services: [
        Service(
            serviceId: '1',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '2',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'بنطلون',
            price: 45),
        Service(
            serviceId: '3',
            serviceType: [
              'كوي',
            ],
            item: 'كنزة',
            price: 20),
        Service(
            serviceId: '4',
            serviceType: [
              'غسيل',
            ],
            item: 'جاكيت',
            price: 20),
        Service(
            serviceId: '5',
            serviceType: [
              'غسيل',
              'كوي',
            ],
            item: 'طقم',
            price: 30),
      ]),
];
