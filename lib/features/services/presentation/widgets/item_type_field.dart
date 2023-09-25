
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/ui/widgets/custom_label.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../bloc/bloc/add_service_bloc.dart';
import '../bloc/bloc/edit_service_bloc.dart';

class ItemTypeField extends StatelessWidget {
  final String? initValue;
  ItemTypeField({super.key, this.initValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.item_type),
        CustomTextField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!.item_type,
            initalValue: initValue,
            validator: (String? value) {},
            onChanged: (String? value) {
              if (value != null) {
                if (initValue == null) {
                  BlocProvider.of<AddServiceBloc>(context)
                      .add(ItemChangedEvent(item: value));
                } else {
                  BlocProvider.of<EditServiceBloc>(context)
                      .add(ItemChangedEditEvent(item: value));
                }
              }
            },
            isObscure: false)
      ],
    );
  }
}
