import 'package:flutter/material.dart';
import 'package:movie_ui_new/core/route/app_route_name.dart';
import 'package:movie_ui_new/feature/Home/presentation/home_screen.dart';
import 'package:movie_ui_new/feature/Moviebooking/presentation/movie_booking_screen.dart';
import 'package:movie_ui_new/feature/movie_detail/presentation/movie_detail.dart';
import 'package:movie_ui_new/screens/signup.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.signuppage:
        return MaterialPageRoute(
          builder: (_) => const signupform(),
          settings: settings,
        );
      case AppRouteName.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      case AppRouteName.movieDetail:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const MovieDetailScreen(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.movieBooking:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const MovieBookingScreen(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
    }
    return null;
  }
}
