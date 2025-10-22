import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optex_app/core/config/database/app_database.dart';
import 'package:optex_app/common/helper/navigation/routes.dart';
import 'package:optex_app/core/config/theme/app_theme.dart';
import 'package:optex_app/di.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:optex_app/common/bloc/locale_cubit.dart';
import 'package:optex_app/common/bloc/locale_state.dart';
import 'package:optex_app/l10n/app_localizations.dart';
import 'package:optex_app/presentation/home/bloc/product_cubit.dart';

import 'package:optex_app/presentation/home/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.instance.database;
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProductCubit>()..fetchProducts()),
        BlocProvider(create: (_) => sl<LocaleCubit>()),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, localeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: const MainScreen(),
            locale: localeState.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: Routes.main,
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
          );
        },
      ),
    );
  }
}