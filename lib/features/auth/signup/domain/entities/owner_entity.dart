// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final String name;
  final String phone;
  final String city;
  final String password;
  final String confirmPassword;
  const OwnerEntity({
    required this.name,
    required this.phone,
    required this.city,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        city,
        password,
        confirmPassword,
      ];


 }
