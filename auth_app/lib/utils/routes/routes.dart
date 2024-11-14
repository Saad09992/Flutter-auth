import 'package:auth_app/pages/home_page.dart';
import 'package:auth_app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import './routes_name.dart';
import '../../pages/sign_up_page.dart';
import '../../pages/login_page.dart';

class Routes {
  // generateRoute method
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // the settings contain the route and displays the page accrdingly
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpPage());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashPage());
      // display this if route is invalid
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
