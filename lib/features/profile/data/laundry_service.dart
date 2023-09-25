// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:saudi_clean_services_owner/features/orders/data/service.dart';
import 'package:saudi_clean_services_owner/features/profile/data/basic_service.dart';

class LaundryService {
  final String id;
  final String item;
  final List<BasicService> service;
  final ItemWeight serviceType;
  LaundryService({
    required this.id,
    required this.item,
    required this.service,
    required this.serviceType,
  });
}

final List<LaundryService> myServices = [
  LaundryService(
      id: '1',
      item: 'كنزة',
      service: [
        BasicService(service: 'غسيل', price: 20),
        BasicService(service: 'كوي', price: 10)
      ],
      serviceType: ItemWeight.light),
  LaundryService(
      id: '2',
      item: 'جاكيت',
      service: [
        BasicService(service: 'غسيل', price: 20),
        BasicService(service: 'كوي', price: 10)
      ],
      serviceType: ItemWeight.light),
  LaundryService(
      id: '3',
      item: 'بنطلون',
      service: [
        BasicService(service: 'غسيل', price: 20),
        BasicService(service: 'كوي', price: 10)
      ],
      serviceType: ItemWeight.light),
  LaundryService(
      id: '4',
      item: 'سجاد',
      service: [
        BasicService(service: 'غسيل', price: 20),
      ],
      serviceType: ItemWeight.heavy),
];
