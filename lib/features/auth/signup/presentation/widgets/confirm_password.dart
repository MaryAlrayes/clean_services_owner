import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/ui/widgets/custom_text_field.dart';
import '../bloc/bloc/signup_bloc.dart';

class ConfirmPassword extends StatelessWidget {
  const ConfirmPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.text,
        hintText: AppLocalizations.of(context)!.confirm_password,
        iconData: (Icons.lock),
        onChanged: (String? value){
          BlocProvider.of<SignupBloc>(context).add(ConfirmPasswordChangedEvent(confirmPassword: value!));
        },
        validator: (String? value) {
          if (value != null) {
            if (value.isEmpty) {
              return AppLocalizations.of(context)!.this_field_cannot_be_empty;
            } else {
              return null;
            }
          }
        },
        isObscure: true);
  }
}
