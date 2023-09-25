// ignore_for_file: public_member_api_docs, sort_constructors_first
class Service {
  final String serviceId;
  final String item;
  final List<String> serviceType;
  final int count=3;
  final double price;
  Service({
    required this.serviceId,
    required this.serviceType,
    required this.item,
    required this.price,
  });
}
