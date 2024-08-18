import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_ui_new/screens/loginpage_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    //to run at a time when open
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutExpo,
        reverseCurve: Curves.bounceIn);
    _animationController.forward();
    Timer(
        const Duration(milliseconds: 4000),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginPage())));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent)); //status bar color where time,wifi
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 330,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 3)),
          child: Center(
              child: ScaleTransition(
                  scale: _animation, child: Image.asset("assets/logo1.png"))),
        ),
      ),
    );
  }
}
