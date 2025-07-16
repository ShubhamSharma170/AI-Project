import 'package:ai_project/pages/home/home_page.dart';
import 'package:ai_project/pages/onboard_page/onboard_page.dart';
import 'package:ai_project/routes/route_name/route_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      case RoutesName.onboard:
        return MaterialPageRoute(builder: (BuildContext context) => OnboardPage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
