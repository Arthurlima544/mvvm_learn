import 'package:flutter/material.dart';
import 'package:mvvm_learn/routing/router.dart';
import 'package:mvvm_learn/ui/core/localization/applocalization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mvvm_learn/ui/core/themes/theme.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        AppLocalizationDelegate(),
      ],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router(), // context.read()
      //scrollBehavior
    );
  }
}
