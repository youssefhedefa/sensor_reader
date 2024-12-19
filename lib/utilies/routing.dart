import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sensor_reader/theme/theme_manager.dart';
import 'package:sensor_reader/widgets/auth/first_view.dart';
import 'package:sensor_reader/widgets/auth/log_in_view.dart';
import 'package:sensor_reader/widgets/auth/sign_in_view.dart';
import 'package:sensor_reader/widgets/dash_board/dashboard_view.dart';

class RoutingManager {
  final ThemeManager themeManager;
  static const String first = '/first';
  static const String signIn = '/sign_in';
  static const String logIn = '/log_in';
  static const String dashboard = '/dashboard';

  RoutingManager({required this.themeManager});

  checkStartPoint() {
    if (FirebaseAuth.instance.currentUser != null) {
      return dashboard;
    } else {
      return first;
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case first:
        return MaterialPageRoute(
          builder: (context) => const FirstView(),
        );
      case signIn:
        return MaterialPageRoute(
          builder: (context) => const SignInView(),
        );
      case logIn:
        return MaterialPageRoute(
          builder: (context) => const LogInView(),
        );
      case dashboard:
        return MaterialPageRoute(
          builder: (context) => DashboardView(
            themeManager: themeManager,
          ),
        );
      default:
        return null;
    }
  }
}
