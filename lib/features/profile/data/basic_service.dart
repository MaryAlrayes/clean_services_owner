// ignore_for_file: public_member_api_docs, sort_constructors_first
class BasicService {
  final String service;
  final double price;
  BasicService({
    required this.service,
    required this.price,
  });
  factory BasicService.empty(){
    return BasicService(price:0,service: '');
  }
   factory BasicService.ignore(){
    return BasicService(price:double.infinity,service: 'null');
  }

  @override
  String toString() => 'BasicService(service: $service, price: $price)';
}
