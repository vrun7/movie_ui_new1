import 'package:flutter/material.dart';
import 'package:movie_ui_new/core/route/app_route.dart';
import 'package:movie_ui_new/core/route/app_route_name.dart';
import 'package:movie_ui_new/screens/signup_screen.dart';
import 'package:movie_ui_new/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Theater App',
      initialRoute: AppRouteName.home,
      onGenerateRoute: AppRoute.generate,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
