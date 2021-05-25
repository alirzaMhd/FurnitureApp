import 'package:flutter/material.dart';

import '../screens/details.dart';
import '../screens/home.dart';
import '../ar/measurement_ar.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
      case '/detail':
        return MaterialPageRoute(
          builder: (_) => Details(
          ),
        );
      case '/measurement_ar':
        return MaterialPageRoute(
          builder: (_) => Details(
          ),
        );
      case '/test_ar':
        return MaterialPageRoute(
          builder: (_) => Details(
          ),
        );
      default:
        return null;
    }
  }
}
