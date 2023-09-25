import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/managers/assets_manager.dart';
import '../../../../../core/managers/color_manager.dart';
import '../../../../../core/managers/font_manager.dart';
import '../../../../../core/managers/styles_manager.dart';
import '../../../../../core/managers/values_manager.dart';
import '../../../../../core/network/check_internet.dart';
import '../../../../../core/ui/widgets/custom_label.dart';
import '../../../../../core/utils/helpers/form_submission_state.dart';
import '../../../../../core/utils/helpers/snackbar.dart';
import '../../../../drawer_navigation/presentation/screens/homepage_screen.dart';
import '../../../common%20presentation/language_drop_down.dart';
import '../../data/data%20sources/owner_remote_data_source.dart';
import '../../data/repositories/owner_repo_impl.dart';
import '../../domain/use%20cases/signup_usecase.dart';
import '../bloc/bloc/signup_bloc.dart';
import '../widgets/confirm_password.dart';
import '../widgets/confirm_terms.dart';
import '../widgets/location_drop_down.dart';
import '../widgets/name_field.dart';
import '../widgets/password_field.dart';
import '../widgets/phone_field.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = 'signup_screen';
  SignupScreen({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(
        signupUseCase: SignupUseCase(
          ownerRepo: OwnerRepoImpl(
            ownerRemoteDataSource:
                OwnerRemoteDataSourceWithHttp(client: Client()),
            networkInfo: NetworkInfoImpl(
              internetConnectionChecker:
                  InternetConnectionChecker.createInstance(),
            ),
          ),
        ),
      ),
      child: Builder(builder: (context) {
        return BlocListener<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state.formSubmissionState is FormNoInternetState) {
              showSnackbar(
                  context, AppLocalizations.of(context)!.no_internet_msg);
            } else if (state.formSubmissionState is FormNetworkErrorState) {
              showSnackbar(context,
                  ' \n ${(state.formSubmissionState as FormNetworkErrorState).message} ${AppLocalizations.of(context)!.something_wrong_happened_try_again}');
            } else if (state.validation == SignupValidation.cityNotSelected) {
              showSnackbar(
                  context, AppLocalizations.of(context)!.please_choose_city);
            } else if (state.validation ==
                SignupValidation.passwordsNotMatched) {
              showSnackbar(
                  context,
                  AppLocalizations.of(context)!
                      .please_make_sure_passwords_equals);
            } else if (state.validation ==
                SignupValidation.checkTermsNotSelected) {
              showSnackbar(
                  context, AppLocalizations.of(context)!.please_accept_terms);
            } else if (state.formSubmissionState is FormSuccesfulState) {
              showSnackbar(context, 'Done');
            }
          },
          child: Scaffold(
            body: Container(
              color: ColorManager.primary,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildBackground(context),
                      _buildCard(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Container _buildCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p18),
      decoration: _getContainerDecoration(),
      child: _buildSignupCard(
        context,
      ),
    );
  }

  Container _buildBackground(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top) *
          0.30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: _buildTitleIntro(context),
          ),
          const Positioned(
            right: 4,
            top: 4,
            child: LanguageDropDown(),
          ),
        ],
      ),
    );
  }

  FittedBox _buildTitleIntro(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AssetsManager.app_logo,
                width: 90,
                height: 90,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          FittedBox(
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.app_name,
                  style: getBoldStyle(
                    color: Colors.black,
                    fontSize: FontSize.s24,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  AppLocalizations.of(context)!.saudi,
                  style: getBoldStyle(
                    color: Colors.white,
                    fontSize: FontSize.s24,
                  ),
                ),
              ],
            ),
          ),
          Text(
            AppLocalizations.of(context)!.sign_up_welcome,
            style: getRegularStyle(
              color: Colors.white,
              fontSize: FontSize.s16,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }

  BoxDecoration _getContainerDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 0),
          blurRadius: 0.5,
          spreadRadius: 1,
          color: Colors.black12,
        ),
      ],
    );
  }

  Widget _buildSignupCard(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildNameField(context),
          const SizedBox(
            height: 12,
          ),
          _buildPhoneField(context),
          const SizedBox(
            height: 12,
          ),
          _buildLocationField(context),
          const SizedBox(
            height: 12,
          ),
          _buildPasswordField(context),
          const SizedBox(
            height: 12,
          ),
          _buildConfirmPasswordField(context),
          const SizedBox(
            height: 12,
          ),
          _buildConfirmTerms(),
          _buildSubmitBtn(context),
        ],
      ),
    );
  }

  Widget _buildLabel(String label) {
    return CustomLabel(
      text: label,
    );
  }

  Widget _buildNameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLabel(AppLocalizations.of(context)!.laundry_name),
        const SizedBox(
          height: 4,
        ),
        const NameField(),
      ],
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppLocalizations.of(context)!.phone_number),
        const SizedBox(
          height: 4,
        ),
        const PhoneField(),
      ],
    );
  }

  Widget _buildLocationField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLabel(AppLocalizations.of(context)!.laundry_location),
        const SizedBox(
          height: 4,
        ),
        const LocationDropDown(),
      ],
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppLocalizations.of(context)!.password),
        const SizedBox(
          height: 4,
        ),
        const PasswordField(),
      ],
    );
  }

  Widget _buildConfirmPasswordField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppLocalizations.of(context)!.confirm_password),
        const SizedBox(
          height: 4,
        ),
        const ConfirmPassword(),
      ],
    );
  }

  Widget _buildSubmitBtn(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        if (state.formSubmissionState is FormSubmittingState) {
          return const CircularProgressIndicator();
        }
        return ElevatedButton(
          onPressed: () {
            final isValid = formkey.currentState!.validate();
            if (isValid) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomepagScreen.routeName,
                (route) => false,
              );
            }
          },
          child: Text(AppLocalizations.of(context)!.create_account),
        );
      },
    );
  }

  Widget _buildConfirmTerms() {
    return const ConfirmTerms();
  }
}
