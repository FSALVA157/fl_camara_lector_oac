import 'package:fl_oac/app_routes.dart';
import 'package:fl_oac/providers/data_form_provider.dart';
import 'package:fl_oac/themes/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataFormProvider()
          )
      ],
      child: MyApp(),
      );
  }
}

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