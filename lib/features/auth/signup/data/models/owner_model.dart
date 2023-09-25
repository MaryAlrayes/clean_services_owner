import 'package:saudi_clean_services_owner/features/auth/signup/domain/entities/owner_entity.dart';

class OwnerModel extends OwnerEntity {
  const OwnerModel({
    required super.name,
    required super.phone,
    required super.city,
    required super.password,
    required super.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userName': name,
      'phoneNumber': phone,
      'city': city,
      'password': password,
      'location': {'cityName': city}
      //'confirmPassword': confirmPassword,
    };
  }

  factory OwnerModel.fromJson(Map<String, dynamic> map) {
    return OwnerModel(
      name: map['name'] as String,
      phone: map['phone'] as String,
      city: map['city'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
    );
  }
}
