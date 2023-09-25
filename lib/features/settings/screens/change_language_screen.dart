import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/core/managers/languages_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/values_manager.dart';
import 'package:saudi_clean_services_owner/features/localization/cubit/lacalization_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLanguageScreen extends StatelessWidget {
  static const routeName = 'change_language_screen';
  const ChangeLanguageScreen({super.key});
  final languages = LanguagesManager.appLanguages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.change_language),
      ),
      body: BlocBuilder<LacalizationCubit, LacalizationState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: ListView(

              children: languages
                  .map(
                    (l) => RadioListTile<String>(
                      value: l,
                      groupValue: state.locale.languageCode,
                      onChanged: (value) {
                        BlocProvider.of<LacalizationCubit>(context).changeLanguage(value!);
                      },
                      title: Text(
                        LanguagesManager.getLanguageText(
                          l,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
