import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/managers/values_manager.dart';
import 'package:saudi_clean_services_owner/features/drawer_navigation/presentation/widgets/custom_drawer.dart';
import 'package:saudi_clean_services_owner/features/settings/screens/change_language_screen.dart';
import 'package:saudi_clean_services_owner/features/settings/screens/change_password_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings_nav),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: ListView(children: [

          ListTile(
            onTap: () { Navigator.pushNamed(context, ChangePasswordScreen.routeName);},
            leading: const Icon(
              Icons.lock,
            ),
            title: Text(AppLocalizations.of(context)!.change_password),
            trailing:const Icon(Icons.arrow_forward_ios),
          ),
        const  Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, ChangeLanguageScreen.routeName);
            },
            leading: const Icon(
              Icons.language,
            ),
            title: Text(AppLocalizations.of(context)!.language),
            trailing:const Icon(Icons.arrow_forward_ios),
          )
        ]),
      ),
    );
  }
}
