  
import 'package:flutter/material.dart';
import 'package:querido_diario/app/utils/routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Querido Diário',
            // theme: AppTheme.lightTheme,
            // themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            routerDelegate: routes.routerDelegate,
            routeInformationParser: routes.routeInformationParser,
            routeInformationProvider: routes.routeInformationProvider,
          );
  }
}