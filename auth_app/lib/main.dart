import 'package:auth_app/provider/auth_provider.dart';
import 'package:auth_app/utils/routes/routes.dart';
import 'package:auth_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)),
        initialRoute: RoutesName.signup,
        // sends current/changed route to generateRoute method in Routes class
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
