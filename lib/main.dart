import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/routes/app_router.dart';
import 'core/managers/theme_manager.dart';
import 'core/utils/services/shared_preferences.dart';
import 'features/auth/login/presentation/screens/login_screen.dart';
import 'features/drawer_navigation/bloc/cubit/drawer_navigation_cubit.dart';
import 'features/localization/cubit/lacalization_cubit.dart';
import 'features/localization/localize_app_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.init();
  await Future.delayed(const Duration(seconds: 3));
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LacalizationCubit(
            LocalizeAppImpl(),
          )..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => DrawerNavigationCubit(),
        ),
      ],
      child: BlocBuilder<LacalizationCubit, LacalizationState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Saudi Clean Services Laundry Side',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            theme: getApplicationThemeData(),
            initialRoute: LoginScreen.routeName,
            onGenerateRoute: appRouter.onGenerateRoute,

          );
        },
      ),
    );
  }
}
