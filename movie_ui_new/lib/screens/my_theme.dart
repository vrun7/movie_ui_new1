import 'package:flutter/material.dart';

class MyTheme {
  static const splash = Color.fromRGBO(0, 172, 105, 1);
  static const statusBar = Color(0xFF2E3147);
  static const appBarColor = Color(0xFF222539);
  static const greenColor = Color(0xFF2EC492);
  static const orangeColor = Color(0xFFEB8D2F);
  static const greyColor = Color(0xFFF4F4F4);
  static const transparent = Color.fromRGBO(0, 0, 0, 0);
  static const blueBorder = Color(0xFF3164CE);
  static const redBorder = Color(0xFFF14336);
  static const redLight = Color(0xFFFFF1F0);
  static const blueLight = Color(0xFFF5F9FF);
  static List<Color> redGiftGradientColors = [
    const Color(0xFFFCCAC6).withOpacity(0.3),
    const Color(0xFFDB5449).withOpacity(0.3),
  ];
  static List<Color> greenGiftGradientColors = [
    const Color(0xFF89D980).withOpacity(0.3),
    const Color(0xFF34BA25).withOpacity(0.3),
  ];
  static List<Color> blackgreenbackground = [
    const Color(0XFF1B5E20).withOpacity(1),
    const Color(0xffffe).withOpacity(1),
  ];
  static const redTextColor = Color(0xFFD05045);
  static const greenTextColor = Color(0xFF8CC153);

  static final myLightTheme = ThemeData(
    primaryColor: splash,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleMedium:
          TextStyle(color: Colors.white.withOpacity(0.7), inherit: true),
    ),
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.light(
        surface: splash,
        primary: splash,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: appBarColor,
    ),
    colorScheme: ColorScheme.light(surface: Colors.white),
  );

  static final myDarkTheme = ThemeData(
    primaryColor: splash,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: appBarColor,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.dark(
        surface: splash,
        primary: splash,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: appBarColor,
    ),
    colorScheme: ColorScheme.light(surface: appBarColor),
  );
}
