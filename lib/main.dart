import 'package:flutter/material.dart';
import 'package:furniture_app/screens/main_screen.dart';
import 'package:furniture_app/util/const.dart';
import 'router/app_router.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme:  Constants.darkTheme,
      home: MainScreen(),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
