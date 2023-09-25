part of 'signup_bloc.dart';
enum SignupValidation{
  init,
  cityNotSelected,
  checkTermsNotSelected,
  passwordsNotMatched,

}
class SignupState extends Equatable {
  final String name;
  final String phone;
  final String city;
  final String password;
  final String confirmPassword;
  final bool isChecked;
  final SignupValidation validation;
  final FormSubmissionState formSubmissionState;
  const SignupState({
    required this.name,
    required this.phone,
    required this.city,
    required this.password,
    required this.confirmPassword,
    required this.isChecked,
    required this.validation,
    required this.formSubmissionState,
  });

  factory SignupState.empty() {
    return const SignupState(
        name: '',
        phone: '',
        city: '',
        password: '',
        confirmPassword: '',
        isChecked: false,
        validation: SignupValidation.init,
        formSubmissionState: InitialFormState());
  }

  @override
  List<Object> get props => [
        name,
        phone,
        city,
        password,
        confirmPassword,
        isChecked,
        validation,
        formSubmissionState,
      ];

  SignupState copyWith(
      {String? name,
      String? phone,
      String? city,
      String? password,
      String? confirmPassword,
      bool? isChecked,
      SignupValidation ? validation,
      FormSubmissionState? formSubmissionState}) {
    return SignupState(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        city: city ?? this.city,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        isChecked: isChecked ?? this.isChecked,
        validation: validation?? this.validation,
        formSubmissionState: formSubmissionState ?? this.formSubmissionState);
  }
}
