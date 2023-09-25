import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/core/managers/languages_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:saudi_clean_services_owner/features/localization/cubit/lacalization_cubit.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LacalizationCubit, LacalizationState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          width: 50,
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              child: DropdownButton<String>(
                iconSize: 0,
                value: state.locale.languageCode,
                items: LanguagesManager.appLanguages
                    .map(
                      (e) => _buildDropMenuItem(e),
                    )
                    .toList(),
                onChanged: ((value) {
                  BlocProvider.of<LacalizationCubit>(context)
                      .changeLanguage(value!);
                }),
                selectedItemBuilder: (context) {
                  return _getItemBuilder(state);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _getItemBuilder(LacalizationState state) {
    return LanguagesManager.appLanguages
        .map(
          (e) => Container(
            width: 50,
            alignment: Alignment.center,
            child: Text(
              LanguagesManager.getLanguageText(state.locale.languageCode),
              style: getBoldStyle(
                color: Colors.white,
              ).copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        )
        .toList();
  }

  DropdownMenuItem<String> _buildDropMenuItem(String e) {
    return DropdownMenuItem(
      value: e,
      child: Container(
        alignment: Alignment.center,
        width: 50,
        child: Text(
          LanguagesManager.getLanguageText(e),
          style: getRegularStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
