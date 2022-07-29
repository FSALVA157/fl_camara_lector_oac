import 'package:fl_oac/app_routes.dart';
import 'package:fl_oac/providers/data_form_provider.dart';
import 'package:fl_oac/themes/global_theme.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oficina de Ciudadanos',
      theme: GlobalTheme.lightTheme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      //onGenerateInitialRoutes: (setting) => AppRoutes.onGenerateRoute(setting),
    );
  }
}