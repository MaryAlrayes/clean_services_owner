// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class NameChangedEvent extends SignupEvent {
  final String name;
  const NameChangedEvent({
    required this.name,
  });
  @override
  List<Object> get props => [name];
}

class PhoneChangedEvent extends SignupEvent {
  final String phone;
  const PhoneChangedEvent({
    required this.phone,
  });
  @override
  List<Object> get props => [phone];
}

class CityChangedEvent extends SignupEvent {
  final String city;
  const CityChangedEvent({
    required this.city,
  });
  @override
  List<Object> get props => [city];
}

class PasswordChangedEvent extends SignupEvent {
  final String password;
  const PasswordChangedEvent({
    required this.password,
  });
  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChangedEvent extends SignupEvent {
  final String confirmPassword;
  const ConfirmPasswordChangedEvent({
    required this.confirmPassword,
  });
  @override
  List<Object> get props => [confirmPassword];
}

class CheckTermsChangedEvent extends SignupEvent {
  final bool isChecked;
  const CheckTermsChangedEvent({
    required this.isChecked,
  });
@override

  List<Object> get props => [isChecked];
}

class SubmitEvent extends SignupEvent{}
