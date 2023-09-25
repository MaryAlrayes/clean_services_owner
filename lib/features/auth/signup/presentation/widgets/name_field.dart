import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services_owner/features/auth/signup/presentation/bloc/bloc/signup_bloc.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.text,
        hintText: AppLocalizations.of(context)!.laundry_name,
        iconData: (Icons.phone),
        onChanged: (String? value){
          BlocProvider.of<SignupBloc>(context).add(NameChangedEvent(name: value!));
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
        isObscure: false);
  }
}
