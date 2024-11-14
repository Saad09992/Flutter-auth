import 'package:auth_app/utils/routes/routes.dart';
import 'package:auth_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)),

      initialRoute: RoutesName.splash,
      // sends current/changed route to generateRoute method in Routes class
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
