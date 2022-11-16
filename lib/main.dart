import 'package:exercises_app/core/routes/routes.dart';
import 'package:exercises_app/core/themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceXLaunches',
      initialRoute: "/",
      theme: Themes.lightTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
