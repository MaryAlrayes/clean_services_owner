import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/ui/widgets/custom_label.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';

class DiscountField extends StatelessWidget {
  DiscountField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.discount_percentage),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  textInputAction: TextInputAction.done,
                  textInputType:
                      const TextInputType.numberWithOptions(decimal: true),
                  isNumber: true,
                  hintText: '0.0',
                  validator: (String? value) {
                    if (value!.isEmpty) {}
                    return null;
                  },
                  onChanged: (String? value) {
                    if (value != null) {
                      if (double.tryParse(value) != null) {}
                    }
                  },
                  isObscure: false),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              '%',
              style: getRegularStyle(
                color: Colors.black,
                fontSize: FontSize.s17,
              ),
            )
          ],
        ),
      ],
    );
  }
}
