import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services_owner/features/auth/signup/presentation/bloc/bloc/signup_bloc.dart';

class ConfirmTerms extends StatefulWidget {
  const ConfirmTerms({super.key});

  @override
  State<ConfirmTerms> createState() => _ConfirmTermsState();
}

class _ConfirmTermsState extends State<ConfirmTerms> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: isChecked,
            onChanged: (value) {
              BlocProvider.of<SignupBloc>(context)
                  .add(CheckTermsChangedEvent(isChecked: value!));

              setState(() {
                isChecked = !isChecked;
              });
            }),
        Text(AppLocalizations.of(context)!.i_agree),
        const SizedBox(
          width: 6,
        ),
        Text(
          AppLocalizations.of(context)!.conditions_terms,
          style: getBoldStyle(color: ColorManager.primary).copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
