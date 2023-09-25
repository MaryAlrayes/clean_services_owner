import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/background.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_text_field.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_label.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const routeName = 'change_password_screen';
  ChangePasswordScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.change_password,
        ),
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildOldPassword(context),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildNewPassword(context),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildConfirmPassword(context),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildBtns(context)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _buildOldPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.old_password),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!.old_password,
            iconData: Icons.lock,
            validator: (value) {
              if (value != null) {}
            },
            isObscure: true)
      ],
    );
  }

  Column _buildNewPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.new_password),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!.new_password,
            iconData: Icons.lock,
            validator: (value) {
              if (value != null) {}
            },
            isObscure: true)
      ],
    );
  }

  Column _buildConfirmPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.confirm_new_password),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!.confirm_new_password,
            iconData: Icons.lock,
            validator: (value) {
              if (value != null) {}
            },
            isObscure: true)
      ],
    );
  }

  Widget _buildBtns(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: Text(AppLocalizations.of(context)!.done),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.grey,
            ),
            child: Text(AppLocalizations.of(context)!.cancel)),
      ],
    );
  }
}
