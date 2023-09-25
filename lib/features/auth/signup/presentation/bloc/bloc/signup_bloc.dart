import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/utils/helpers/form_submission_state.dart';
import '../../../domain/entities/owner_entity.dart';
import '../../../domain/use%20cases/signup_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase signupUseCase;
  SignupBloc({
    required this.signupUseCase,
  }) : super(SignupState.empty()) {
    on<NameChangedEvent>((event, emit) {
      emit(state.copyWith(
          name: event.name,
          validation: SignupValidation.init,
          formSubmissionState: const InitialFormState()));
    });
    on<PhoneChangedEvent>((event, emit) {
      emit(state.copyWith(
          phone: event.phone,
          validation: SignupValidation.init,
          formSubmissionState: const InitialFormState()));
    });
    on<CityChangedEvent>((event, emit) {
      emit(state.copyWith(
          city: event.city,
          validation: SignupValidation.init,
          formSubmissionState: const InitialFormState()));
    });
    on<PasswordChangedEvent>((event, emit) {
      emit(state.copyWith(
          password: event.password,
          validation: SignupValidation.init,
          formSubmissionState: const InitialFormState()));
    });
    on<ConfirmPasswordChangedEvent>((event, emit) {
      emit(state.copyWith(
          confirmPassword: event.confirmPassword,
          validation: SignupValidation.init,
          formSubmissionState: const InitialFormState()));
    });
    on<CheckTermsChangedEvent>((event, emit) {
      emit(state.copyWith(
          isChecked: event.isChecked,
          validation: SignupValidation.init,
          formSubmissionState: const InitialFormState()));
    });

    on<SubmitEvent>((event, emit) async {
      emit(state.copyWith(formSubmissionState: FormSubmittingState()));

      if (state.city == '') {
        emit(state.copyWith(
            validation: SignupValidation.cityNotSelected,
            formSubmissionState: const InitialFormState()));
      } else if (!state.isChecked) {
        emit(state.copyWith(
            validation: SignupValidation.checkTermsNotSelected,
            formSubmissionState: const InitialFormState()));
      } else if (state.password != state.confirmPassword) {
        emit(state.copyWith(
            validation: SignupValidation.passwordsNotMatched,
            formSubmissionState: const InitialFormState()));
      } else {
        final result = await signupUseCase.call(OwnerEntity(
            name: state.name,
            phone: state.phone,
            city: state.city,
            password: state.password,
            confirmPassword: state.confirmPassword));

        result.fold(
          (failure) => emit(
              state.copyWith(formSubmissionState: _mapFailureToState(failure))),
          (u) =>
              emit(state.copyWith(formSubmissionState: FormSuccesfulState())),
        );
      }
    });
  }

  FormSubmissionState _mapFailureToState(Failure f) {
    switch (f.runtimeType) {
      case OfflineFailure:
        return FormNoInternetState();

      case NetworkErrorFailure:
        return FormNetworkErrorState(
          message: (f as NetworkErrorFailure).message,
        );

      default:
        return const FormNetworkErrorState(
          message: 'Error',
        );
    }
  }
}
