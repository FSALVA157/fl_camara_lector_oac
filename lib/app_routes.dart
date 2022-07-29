import 'package:fl_oac/models/route_model.dart';
import 'package:fl_oac/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static const initialRoute = "home";

  static final optionsMenu = <RouteModel>[
    RouteModel(route: 'home', icon: Icons.home, name: "Home Screen", screen: HomeScreen()),
    RouteModel(route: 'formulario', icon: Icons.camera, name: "Form Screen", screen: FormScreen()),
    RouteModel(route: 'login', icon: Icons.login, name: "Login Screen", screen: LoginScreen()),
    RouteModel(route: 'scan', icon: Icons.qr_code, name: "Scan Screen", screen: ScanScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final item in optionsMenu) {
        appRoutes.addAll({
          item.route: (BuildContext context) => item.screen
        });
    }
     return appRoutes; 
    }

  static Route<dynamic> onGenerateRoute(RouteSettings setting){
    return MaterialPageRoute(builder: (context){
      return const HomeScreen();
    });
  }
}